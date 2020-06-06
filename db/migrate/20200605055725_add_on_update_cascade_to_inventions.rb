# frozen_string_literal: true

# add to invention's foreign key constraint on_update: cascade property
class AddOnUpdateCascadeToInventions < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      ALTER TABLE inventions 
        DROP CONSTRAINT fk_rails_cd31967f9e, 
        ADD CONSTRAINT invention_fk FOREIGN KEY (scientist_id) 
        REFERENCES scientists ON UPDATE CASCADE;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE inventions 
        DROP CONSTRAINT invention_fk, 
        ADD CONSTRAINT fk_rails_cd31967f9e FOREIGN KEY (scientist_id) 
        REFERENCES scientists;
    SQL
  end
end
