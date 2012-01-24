$(function(){
  window.requestAnimFrame = (function(){
    return  window.requestAnimationFrame       ||
            window.webkitRequestAnimationFrame ||
            window.mozRequestAnimationFrame    ||
            window.oRequestAnimationFrame      ||
            window.msRequestAnimationFrame     ||
            function( callback ){
              window.setTimeout(callback, 1000 / 60);
            };
  })();

  function cloud_animation(){
    var base_distance = 30;
    // percentages to reflect parallax depth
    var cloud_percentages = {
      'cloud1': 0.8,
      'cloud2': 0.2,
      'cloud3': 0.3,
      'cloud4': 0.4,
      'cloud5': 0.5,
      'cloud6': 0.6,
      'cloud7': 0.7,
      'cloud8': 0.8,
      'cloud9': 0.9,
      'cloud10': 0.1,
      'cloud11': 0.2
    }
    for(var i=1; i<=11; i++){
      $('#cloud' + i).animate({left: '-=' + (base_distance * cloud_percentages['cloud' + i]) + 'px'}, 1000);
    }
  }

  (function cloudloop(){
    cloud_animation();
    requestAnimFrame(cloudloop);
  })();
});
