module GroupsHelper
  def created_by
    render(inline: "Creator: <strong>#{current_user.name}</strong>")
  end

  def total_amount(model)
    render(inline: "Total amount: <strong><i>$</i>#{model.amount || 0}</strong>")
  end

  def check_icon(icon)
    icon.strip == '' ? 'money.png' : icon
    icon.strip == '' ? 'car.png' : icon
    icon.strip == '' ? 'food.png' : icon
    icon.strip == '' ? 'health.jpg' : icon
  end
end
