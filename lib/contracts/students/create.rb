class Contracts::Students::Create < Contracts::BaseContract
  def schema
    required(:first_name, :string)
    required(:last_name, :string)
    required(:surname, :string)
    required(:klass_id, :integer)
    required(:school_id, :integer)
  end
end
