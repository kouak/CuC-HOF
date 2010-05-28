class AddConfirmableAndLockableToUsers < ActiveRecord::Migration
  def self.up
    alter_table(:users) do |t|
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable
    end
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :unlock_token,         :unique => true
  end

  def self.down
  end
end
