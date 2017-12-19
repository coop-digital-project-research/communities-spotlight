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

//= require jquery
//= require rails-ujs
//= require_tree .

function popARandomElementFrom(array){
  randomPosition = Math.floor(Math.random()*array.length)
  poppedValue = array[randomPosition];
  array.splice(randomPosition, 1);
  console.log(array);
  return poppedValue;
}

function pickThisAndThat() {
  var activities = [
    'sing',
    'learn to play a musical instrument',
    'organise a sing-a-long movie night',
    'start a band',
    'start an a capella group',
    'go to a concert',
    'go to an open mic night',
    'organise a battle of the bands',
    'write songs',
    'host a rap battle',
    'learn to dj',
    'grow a garden',
    'plant some trees',
    'make a community compost',
    'grow fruit and veg',
    'look after local bees',
    'plant a communal herb garden',
    'share a chicken',
    'bulk buy food',
    'Weed a community garden',
    'repair footpaths',
    'start a seed library',
    'share bee friendly plant cuttings',
    'share my tools',
    'borrow some tools',
    'make handmade gifts',
    'repair my clothes',
    'fix some electronics',
    'upcycle some old furniture',
    'put up a wind turbine',
    'organise a street party',
    'go to an exercise class',
    'go walking',
    'go cycling',
    'organise a football competition',
    'stay healthy',
    'learn how to repair my bike',
    'go hiking',
    'go for a run',
    'walk a neighbour\'s dog',
    'learn to fix my broken phone',
    'learn how to print my own cards',
    'learn how to cook',
    'learn another language',
    'learn how to use social media',
    'learn about crypto currencies',
    'learn creative writing skills',
    'teach people a new skill',
    'learn to cook new things',
    'meet new people and enjoy food together',
    'experience food from around the world',
    'develop healthy eating habits',
    'teach a recipe',
    'batch cook some food',
    'batch cook baby food',
    'participate in supper clubs',
    'discuss veganism',
    'make cider',
    'host a potluck dinner',
    'organise a nearly new toy swap',
    'start a babysitting club',
    'start a toy exchange',
    'share baby tips',
    'swap baby clothes',
    'host a birthday party',
    'go to a show',
    'organise to closed the street for playing',
    'put on an outdoor cinema night'
  ];

  var palette = [
    '#9f4d73',
    '#4B2574',
    '#1c3b6b',
    '#406A91',
    '#117e80',
    '#2E4834',
    '#9e3705',
    '#610F1A'
  ]

  thisValue = popARandomElementFrom(activities);
  thatValue = popARandomElementFrom(activities);

  thisColor = popARandomElementFrom(palette);
  thatColor = popARandomElementFrom(palette);

  $('#this').find('input').val(thisValue);
  $('#this').find('label').html(thisValue);
  $('#this').find('label').css('background-color', thisColor)

  $('#that').find('input').val(thatValue);
  $('#that').find('label').html(thatValue);
  $('#that').find('label').css('background-color', thatColor)
}

$( document ).ready(function() {

  pickThisAndThat();

  $("input[type='radio']").click(function(){
    pickThisAndThat();
  });

});
