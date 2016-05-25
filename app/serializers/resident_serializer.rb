class ResidentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :calendar, :phase
end
