RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
    unless current_user.admin?
      flash[:alert] = I18n.t('admin.flash.access_denied')
      redirect_to main_app.root_path
    end
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.label_methods = [:title, :email]

  config.included_models = ['User','Gallery',
                            'Type','Type::Translation',
                            'State','State::Translation',
                            'Role','Role::Translation',
                            'VisitorOption','VisitorOption::Translation',
                            'DataType','DataType::Translation',
                            'DataItem','DataItem::Translation',
                            'PictureType','PictureType::Translation']

  config.model 'User' do
    exclude_fields :created_at, :updated_at
  end

  config.model 'Gallery' do
    exclude_fields :created_at, :updated_at
  end

  config.model 'Type' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at
  end

  config.model 'Type::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

  config.model 'State' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at
  end

  config.model 'State::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

  config.model 'Role' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at, :type
  end

  config.model 'Role::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

  config.model 'VisitorOption' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at, :type
  end

  config.model 'VisitorOption::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

  config.model 'DataType' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at, :type
  end

  config.model 'DataType::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

  config.model 'DataItem' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at, :type
  end

  config.model 'DataItem::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

  config.model 'PictureType' do
    configure :translations, :globalize_tabs
    exclude_fields :created_at, :updated_at, :type
  end

  config.model 'PictureType::Translation' do
    visible false
    configure :locale, :hidden do
      help ''
    end
    include_fields :locale, :title, :description
  end

end
