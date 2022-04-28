// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

$("#currency-form").on('submit', function(event){
  event.preventDefault();
  $.ajax({
    type: "POST",
    url: `${this.action}.js`,
    data: $("#currency-form").serialize(),
    success: function(data){

    }
  });
});