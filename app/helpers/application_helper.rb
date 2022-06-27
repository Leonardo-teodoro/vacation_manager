module ApplicationHelper
  def raw_icon(name, content)
    raw("<i class=\"bi bi-" + name+ "\">  "+content+"</i>")
  end
  
  def date_in_Ptbr(date)
    I18n.l(date, format: :long)
  end
end
