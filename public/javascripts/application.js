$(function(){
  $(".conjugations").each(function(){
    $(this).masonry({
      columnWidth: 100
    });
  });
  
  $(".examples a").click(function(){
    $("input#s").val($(this).attr("rel"));
  });
  
  $("#footer #author").hover(
      function(){
        $("#footer #self-esteem").slideDown();
      },
      function(){
        $("#footer #self-esteem").slideUp();        
      }
  );
});