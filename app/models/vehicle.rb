class Vehicle < ActiveRecord::Base
   
# video on pg_search -- couldn't get working w/o view
#  extend Textacular
#   attr_accessor :query
##   belongs_to :searchable
## 
#   def results 
#     if @query.present?
#       self.class.search(@query).preload(:searchable).map!(&:searchable).uniq
#     else
#       Search.none
#     end
#   end
     
# rails cast #37 -- explains adding search
#  def self.search(search)
#    if search
#       find(:all, :conditions => ['vehicle LIKE ?', "%#{search}%"])
#    else
#       find(:all)
#    end  
#  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Vehicle.create! row.to_hash
    end
  end
  
end
