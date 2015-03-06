class Xpto < ActiveRecord::Base
  def create_xpto # just a random name :P
    embedded_server
    ensure_site_is_referenced_from_server
    save
  end

  private

  def embed_server_attributes
    if server.present?
      self.embedded_server = self.
        server.attributes.slice('host', 'database', 'user', 'username', 'port', 'server_type')
    end
  end

  def ensure_site_is_referenced_from_server
    unless site
      self.site = self.server.site
    end
  end
end
