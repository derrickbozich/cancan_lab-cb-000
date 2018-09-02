class NotesController < ApplicationController


  def new

  end

  def create
    if logged_in?
      binding.pry
      # @note = Note.new(:content => params[:note][:content], :user_id => session[:user_id], :visible_to => params[:note][:visible_to])
      # @note = Note.new(note_params)
      @note = current_user.notes.build(note_params)
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
    @note = Note.find_by_id(params[:id])
    @note.update(note_params)

  end

  def destroy

  end

  private

  def note_params
    # params.require(:note).permit(:content, :users_attributes)
    params.require(:note).permit(:content, :visible_to)

  end


end
