class NotesController < ApplicationController

	def index
    notes = Note.all    
   	render json: notes, status: :ok  
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
