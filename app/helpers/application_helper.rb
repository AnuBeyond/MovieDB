module ApplicationHelper
  def email_to_name(email)
    name = email[/[^@]+/]
    name.split(".").map {|n| n.capitalize }.join(" ")
  end
end
