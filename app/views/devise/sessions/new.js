$('.modal-body').html('<%= escape_javascript(render :partial => 'form', :object => @user) %>');
$('.modal-footer').html('<%= escape_javascript(render :partial => "devise/shared/links", :object => @user) %>');
  
$('#myModal').modal('show');