require 'securerandom'
Appointment.destroy_all
Review.destroy_all
QuestionAnswer.destroy_all
Post.destroy_all
Doctor.destroy_all
User.destroy_all
# Usuarios
users = [
  { email: "pedro@gmail.com", name: "Pedro", last_name: "Lopez", role: "doctor" },
  { email: "ana@gmail.com", name: "Ana", last_name: "Martinez", role: "doctor" },
  { email: "luis@gmail.com", name: "Luis", last_name: "Gomez", role: "doctor" },
  { email: "maria@gmail.com", name: "Maria", last_name: "Diaz", role: nil },
  { email: "jose@gmail.com", name: "Jose", last_name: "Hernandez", role: nil }
]

users.each do |user_data|
  generated_password = '123456' # Genera una contraseña aleatoria
  User.create!(
    user_data.merge(
      password: generated_password,
      password_confirmation: generated_password # Asegúrate de usar la misma contraseña
    )
  )
end

# Doctores
specialties = ["Psicólogo", "Sexólogo"]
User.where(role: "doctor").each do |user|
  Doctor.create!(
    user_id: user.id,
    specialty: specialties.sample,
    license: "LIC#{rand(1000..9999)}"
  )
end

# Posts por doctor
Doctor.all.each do |doctor|
  10.times do |i|
    Post.create!(
      title: "Post #{i + 1} del Doctor #{doctor.user.name}",
      category: ["Salud Mental", "Relaciones"].sample,
      doctor_id: doctor.id,
      content: "Contenido del post #{i + 1}."
    )
  end
end

# Appointments
2.times do
  Appointment.create!(
    date: Time.now + rand(1..10).days,
    status: ["pending", "completed"].sample,
    details: "Detalles del appointment.",
    doctor_id: Doctor.all.sample.id,
    user_id: User.where(role: nil).sample.id
  )
end

# Preguntas y respuestas
Post.all.sample(4).each do |post|
  QuestionAnswer.create!(
    question: "¿Pregunta sobre el post #{post.title}?",
    answer: "Respuesta a la pregunta.",
    user_id: User.where(role: nil).sample.id,
    post_id: post.id
  )
end
