module Staff::RepliesHelper
  def staff_list(list)
    list.map(&:email)
  end
end
