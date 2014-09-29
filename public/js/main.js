$('body').css('opacity', 0);

$(function() {

  $('body').css('opacity', 1);

  // Makes title display on page
  $('#title').empty();
  showLetters('#title','amber tunnell',0,200);

  // Makes appearance change on hover on main/work
  projectHover(); 



});


var showLetters = function(target, message, index, interval){
  if (index < message.length){
    $(target).append(message[index++]);
    setTimeout(function(){showLetters(target, message, index, interval);},interval);
  }
}

var showWords = function(target, message, index, interval){
  if (index < message.split(" ").length){
    $(target).append(message.split(" ")[index++] + " ");
    setTimeout(function(){showWords(target, message, index, interval);},interval);
  }
}

var projectHover = function(){
  $('.work-square').mouseover(function() {
    $(this).children('.project-hover').css({opacity: 0.0, visibility: "visible"}).animate({opacity: 1.0});
  });

  $('.work-square').mouseout(function() {
    $(this).children('.project-hover').css("visibility","hidden");
  });
}