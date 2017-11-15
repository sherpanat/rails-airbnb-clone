module FamilyHelper
  def find_family(family_id)
    Family.find(family_id)
  end
end
