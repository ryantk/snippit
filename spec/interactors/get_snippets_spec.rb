require 'spec_helper'
require 'interactors/get_snippets'
require 'boundaries/request_model'

describe GetSnippets do

  class DummyRepository
    def get_all(args = {})
      if args[:user_id].nil?
        [1, 2, 3]
      else
        [1, 2]
      end
    end
  end

  describe '#execute' do
    it 'returns all snippets from the SnippetsRepository in a response model' do
      repository = DummyRepository.new
      subject = GetSnippets.new(snippets_repository: repository)

      response = subject.execute
      expect(response.result).to eq(repository.get_all)
    end

    it 'can take a user_id in a request model and only return snippets by that user' do
      cirteria = { user_id: 1 }
      repository = DummyRepository.new
      request = RequestModel.new(cirteria)
      subject = GetSnippets.new(snippets_repository: repository, request_model: request)

      response = subject.execute
      expect(response.result).to eq(repository.get_all(cirteria))
    end
  end

end