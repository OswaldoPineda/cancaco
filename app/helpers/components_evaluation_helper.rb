module ComponentsEvaluationHelper
  def navbar_and_footer?(current_controller, current_action)
    controller_action = [['devise/sessions', 'new'], ['devise/sessions', 'create'],
                         ['registrations', 'new'], ['registrations', 'create'],
                         ['confirmations', 'registration'], ['devise/passwords', 'new'],
                         ['devise/passwords', 'create'], ['devise/passwords', 'edit'],
                         ['devise/passwords', 'update'], ['devise/confirmations', 'new'],
                         ['devise/confirmations', 'create'], ['errors', 'not_found'],
                         ['errors', 'permission_denied'], ['errors', 'internal_server_error']]

    controller_action.each do |controller, action|
      return false if (controller == current_controller) && (action == current_action)
    end
    true
  end

  def notice?(current_controller, current_action)
    return false if (current_controller == '/confirmations') && (current_action == 'registration')

    true
  end
end
