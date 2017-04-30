class RelationshipsController < ApplicationController

  def create
    @relationship = current_user.relationships.create(relationship_params)
  end


private
  def relationship_params
    params.require(:relationship).permit(:from_id, :to_id, :relationship_type)
  end
end
