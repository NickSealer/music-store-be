module Api
  module V1
    class ItemsController < Api::V1::ApplicationController
      before_action :item, only: %i[show update destroy]

      def colors
        colors ||= Rails.cache.fetch("colors-#{Time.zone.now}", expires_in: 1.day) { Item::COLORS }
        render json: { data: colors }, status: :ok
      end

      def index
        items ||= Rails.cache.fetch("items_#{Time.zone.now}", expires_in: 2.hours) do
          ItemsQuery.all.paginate(page: params[:page], per_page: 10)
        end

        render json: {
          data: items,
          metadata: {
            current_page: items.current_page,
            per_page: items.per_page,
            total_entries: items.total_entries,
            total_pages: items.total_pages,
            next_page: items.next_page,
            previous_page: items.previous_page
          }
        }, status: :ok
      end

      def show
        return render json: { }, status: :not_found if item.blank?

        render json: { data: item }, status: :ok
      end

      def create
        item = ItemFactory.create(item_params)
        return render json: { error: item.errors }, status: :unprocessable_entity unless item.save

        render json: { data: item }, status: :created
      end

      def update
        return render json: { error: item.errors }, status: :unprocessable_entity unless item.update(item_params)

        render json: { data: item }, status: :ok
      end

      def destroy
        item.destroy

        render json: { }, status: :ok
      end

      private

      def item
        @item ||= ItemsQuery.find(id: params[:id])
      end

      def item_params
        params.require(:item).permit(:name, :description, :category, :color, :status, :listing)
      end
    end
  end
end
