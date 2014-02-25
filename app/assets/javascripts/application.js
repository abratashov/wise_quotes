// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require underscore
//= require lib/socky.min
//= require angular
//= require angular-route.js
//= require angular-ui-bootstrap
//= require_tree .
// require_tree ./templates

var config = {
  server_ip: 'http://enigmatic-reaches-2389.herokuapp.com',
  ws_server: 'ws://enigmatic-reaches-2389.herokuapp.com:3001/websocket/app'
  // server_ip: 'http://localhost:3000',
  // ws_server: 'ws://localhost:3001/websocket/app'
};