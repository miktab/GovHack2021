function coinTossing(){
  $("#imgContainer").show();
  var $img = $("#anim");
  var src = $img.attr("src");
  if(src !== "coinFlipping.gif"){
    $img.attr("src", "coinFlipping.gif");
    coinTossing();
  }else{
    var u = Math.random();
    src = u < 0.5 ? "coin_head.jpg" : "coin_tails.jpg";
    setTimeout(function() {
      $img.attr("src", src);
    }, 2000);
  }
}

