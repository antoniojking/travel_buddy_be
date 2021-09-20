class Api::V1::ChecklistItemsController < ApplicationController
  def index
    checklist = Checklist.find(params[:checklist_id])
    render(json: ChecklistItemSerializer.new(checklist.checklist_items))
  end

  def create
    checklist = Checklist.find(params[:checklist_id])
    checklist_item = ChecklistItem.create!(name: params[:name], user_id: params[:user_id], checklist_id: checklist.id)
    render(json: ChecklistItemSerializer.new(checklist_item))
  end
end
