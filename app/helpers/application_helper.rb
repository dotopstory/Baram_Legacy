module ApplicationHelper
<<<<<<< HEAD

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Baram Legacy"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
=======
    
    #Returns the full title on a per-page basis
    def full_title(page_title = '') 
        base_title = "Baram Legacy"
        if page_title.empty? 
            base_title
        else
            page_title + " | " + base_title 
        end 
    end 
    
end
>>>>>>> rails-flavored-ruby
