require_relative 'gem_version'

module DoorkeeperSequel
  # Returns the version of the currently loaded ActiveRecord as a <tt>Gem::Version</tt>
  def self.version
    gem_version
  end
end
