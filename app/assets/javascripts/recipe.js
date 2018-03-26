document.addEventListener("turbolinks:load", function(event){

// jquery
  $("#search-form").keypress(function(e){
    e.preventDefault();
    
    $.ajax({
      url: "/search",
      method: "POST",
      data: $(this).serialize(),
      success: function(data){
        data.forEach(function(element){
            //create new option element
            var option = document.createElement("option")
            option.value = element

            //append option to list
            list.appendChild(option)
          })
      }
    });
  });

    $("#show-list").click(function(){
      $(".list").animate({width:'toggle'},350);
    });

    
    
     function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }


})

