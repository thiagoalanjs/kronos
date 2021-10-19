module ApplicationHelper
  def is_active?(page_name)
    "active" if params[:action] == page_name
  end

  def is_current_page?(path)
    'active' if current_page?(path)
  end

  def status_labels
    return {1 => 'Pendente', 2 => 'Desenvolvimento', 3 => 'Code Review', 4 => 'QA', 5 => 'Concluída'}
  end
end
