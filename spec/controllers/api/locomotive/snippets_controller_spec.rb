# require 'spec_helper'

# module Locomotive
#   module Api
#     describe SnippetsController do

#       let(:site)      { create(:site, domains: %w{www.acme.com}) }
#       let!(:snippet)  { create(:snippet, site: site) }
#       let(:account)   { create(:account) }

#       let!(:membership) do
#         create(:membership, account: account, site: site, role: 'admin')
#       end

#       before do
#         request_site site
#         sign_in account
#       end

#       describe "#GET index" do
#         subject { get :index, locale: :en, format: :json }
#         it {  is_expected.to be_success }
#       end

#       describe "#GET show" do
#         subject { get :show, id: snippet.id, locale: :en, format: :json }
#         it {  is_expected.to be_success }
#       end

#       describe "#POST create" do
#         let(:snippet_attributes) { attributes_for(:snippet, site: site) }

#         subject do
#           post :create, locale: :en, snippet: snippet_attributes, format: :json
#         end

#         it {  is_expected.to be_success }
#         specify do
#           expect { subject }.to change(Locomotive::Snippet, :count).by(+1)
#         end
#       end

#       describe "#PUT update" do
#         let(:new_name) { generate(:name) }

#         subject do
#           put :update, id: snippet.id, locale: :en, snippet: { name: new_name }, format: :json
#         end
#         it {  is_expected.to be_success }
#         specify do
#           expect(JSON.parse(subject.body).fetch('name')).to eq(new_name)
#         end
#       end

#       describe "#DELETE destroy" do
#         subject do
#           delete :destroy, id: snippet.id, locale: :en, format: :json
#         end
#         it {  is_expected.to be_success }
#         specify do
#           expect { subject }.to change(Locomotive::Snippet, :count).by(-1)
#         end
#       end

#     end
#   end
# end
