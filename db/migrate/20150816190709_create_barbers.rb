class CreateBarbers < ActiveRecord::Migration
  
  def change

  	create_table :barbers do |t|
  		t.text :name 

  		t.timestamps null: false
  	end

  Barbers.create :name => 'Jessie Pinkman'
  Barbers.create :name => 'Vasya Pupkin'
  Barbers.create :name => 'Vert Didder'
  Barbers.create :name => 'Walter White'

  end

end