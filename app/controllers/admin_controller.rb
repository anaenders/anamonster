class AdminController < ApplicationController
  
  before_filter :authenticate_user!
  
  def update_field
    (id, field_type) = params[:field_id].split('_', 2)
    obj = eval(params[:type]).find_by_id(id)
    obj.update_attribute(field_type, params[:value])
    val = obj.send(field_type)
    if params[:is_bool]
      val = val ? 'Yes' : 'No'
    end
    render :text => val
  end
  
end