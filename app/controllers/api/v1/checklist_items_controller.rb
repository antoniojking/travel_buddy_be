class Api::V1::ChecklistItemsController < ApplicationController
  def index
    checklist = Checklist.find(params[:checklist_id])
    render(json: ChecklistItemSerializer.new(checklist.checklist_items))
  end

  def create
    checklist = Checklist.find(params[:checklist_id])
    checklist_item = ChecklistItem.create!(checklist_item_params)
    render(json: ChecklistItemSerializer.new(checklist_item))
  end

  def update
    if name_not_missing?
      checklist = Checklist.find(params[:checklist_id])
      checklist_item = ChecklistItem.update(params[:id], checklist_item_params)
      render(json: ChecklistItemSerializer.new(checklist_item))
    else
      render(json: ErrorSerializer.params_missing_error, status: :bad_request)
    end
  end

  def destroy
    checklist_item = ChecklistItem.find(params[:id])
    checklist_item.destroy
  end

  private

  def checklist_item_params
    params.permit(:name, :checklist_id, :user_id, :user_email)
  end

  def name_not_missing?
    params[:name].present?
  end
end
