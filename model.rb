class Model
  require 'grit'
  require 'colored'

  attr_accessor :content_body, :content_title

  def initialize(options={})
  end

  def repo
    @repo ||= Grit::Repo.new('.')
  end

  def commits
    repo.commits
  end

  def changed_files
    repo.status.files.keys
  end

  def author
    @author ||= Grit::Actor.new("Nick DeSteffen", "nick.desteffen@gmail.com")
  end

  def add_all
    repo.add("./content")
  end

  def commit
    repo.commit_index("Grit committing - #{Time.now}")
  end

  def push
    `git push origin master`
  end

end

