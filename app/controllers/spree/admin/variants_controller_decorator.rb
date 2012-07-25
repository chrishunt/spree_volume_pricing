Spree::Admin::VariantsController.class_eval do
  before_filter :setup_new_volume_price, :only => [:edit, :volume_prices]

  def load_resource_instance
    parent

    if new_actions.include?(params[:action].to_sym)
      build_resource
    elsif params[:id]
      ::Spree::Variant.find(params[:id])
    end
  end

  def volume_prices
    @product = @variant.product
  end

  def setup_new_volume_price
    @variant.volume_prices.build if @variant.volume_prices.blank?
  end
end
