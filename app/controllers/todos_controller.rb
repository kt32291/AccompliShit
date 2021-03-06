class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!


  # GET /todos
  # GET /todos.json
  def index
    @user = current_user
    @all_users = User.all.order(:points)
    @todos = @user.todos
    @todo = Todo.new
    @orgs = @todos.where(category: "org")
    @fits = @todos.where(category: "fit")
    @works = @todos.where(category: "work")
    @plays = @todos.where(category: "play")
  end

  def dashboard
    @user = current_user
    @todos = @user.todos
    @todo = Todo.new
  end

  def one
    @user = current_user
    @todos = @user.todos.shuffle
    @todo = Todo.new
  end

  def list
    @user = current_user
    @todos = @user.todos.order(:content)
    @todo = Todo.new
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @user = current_user
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    @todos = @user.todos.order(:content)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to list_path, notice: 'Todo was successfully created.' }
        format.json { render json: @todo, status: :created }
        format.js {}
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @user = current_user
    @todo.destroy
    @user.change_points(6)
    respond_to do |format|
      format.html { redirect_to list_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:content, :category)
    end
end
