require 'boundaries/response_model'
require 'boundaries/request_model'

class GetSnippets
  attr_reader :snippets_repository, :request_model

  def initialize(args = {})
    @snippets_repository = args.fetch(:snippets_repository)
    @request_model       = args.fetch(:request_model, RequestModel.new)
  end

  def execute
    results = snippets_repository.get_all(request_model.criteria)
    ResponseModel.new(results)
  end

end