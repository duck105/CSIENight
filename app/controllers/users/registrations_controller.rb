class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  #def create
  #  super 
  #end

  # GET /resource/edit
  def edit
    @ranknumber = current_user.count_rank
    @number = Judge.where("user_id = ? AND state = ?", current_user.id, 1).count
    @submissions = Submission.where("user_id = ? ", current_user.id).last(10).reverse
    @submit_questions = Array.new(15)
    @questions = Question.all

    @submissions.each_with_index do |s, i|
      q = Question.find(s.question_id)
      @submit_questions[i] = q 
    end

    judge = current_user.judges.all
    @judges = Array.new(@questions.count+1)
    judge.each do |j|
      @judges[j.question_id] = j.state  
    end

    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  protected
  
  def update_resource(resource, params)
    if params[:current_password].blank? && params[:password].blank?
      resource.update_without_password(params.except(:current_password))
    else
      super
    end
  end
end
