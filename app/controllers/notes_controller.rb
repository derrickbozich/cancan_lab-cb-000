class NotesController < ApplicationController
  def new

  end

  def create
    if logged_in?
      @note = Note.new(:content => params[:note][:content], :user_id => session[:user_id], :visible_to => params[:note][:visible_to])
      if @note.save
        redirect_to '/'
      else
        redirect_to new_note_path
      end
    else
      redirect_to '/'
    end

  end

  def index
    @notes = Note.all
  end

  def show

  end

  def edit

  end

  def update
    binding.pry
  end

  def destroy

  end

  private

  def note_params
    params.require(:note).permit(:content, :users_attributes)
  end


end
