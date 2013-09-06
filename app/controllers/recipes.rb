Eater::App.controllers :recipes do
  layout :recipes

  get :index do
    @recipes = Recipe.last(15)

    render 'recipes/index'
  end

end
