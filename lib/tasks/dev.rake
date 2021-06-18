namespace :dev do
  DEFAULT_PASSWORD = 123456
  desc "Setting up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") {%x(rails db:drop)}
           
      show_spinner("Criando BD...") {%x(rails db:create)}
      
      show_spinner("Migrando o BD...") {%x(rails db:migrate)}
        
      show_spinner("Cadastrando Employee padrão...") {%x(rails dev:add_default_employee)}

      show_spinner("Populando o Banco de Dados...") {%x(rails db:seed)}
    else
      puts "Você não está no ambiente de desenvolvimento"
    end
  end

  desc "Cadastrando Employee padrã"
    task add_default_employee: :environment do
        employee = Employee.new(
            name:  Faker::Name.name,
            email: "john.doe@example.com",
            password: DEFAULT_PASSWORD,
            password_confirmation: DEFAULT_PASSWORD,
            
        )
        employee.save!
    end

  private
        def show_spinner(msg_start, msg_end = "Concluido")
            spinner = TTY::Spinner.new("[:spinner) #{msg_start}", format: :dots_9)
            spinner.auto_spin
            yield
            spinner.success("#{msg_end}")
        end

end
