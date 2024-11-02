class DirectorsController < ApplicationController
  
  def index
      render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch ("the_id")

    matching_records = Director.where({ :id=> the_id })
    
    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest

    min_dob = Director.maximum(:date_of_birth)

    youngest = Director.where({ :dob=> min_dob })

    @minimum_dob = min_dob.at(0)
    @director_name = youngest.at(0)
    
    render({ :template => "director_templates/youngest"})
  end

  def eldest

    render({ :template => "director_templates/eldest"})
  end
end
