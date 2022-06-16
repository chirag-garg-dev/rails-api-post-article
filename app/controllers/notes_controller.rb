class NotesController < ApplicationController

	def index
    notes = Note.paginate(page: params[:page], per_page: 5)
   	currrent_url = notes_url(page: params[:page])
    new_url = notes_url(page: params[:page].to_i + 1)
    data = {currrent_url: currrent_url, new_url: new_url, notes: notes}
    render json: data, status: :ok  
  end

  def create   
    note = Note.create!(note_params)    
    render json: note, status: :ok  
  end

  def update
    note = Note.find(params[:id])

    if note.update(note_params)
      render json: note , status: :ok  
    end
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    render json: note, status: :ok  
  end

  def note_params    
    params.require(:note).permit(:name, :title, :description, :avatar) 
  end
end
