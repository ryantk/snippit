class Repository

  def self.for(type)
    repositories[type]
  end

  def self.register(type, repository)
    repositories[type] = repository
  end

  def self.repositories
    @repositories ||= {}
  end

end