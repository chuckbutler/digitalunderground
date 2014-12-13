<script type="text/javascript">
// SignIn Popup
var popupStatus = 0;
$("#Login_PopUp_Link").click(function() {
  //Aligning our box in the middle
  var windowWidth = document.documentElement.clientWidth;
  var windowHeight = document.documentElement.clientHeight;
  var popupHeight = $("#popupLogin").height();
  var popupWidth = $("#popupLogin").width();
  // Centering
  $("#popupLogin").css({
    "top": windowHeight / 2 - popupHeight / 2,
    "left": windowWidth / 2 - popupWidth / 2
  });
  // Aligning bg
  $("#LoginBackgroundPopup").css({"height": windowHeight});

  // Pop up the div and Bg
  if (popupStatus == 0) {
    $("#LoginBackgroundPopup").css({"opacity": "0.7"});
    $("#LoginBackgroundPopup").fadeIn("slow");
    $("#popupLogin").addClass('zigmaIn').fadeIn("slow");
    popupStatus = 1;
  }
});
// Close Popup
$("#popupLoginClose").click(function() {
  if (popupStatus == 1) {
    $("#LoginBackgroundPopup").fadeOut("slow");
    $("#popupLogin").removeClass('zigmaIn').fadeOut("slow");
    popupStatus = 0;
  }
});
$("body").click(function() {
  $("#LoginBackgroundPopup").fadeOut("slow");
  $("#popupLogin").removeClass('zigmaIn').fadeOut("slow");
  popupStatus = 0;
});
$('#popupLogin, #Login_PopUp_Link').click(function(e) {
  e.stopPropagation();
});
</script>
