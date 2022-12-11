namespace :dev do

    desc "Adiciona as lotações"
  task add_workspace: :environment do
    Workspace.create(title: "Recursos Humanos")
    Workspace.create(title: "Administrativo Financeiro")
    Workspace.create(title: "Comercial")
    Workspace.create(title: "Marketing")
  end

  desc "Adiciona os cargos"
  task add_job_role: :environment do
    JobRole.create(title: "Estagiario")
    JobRole.create(title: "Diretor")
    JobRole.create(title: "Vice Diretor")
    JobRole.create(title: "Colaborador")
  end

end