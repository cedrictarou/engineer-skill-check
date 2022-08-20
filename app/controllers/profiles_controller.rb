class ProfilesController < ApplicationController
  before_action :set_employee
  before_action :set_profile, only: %i[show edit update]

  def index
    @page_title = 'プロフィールページ'
  end

  def new
    @page_title = '新規プロフィール作成ページ'
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to employees_url, notice: 'プロフィールを登録しました。'
    else
      render :new
    end
  end

  def show; end

  def edit
    @page_title = 'プロフィール編集ページ'
  end

  def update
    if @profile.update(profile_params)
      redirect_to employees_url, notice: 'プロフィールを更新しました。'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:profile).merge(employee_id: params['employee_id'])
  end

  def set_employee
    @employee = Employee.find(params['employee_id'])
  end

  def set_profile
    @profile = @employee.profiles.active.first
  end
end
