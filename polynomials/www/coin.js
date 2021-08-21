function coinTossing(){
  $("#imgContainer").show();
  var $img = $("#anim");
  var src = $img.attr("src");
  if(src !== "smoke.gif"){
    $img.attr("src", "smoke.gif");
    coinTossing();
  }else{
    var u = Math.random();
    src = u < 0.5 ? "bad_1_good_2.jpg" : "bad_2_good_1.jpg";
    setTimeout(function() {
      $img.attr("src", src);
    }, 2000);
  }
}

