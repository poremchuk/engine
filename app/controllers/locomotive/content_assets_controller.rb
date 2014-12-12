module Locomotive
  class ContentAssetsController < BaseController

    respond_to :json, only: [:create, :bulk_create]

    before_filter :load_content_assets, only: :index
    before_filter :load_content_asset,  only: :destroy

    def index
      authorize Locomotive::ContentAsset
      respond_with(@content_assets) do |format|
        format.html { render_index }
      end
    end

    def create
      authorize Locomotive::ContentAsset
      @content_asset = current_site.content_assets.create(params[:content_asset])
      respond_with @content_asset, location: content_assets_path
    end

    def bulk_create
      @content_assets = service.bulk_create(params[:content_assets])
      respond_with @content_assets, location: content_assets_path
    end

    def destroy
      authorize @content_asset
      @content_asset.destroy
      respond_with(@content_asset) do |format|
        format.html do
          load_content_assets
          render_index
        end
      end
    end

    private

    def load_content_assets
      @content_assets = service.list(params.slice(:types, :query, :page, :per_page))
    end

    def load_content_asset
      @content_asset = self.current_site.content_assets.find(params[:id])
    end

    def render_index
      render request.xhr? ? 'index_in_drawer' : 'index', layout: !request.xhr?
    end

    def service
      @service ||= Locomotive::ContentAssetsService.new(current_site)
    end

  end
end
