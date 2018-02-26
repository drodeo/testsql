class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Получения всех уникальных статусов задач, отсортированных по алфавиту
  def status_uniq_sorted
    Task.select(:status).distinct.order(status: :asc).pluck(:status)
  end

  #Получения кол-ва задач в каждом из проектов с сортировкой проектов по кол-ву задач по убыванию
  def quantity_tasks
    Project.left_joins(:tasks).select("COUNT(*)  as summ").group(:project_id).order('summ DESC').to_a.map(&:summ)
  end

  #Получения кол-ва задач в каждом проекте, с сортировкой проектов по названию
  def quantity_tasks1
    Project.left_joins(:tasks).select(:id,:name,"COUNT(*)  as summ").group(:project_id).order('projects.name ASC').to_a.map(&:summ)
# id, name - для проверки
  end

  #Получения задач для всех проектов с именем, начинающимся на 'N'

  def all_task_N
    Task.where('name like ?',"N%").to_a
  end

  #Получения всех проектов, у которых есть символ 'a' в середине названия и отображения кол-ва задач для каждого проекта. Учтите, что могут быть проекты без задач и задачи с project_id = NULL
  def all_task_include_a
    tmp = Project.where('name like ?',"%a%").to_a
    Task.where(project_id: tmp).group(:project_id).count
  end

  #Получения списка задач с дублирующимися именами, отсортированных по алфавиту
  def dublicate_tasks
    Task.select(:name).group(:name).having("count(*) > 1").size
  end
end
