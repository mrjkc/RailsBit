class CreateUserpanels < ActiveRecord::Migration
  def change
    create_table :userpanels do |t|
      t.integer :user_id
      t.string :user_video
      t.boolean :html_video
      t.boolean :css_video
      t.boolean :js_video
      t.boolean :ror_video
      t.boolean :other_video
      
      t.string :exercise
      t.boolean :html_exercise
      t.boolean :css_exercise
      t.boolean :js_exercise
      t.boolean :ror_exercise
      t.boolean :other_exercise
      
      t.string :project
      t.string :final_project
      t.boolean :html_exercise
      t.boolean :css_exercise
      t.boolean :js_exercise
      t.boolean :ror_exercise
      t.boolean :other_exercise
      
      t.string :course
      t.boolean :html_course
      t.boolean :css_course
      t.boolean :js_course
      t.boolean :ror_course
      t.boolean :other_course
      
      t.boolean :complete
      t.boolean :free
      
      t.string :location
      
      t.timestamps null: false
    end
  end
end
