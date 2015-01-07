module AjaxValidation
  class ApplicationController < ActionController::Base

    def validate
      model = params.first[0].classify.constantize
      if params[:id].present?
        object = model.find(params[:id])
        object.update_attributes(validate_param)
      else
        object = model.new(validate_param)
      end
      validator(object)
      respond_to do |format|
        format.json {
          render json: @errors
        }
      end
    end

    private

    def validate_param
      params.require(params.first[0].to_sym).permit(params.first[1].keys.first.to_sym)
    end

    def validator(object)
      object.valid?
      model = object.class.name.underscore.to_sym
      field = params[model].first[0]
      @errors = object.errors[field]

      if @errors.empty?
        @errors = true
      else
        name = t("activerecord.attributes.#{model}.#{field}")
        @errors.map! { |e| "#{name} #{e}<br />" }
      end
    end

  end
end
