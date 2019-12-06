RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.model 'Word' do 
    object_label_method do
      :custom_label_method_for_word
    end

    configure :name do
      label "Lexique"
    end
    list do
      field :name do
        label "nom"
      end
      field :translation do
        label "traduction"
      end 
      field :category do
        label "catégorie"
      end
    end
  end

  config.model 'Article' do |config|
    object_label_method do
      :custom_label_method_for_article
    end
  end

  config.model 'Word' do
    object_label_method do
      :custom_label_method_for_word
    end
  end

  def custom_label_method_for_word
    "Mots"
  end

  def custom_label_method_for_article
    "Articles"
  end

end