class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: questions_formatted_for_openai # to code as private method
      }
    )
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question })
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def questions_formatted_for_openai
    questions = @question.user.questions
    results = []

    system_text = "You will answer questions associated with the posts. If you don't know the information, respond with 'I don't know'. The website includes psychologists and sexologists. Provide the links to the posts where the information is sourced from. Below are the relevant posts:\n\n"
    # to nearest_products code as private method
    nearest_posts.each do |post|
      post_url = Rails.application.routes.url_helpers.post_url(post, host: "http://localhost:3000") # Cambia "yourwebsite.com" por tu dominio
      system_text += "[#{post.title}](#{post_url}): #{post.content}\n"
    end
    results << { role: "system", content: system_text }

    questions.each do |question|
      results << { role: "user", content: question.user_question }
      results << { role: "assistant", content: question.ai_answer || "" }
    end

    return results
  end

  def nearest_posts
    response = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: @question.user_question
      }
    )
    question_embedding = response['data'][0]['embedding']
    return Post.nearest_neighbors(
      :embedding, question_embedding,
      distance: "euclidean"
    ) # you may want to add .first(3) here to limit the number of results
  end
end
