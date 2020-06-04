# frozen_string_literal: true

class CreateScientists < ActiveRecord::Migration[5.1]
  def change
    create_table :scientists do |t|
      t.integer :madness
      t.integer :attempts

      t.timestamps
    end
  end
end
