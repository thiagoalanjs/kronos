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

  def alert_for(flash_type){
       success: 'ui success message',
       alert: 'ui negative message',
       notice: 'ui negative message',  
       warning: 'ui negative message'
      }[flash_type.to_sym] || flash_type.to_s
  end
 
end
