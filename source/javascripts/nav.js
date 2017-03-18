$(function() {
  $( '#jNavTrigger' ).click(function() {
    $( this ).toggleClass( 'active' );
    $( 'body' ).toggleClass( 'nav-overlay-active' );
  });
});