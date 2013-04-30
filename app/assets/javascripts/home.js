$(document).ready(function(){
  
  $('#login_button').click(login_validation);
    
});

function login_validation() {
  if ($('#session_email').val() == '') {
    alert ('Email cannot be blank.');
    return false;
  }
  
  if ($('#session_password').val() == '') {
    alert ('Password cannot be blank.');
    return false;
  }
   
}
