class CaughtPokemonsController < ApplicationController
skip_before_action :verify_authenticity_token
require 'rubygems'
require 'rmagick'

  def tessrack(oimg_name, do_gray=true, keep_temp=true)
     fname = oimg_name

     tc = "tesseract #{fname} output"
     puts "TR:\t#{tc}"
     `#{tc}`

     File.delete(tname) unless keep_temp==true
     File.open("output.txt"){|txt| txt.read}
  end

  def image_file
    #base64 image ajax params
    @pokemon_hash = params[:b64_img]

    @image = ImageUploader.new
    @new_uploaded_pokemon = UploadedPokemon.new

    @new_uploaded_pokemon.image = params[:b64_img]
    @image.store!(params[:b64_img])

    if @new_uploaded_pokemon.save

      #tessract OCR of params base64 image
      @image_txt = tessrack( @new_uploaded_pokemon.image.file.file )

      #if image_txt is nil tesseract got empty data set
      @tesseract_array = @image_txt.split(/\r?\n\n/)

      @poke_array = ["Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard", "Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod", "Butterfree", "Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata", "Raticate", "Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash", "Nidorina", "Nidoqueen", "Nidoran", "Nidorino", "Nidoking", "Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff", "Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth", "Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape", "Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam", "Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel", "Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro", "Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk", "Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno", "Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey", "Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie", "Mr. Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados", "Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar", "Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres", "Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew"]
      @poke_data_array = Array.new

      #pull out correct data from tesseract array
      @tesseract_array.each do |ele|
        if ele.include? "HP"
          @poke_data_array << ele
        elsif ele.include? "CP"
          @poke_data_array << ele
        elsif @poke_array.include? ele
          @poke_data_array << ele
        end
      end

      #clean out Data
      @pokemon_CP = @poke_data_array[0].split(' ')[0].gsub(/[CP]/,'')
      @pokemon_name = @poke_data_array[1]
      @pokemon_HP = @poke_data_array[2].split('/')[1]

      # binding.pry
      #use gon gem to have rails to ajax call and fill in form fields
      gon.watch.pokemon_CP = @pokemon_CP
      gon.watch.pokemon_name = @pokemon_name
      gon.watch.pokemon_HP = @pokemon_HP

    else
      alert('Please Upload a Pokemon')
    end

  end


  def new
  end


  def create
    @new_caught_pokemon = CaughtPokemon.new(caught_pokemon_params)
    @current_pokemon = Pokemon.where(name: @new_caught_pokemon.pokemon_name)
    @new_caught_pokemon.pokemon_id = @current_pokemon[0].id
    if @new_caught_pokemon.save
      redirect_to ranking_tables_path, notice: "new_caught_pokemon"
    else
      render :new
    end
  end

  def caught_pokemon_params
    params.require(:caught_pokemon).permit(:username, :combat_power, :pokemon_name, :health_power, :location, :team_color, :first_move, :second_move)
  end

  def upload_params
    params.require(:uploaded_pokemon).permit(:country_of_origin, :gender, :about, :avatar)
  end

end
