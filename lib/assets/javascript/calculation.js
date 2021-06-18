$(document).ready(function() {
  $("#proponent_salary").blur(function(){
    var val = $(this).val().trim();

    $.ajax({
      url:'/calculation',
      type: 'GET',
      dataType: "json",
      data: { salary: val }
    }).done(function(data) {
      $('#proponent_contribution').val(data.contribuition.toFixed(2));
    });
  });
})