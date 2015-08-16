class CreateBarbers < ActiveRecord::Migration
  
  def change

  	create_table :barbers do |t|
  		t.text :name

  		t.timestamp
  	end
=begin
  Barbers.create :name => 'Jessie Pinkman'
  Barbers.create :name => 'Vasya Pupkin'
  Barbers.create :name => 'Vert Didder'
  Barbers.create :name => 'Walter White'
=end
  end


end
