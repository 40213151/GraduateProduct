class JobsController < ApplicationController
  before_action :authenticate_farmer!, only: [:new, :create, :edit, :update]
  before_action :set_job, only: [:show, :edit, :update]
  
  def index
    @jobs = Job.all
     # パラメータとしてnameを受け取っている場合は絞って検索する
    if params[:name].present?
      @jobs = @jobs.get_by_name params[:name]
    end
    if params[:place].present?
      @jobs = @jobs.get_by_place params[:place]
    end
    if params[:date].present?
      @jobs = @jobs.get_by_date params[:date]
    end
    if params[:price_perhour].present?
      @jobs = @jobs.get_by_price_perhour params[:price_perhour]
    end
  end


  def show
  end

  def new
    # 現在のユーザーのお仕事の作成
    @job = current_farmer.jobs.build
    @job.job_images.build
  end

  def create
    # パラメーターとともに現在の農家のお仕事を作成
    @job = current_farmer.jobs.build(job_params)
    
    if @job.save
      redirect_to jobs_path(@job), notice: "お仕事を掲載しました"
    else
      redirect_to new_job_path(@job), notice: "失敗しました、やりなおしてください"
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path(@job), notice: "お仕事を掲載しました"
    end
  end
    
  def search
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
  end
  
  private
  def job_params
    params.require(:job).permit(:name, :place, :date, :price_perhour, :description, :character, job_images_images: [])
  end

  def set_job
    @job = Job.find(params[:id]) 
  end

end
