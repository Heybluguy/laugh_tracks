class LaughTracksApp < Sinatra::Base

  get "/comedians" do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
    end
    erb :"/comedians/index"
  end
end
