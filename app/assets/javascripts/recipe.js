document.addEventListener("DOMContentLoaded", function(event){

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
})


})