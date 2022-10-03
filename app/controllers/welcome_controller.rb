class WelcomeController < ApplicationController
  def index
    @posts = params[:query] ? Post.where('title like ?', "%#{params[:query]}%") : Post.all
    respond_to do |format|
      format.html {}
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('results', partial: 'welcome/results')
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    render turbo_stream: turbo_stream.replace('show_content', partial: 'welcome/show')
  end
end
