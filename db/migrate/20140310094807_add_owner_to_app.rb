class AddOwnerToApp < ActiveRecord::Migration
  def change
    add_reference :apps, :owner, index: true
  end
end
