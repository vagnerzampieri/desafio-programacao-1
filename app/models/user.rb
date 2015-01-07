class User < ActiveRecord::Base
  def self.find_or_create_omniauth(auth)
    find_or_create_by(
      provider: auth['provider'],
      uid:      auth['uid'],
      name:     auth['info']['name']
    )
  end
end
