# frozen_string_literal: true

class CreateIbans < ActiveRecord::Migration[6.1]
  def change
    create_table :ibans do |t|
      t.string :name

      t.timestamps
    end
  end
end
