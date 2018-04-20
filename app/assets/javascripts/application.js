// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
// require turbolinks disable because cancel automatically re trigger post when refresh page
//= require_tree .
$(document).ready(function() {
  $(".add_field").click(function(){
    addField();
  });
  
  $(".del_field").click(function(){
    delField();
  });
  
  $("#question_update_question").change(function(){
    recoverData();
  });
});

function addField(){
  var numberOfField = $(".good_field").length;
  if (numberOfField < 3) {
    $(".add_field").before('<textarea class="good_field" name="add_question[good_answer_'+ (numberOfField + 1) +']" id="add_question_good_answer_'+ (numberOfField + 1) +'"></textarea>');
    $(".good_reason").last().after('<textarea class="good_reason" type="text" name="add_question[good_reason_'+ (numberOfField + 1) +']" id="add_question_good_reason_'+ (numberOfField + 1) +'"></textarea>');
  }
  numberOfField = $(".good_field").length;
  if (numberOfField == 3){
    $(".add_field").addClass("hidden_field");
  }
  var numberOfDelBtn = $(".del_field").length;
  if (numberOfField > 1 && numberOfField <= 3 && numberOfDelBtn > 0) {
    $(".del_field").removeClass("hidden_field");
  }
}

function delField(){
  var numberOfField = $(".good_field").length;
  if (numberOfField > 1){
    $("#add_question_good_answer_"+numberOfField).remove();
    $("#add_question_good_reason_"+numberOfField).remove();
    numberOfField = $(".good_field").length;
  }
  if (numberOfField == 1){
    $(".del_field").addClass("hidden_field");
  }
  if (numberOfField < 3){
    $(".add_field").removeClass("hidden_field");
  }
}

function recoverData() {
  var question_id = $("#question_update_question").val();
  $.ajax({
    url: "show",
    method: "GET",
    dataType: "json",
    data: {question_id: question_id},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      var question = response["question"]
      var good_answers = response["good"];
      var wrong_answers = response["wrong"];
      if ( question.snippet == null){
        question.snippet = "";
      }
      $(".good_answer_part").empty();
      $(".wrong_answer_part").empty();
      $(".rank_part").empty();
      $(".snippet_part").empty();
      for(var i=0; i< good_answers.length; i++){
         $(".good_answer_part").append('<div class="answer_container good_container ga_'+i+'"></div>');
         $('.ga_'+i+'').append('<div class="left_part ">Good answer '+(i+1)+':</div>');
         $('.ga_'+i+'').append('<div class="right_part rp_ga_'+i+'"></div>');
         $('.rp_ga_'+i+'').append('<input type="text" name="good_answer_wording[]" value="' + good_answers[i]["wording"] + '">');
         $('.rp_ga_'+i+'').append('<input type="text" name="good_answer_reason[]" value="' + good_answers[i]["reason"] + '">');
       }
       for(var i=0; i< wrong_answers.length; i++){
         $(".wrong_answer_part").append('<div class="answer_container wa_'+i+'"></div>') ;
         $('.wa_'+i+'').append('<div class="left_part ">Wrong answer '+(i+1)+':</div>');
         $('.wa_'+i+'').append('<div class="right_part rp_wa_'+i+'"></div>');
         $('.rp_wa_'+i+'').append('<input type="text" name="wrong_answer_wording[]" value="' + wrong_answers[i]["wording"] + '">');
         $('.rp_wa_'+i+'').append('<input type="text" name="wrong_answer_reason[]" value="' + wrong_answers[i]["reason"] + '">');
       }
       if(response["rank"] == 1 ){
         $(".rank_part").append('<select name="question_update[level]" id="question_update_level"><option value="0">silver</option><option value="1" selected="selected">gold</option></select>');
       }else{
         $(".rank_part").append('<select name="question_update[level]" id="question_update_level"><option value="0" selected="selected">silver</option><option value="1">gold</option></select>');
       }
       $(".snippet_part").append('<div class="left_part ">Snippet: </div>');
       $(".snippet_part").append('<div class="right_part rp_snippet"></div>');
       $(".rp_snippet").append('<textarea class="question_field" name="snippet" id="add_question_text">'+ question.snippet +'</textarea>');
    }
  });//-end ajax
}
