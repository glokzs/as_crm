# frozen_string_literal: true

class Admin::ClausesController < Admin::AdminController
  def index
    @clauses = Clause.all
  end

  def show
    @clause = Clause.find(params[:id])
  end

  def new
    @clause = Clause.new
    @sections = Section.all
  end

  def create
    @clause = Clause.new(clause_params)
    if @clause.save
      redirect_to admin_template_path(1)
    else
      render 'new'
    end
  end

  def edit
    @clause = Clause.find(params[:id])
    @sections = Section.all
  end

  def update
    @clause = Clause.find(params[:id])
    if @clause.update(clause_params)
      redirect_to admin_template_path(1)
    else
      render 'new'
    end
  end

  private

  def clause_params
    params.require(:clause).permit(:number, :body, :section_id)
  end
end
