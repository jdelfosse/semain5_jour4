class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gossip, index: true
	  t.belongs_to :commenteable, polymorphic: true, index: true      
      t.text :comment
      t.timestamps
    end
  end
end
