require 'spec_helper'

describe ApplicationHelper do
  describe "#full_title" do
    context 'with one argument passed' do
      it "will return that page's title" do
        expect(helper.full_title('test')).to eql("Devex | test")
      end
    end

    context 'with no arguments' do
      it "will return home page title" do
        expect(helper.full_title()).to eql("Devex")
      end
    end
  end
end