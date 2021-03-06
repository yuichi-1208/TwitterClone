class MouthsController < ApplicationController
  before_action :set_mouth, only: [:show, :edit, :update, :destroy]

  def index
    @mouths = Mouth.all
  end

  def new
      @mouth = Mouth.new
  end

  def create
    @mouth = Mouth.new(mouth_params)
    if params[:back]
      render :new
    else
      if @mouth.save
        redirect_to mouths_path, notice: "投稿しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @mouth.update(mouth_params)
      redirect_to mouths_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @mouth.destroy
    redirect_to mouths_path, notice: "削除しました！"
  end

  def confirm
    @mouth = Mouth.new(mouth_params)
    render :new if @mouth.invalid?
  end

  private
  def mouth_params
    params.require(:mouth).permit(:content)
  end

  def set_mouth
    @mouth = Mouth.find(params[:id])
  end
end
