# In your seed file:

require 'securerandom'

# Limpiar datos anteriores
Appointment.destroy_all
Review.destroy_all
QuestionAnswer.destroy_all
Post.destroy_all
Doctor.destroy_all
Question.destroy_all
User.destroy_all

# Usuarios
users = [
  { email: "doctorm@gmail.com", name: "Juan", last_name: "Perez", role: "doctor", password: 123456 },
  { email: "doctors@gmail.com", name: "Laura", last_name: "Martinez", role: "doctor", password: 123456 },
  { email: "user1@gmail.com", name: "Carlos", last_name: "Gomez", role: "patient", password: 123456 },
  { email: "user2@gmail.com", name: "Ana", last_name: "Diaz", role: "patient", password: 123456 }
]

users.each do |user_data|
  User.create!(user_data)
end

# Doctores
mental_health_doctor = Doctor.create!(user: User.find_by(email: "doctorm@gmail.com"), specialty: "Psicólogo", license: "LIC152643", address: "Av. de las Américas 1049, La Victoria 15034, Perú")
sexual_health_doctor = Doctor.create!(user: User.find_by(email: "doctors@gmail.com"), specialty: "Sexólogo", license: "LIC123456", address: "Av. Carlos Izaguirre 126, Independencia 15311, Perú")

# Dummy photo path
dummy_image_path = Rails.root.join('app', 'assets', 'images', 'default_user.jpg')

# Posts de Salud Mental
mental_health_posts = [
  { title: "5 pasos para manejar la ansiedad", content: "La ansiedad puede ser abrumadora, pero existen pasos prácticos como la respiración profunda, la meditación y el ejercicio regular para aliviarla." },
  { title: "Cómo mejorar la autoestima", content: "La autoestima se construye a través del autoconocimiento, la aceptación personal y la práctica de pensamientos positivos." },
  { title: "Beneficios de la meditación diaria", content: "La meditación diaria puede reducir el estrés, mejorar la concentración y promover una sensación de calma y bienestar." },
  # More posts...
]

mental_health_posts.each do |post_data|
  post = Post.new(
    title: post_data[:title],
    category: "Salud Mental",
    doctor_id: mental_health_doctor.id,
    content: post_data[:content]
  )
  post.skip_photo_validation = true  # Skip validation during seeding
  post.photos.attach(io: File.open(dummy_image_path), filename: 'default_user.jpg', content_type: 'image/jpg')
  post.save!
end

# Posts de Salud Sexual
sexual_health_posts = [
  { title: "Importancia de la comunicación en la pareja", content: "Hablar abiertamente sobre temas sexuales fortalece la confianza y la conexión emocional." },
  { title: "Cómo mejorar la intimidad en la relación", content: "La intimidad se nutre con tiempo de calidad, comunicación efectiva y muestras de afecto." },
  # More posts...
]

sexual_health_posts.each do |post_data|
  post = Post.new(
    title: post_data[:title],
    category: "Salud Sexual",
    doctor_id: sexual_health_doctor.id,
    content: post_data[:content]
  )
  post.skip_photo_validation = true  # Skip validation during seeding
  post.photos.attach(io: File.open(dummy_image_path), filename: 'default_user.jpg', content_type: 'image/jpg')
  post.save!
end

# Crear 3 appointments para cada usuario sin rol
User.where(role: "patient").each do |user|
  3.times do
    appointment_date = Time.now + rand(1..10).days
    appointment_time = appointment_date.change(hour: rand(9..18), min: rand(0..59), sec: 0)

    Appointment.create!(
      date: appointment_date,
      time: appointment_time,
      status: "Pendiente",
      details: "Detalles de la cita asignada al usuario.",
      doctor_id: Doctor.all.sample.id,
      user_id: user.id
    )
  end
end

puts "Seeding complete!"
