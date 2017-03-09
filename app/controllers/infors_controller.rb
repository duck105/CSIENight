class InforsController < ApplicationController
  def index
    @infors = Infor.order("updated_at DESC").limit(30)
  end
end
