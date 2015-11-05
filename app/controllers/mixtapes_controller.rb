class Mixtapes < ApplicationController

   before_filter :authorize :except => [:index, :show]

end
