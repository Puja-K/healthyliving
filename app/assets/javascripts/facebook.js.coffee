jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true


window.fbAsyncInit = ->
  FB.init(appId: '1435284586764632', cookie: true, xfbml: true, version: 'v2.3')

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = 'users/auth/facebook/callback' if response.authResponse

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true

