class CreateStudentContract < ApplicationContract
  params do
    required(:first_name).filled(:string)
    required(:last_name).maybe(:string)
    required(:surname).maybe(:string)
    required(:klass_id).filled(:integer)
    required(:school_id).filled(:integer)
  end
end
