require 'securerandom'

# Limpiar datos anteriores
Appointment.destroy_all
Review.destroy_all
QuestionAnswer.destroy_all
Post.destroy_all
Doctor.destroy_all
User.destroy_all

# Usuarios
users = [
  { email: "doctorm@gmail.com", name: "Juan", last_name: "Perez", role: "doctor" },
  { email: "doctors@gmail.com", name: "Laura", last_name: "Martinez", role: "doctor" },
  { email: "user1@gmail.com", name: "Carlos", last_name: "Gomez", role: nil },
  { email: "user2@gmail.com", name: "Ana", last_name: "Diaz", role: nil }
]

users.each do |user_data|
  generated_password = '123456'
  User.create!(
    user_data.merge(
      password: generated_password,
      password_confirmation: generated_password
    )
  )
end

# Doctores
mental_health_doctor = Doctor.create!(
  user_id: User.find_by(email: "doctorm@gmail.com").id,
  specialty: "Psicólogo",
  license: "LIC#{rand(1000..9999)}"
)

sexual_health_doctor = Doctor.create!(
  user_id: User.find_by(email: "doctors@gmail.com").id,
  specialty: "Sexólogo",
  license: "LIC#{rand(1000..9999)}"
)

# Posts de Salud Mental
mental_health_posts = [
  { title: "5 pasos para manejar la ansiedad", content: "La ansiedad puede ser abrumadora, pero existen pasos prácticos como la respiración profunda, la meditación y el ejercicio regular para aliviarla." },
  { title: "Cómo mejorar la autoestima", content: "La autoestima se construye a través del autoconocimiento, la aceptación personal y la práctica de pensamientos positivos." },
  { title: "Beneficios de la meditación diaria", content: "La meditación diaria puede reducir el estrés, mejorar la concentración y promover una sensación de calma y bienestar." },
  { title: "La importancia de la salud mental en el trabajo", content: "Aprender a manejar el estrés laboral y establecer límites saludables es clave para preservar nuestra salud mental." },
  { title: "Técnicas de relajación para el insomnio", content: "Probar técnicas como la relajación muscular progresiva y la visualización puede ayudar a combatir el insomnio." },
  { title: "Cómo identificar y manejar la depresión", content: "Es crucial reconocer los síntomas de la depresión y buscar ayuda profesional a tiempo." },
  { title: "El impacto de las redes sociales en la salud mental", content: "Un uso consciente de las redes sociales puede prevenir problemas como la ansiedad o el estrés social." },
  { title: "Mindfulness: Vivir en el presente", content: "El mindfulness nos ayuda a centrarnos en el aquí y el ahora, reduciendo el estrés y mejorando nuestra calidad de vida." },
  { title: "Cómo apoyar a un ser querido con ansiedad", content: "Escuchar sin juzgar y ofrecer apoyo emocional son claves para ayudar a alguien con ansiedad." },
  { title: "Ejercicio físico y su efecto en la salud mental", content: "El ejercicio regular libera endorfinas que ayudan a combatir el estrés y mejoran nuestro estado de ánimo." }
]

mental_health_posts.each do |post_data|
  Post.create!(
    title: post_data[:title],
    category: "Salud Mental",
    doctor_id: mental_health_doctor.id,
    content: post_data[:content]
  )
end

# Posts de Salud Sexual
sexual_health_posts = [
  { title: "Importancia de la comunicación en la pareja", content: "Hablar abiertamente sobre temas sexuales fortalece la confianza y la conexión emocional." },
  { title: "Cómo mejorar la intimidad en la relación", content: "La intimidad se nutre con tiempo de calidad, comunicación efectiva y muestras de afecto." },
  { title: "Mitos comunes sobre la sexualidad", content: "Desmentir mitos como 'el deseo sexual disminuye inevitablemente con los años' nos ayuda a tener una vida sexual más plena." },
  { title: "Consejos para una vida sexual saludable", content: "Mantener una dieta equilibrada, hacer ejercicio y reducir el estrés contribuyen a una vida sexual satisfactoria." },
  { title: "El impacto del estrés en la sexualidad", content: "El estrés puede afectar la libido, pero técnicas como el mindfulness y el yoga pueden ayudar a reducir su impacto." },
  { title: "Cómo abordar la disfunción sexual", content: "Buscar ayuda profesional es clave para superar problemas como la disfunción eréctil o la falta de deseo." },
  { title: "Salud sexual y envejecimiento", content: "Con el envejecimiento, es importante adaptar hábitos saludables para mantener una vida sexual activa." },
  { title: "La importancia del consentimiento", content: "El consentimiento es esencial para cualquier relación sexual saludable y respetuosa." },
  { title: "Cuidando la salud sexual masculina", content: "Visitar al urólogo regularmente y llevar un estilo de vida saludable son fundamentales." },
  { title: "Cuidando la salud sexual femenina", content: "Realizar chequeos ginecológicos anuales y mantener una buena higiene íntima son pasos importantes." }
]

sexual_health_posts.each do |post_data|
  Post.create!(
    title: post_data[:title],
    category: "Salud Sexual",
    doctor_id: sexual_health_doctor.id,
    content: post_data[:content]
  )
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

# Verificación de resultados
puts "Usuarios creados: #{User.count}"
puts "Doctores creados: #{Doctor.count}"
puts "Posts de Salud Mental creados: #{Post.where(category: 'Salud Mental').count}"
puts "Posts de Salud Sexual creados: #{Post.where(category: 'Salud Sexual').count}"
puts "Appointments creados: #{Appointment.count}"
puts "Preguntas y respuestas creadas: #{QuestionAnswer.count}"
