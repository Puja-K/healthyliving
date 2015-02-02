# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  # Initially the player is not loaded
  window.ytPlayerLoaded = false
 
  makeVideoPlayer = (video) ->
    if !window.ytPlayerLoaded
      player_wrapper = $('#player-wrapper')
      player_wrapper.append('<div id="ytPlayer"><p>Loading player...</p></div>')
 
      window.ytplayer = new YT.Player('ytPlayer', {
        width: '100%'
        height: player_wrapper.width() / 1.777777777
        videoId: video
        playerVars: {
          wmode: 'opaque'
          autoplay: 0
          modestbranding: 1
        }
        events: {
          'onReady': -> window.ytPlayerLoaded = true
          'onError': (errorCode) -> alert("We are sorry, but the following error occured: " + errorCode)
        }
      })
    else
      window.ytplayer.loadVideoById(video)
      window.ytplayer.pauseVideo()
    return
  return
  
  $('.yt_preview').click -> makeVideoPlayer $(this).data('uid');

