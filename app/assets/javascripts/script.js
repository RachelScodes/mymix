var youreHere = function(url){
   $('.nav-top').find('a').each(function() {
   $(this).toggleClass('.you-are-here', $(this).attr('href') == url);
   });
};

window.onload = function () {
   console.log('it\'s loaded!');

   $(document).ready(function() {
      console.log('it\'s ready!');

     var loc = window.location.pathname;
     youreHere(loc);

   });

   function defer() {
       if (window.jQuery) {
          youreHere();
       } else {
           setTimeout(function() { defer() }, 50);
       } //end else
   }  //end defer
} //end onload
