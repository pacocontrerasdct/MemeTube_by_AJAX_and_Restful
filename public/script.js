$(document).ready(function(){
  console.log('hello');

  // get All my tasks as soon as the doc is ready
  getVideoList();

  // Event listener // trying to listen the biggest hmtl element
  $('#video-list').on('click', showVideo);

})

// General function to connect BD using AJAX
function request(method, url, data) {
  return $.ajax({
    method: method,
    url: url,
    dataType: 'json',
    data: data
  })
}

// Calling our list of videos from DB >> main.rb >> /index
function getVideoList() {
  // AJAX calling to DB to get videos
  request('GET', '/index', null).done(function(response) {
    console.log(response);
    // Getting each video and appeding them to index
    $.each(response, function(index, video) {
      appendTube(video);
    })
  })
}

function appendTube(video) {
  $('<li><div id="v_container"><div id="v_container_right"><p><span class="yellow">[A]rtist: </span>' + video.artist + '</p><p><span class="yellow">[T]itle: </span>' + video.title + '</p><p><span class="yellow">[D]escription: </span>' + video.description + '</p><p><span class="yellow">[G]enre: </span>' + video.genre + '</p><p><a href="/index/:id" id="' + video.id + '">[WATCH]</a></p></div></div></li>').prependTo("#video-list")
}

function showVideo(){
  videoId = $(this);
  console.log(videoId)
  debugger;
  
  
}







