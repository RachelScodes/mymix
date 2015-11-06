class AddImageToMixtape < ActiveRecord::Migration
  def change
     add_column :mixtapes, :img_src, :string, default: "http://i.dailymail.co.uk/i/pix/2013/01/08/article-2259055-16CF09AC000005DC-960_634x587.jpg"
  end
end
