// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .



$( document ).ready(function() {

  //upload Image to bas64
  function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
        $('#uploadedPokemon').attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
    }
  }

  //Use Base64 to Ajax call to rails controller
  $("#imgInp").change(function(){
      readURL(this);
      setTimeout(function(){ tesseractAjax(); }, 3000);
  });


  function tesseractAjax(){
    var imgData = $('#uploadedPokemon').attr('src');

    $.post('/caught_pokemons/image_file', { b64_img: imgData },
    function(data) {
    });

      gon.watch('pokemon_CP', 5000 , addCP)
  }


  function addCP(){
    gon.watch.pokemon_CP = $('#addCP').val();
    console.log( gon.pokemon_CP);
  }






});
