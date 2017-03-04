class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w(www admin)
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  get 'pages/:page' => 'pages#show', as: 'page'

  constraints SubdomainConstraint do
    # when given subdomain, root path is contacts
    root to: 'contacts#index'
    resources :contacts
  end
  resources :users
  # when admin subdomain, show user list
  constraints subdomain: 'admin' do
    root to: 'users#index'
  end
  # when no subdomain, go user list
  root to: 'users#index'
end
