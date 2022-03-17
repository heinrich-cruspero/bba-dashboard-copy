$(function () {
  // $container = $('#content');
  // $container.on('click', '#sidebarCollapse', onToggleButtonClicked)

  console.log('hey hey hey')
  function onToggleButtonClicked (event) {
    $('#sidebar').toggleClass('active');
    $('#content').toggleClass('active');
  };
});
