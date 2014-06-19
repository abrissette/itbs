
// ------- usage
// var field, value;
// tester = new $.tester();
// booking.reset_error_state();

// var error_stack = [];
// field = $('input[name^=name]');
// value = field.attr('value');
// if(tester.is_empty(value)){
//   error_stack.push(field);
// } else if(!tester.validate_name(value)){
//     error_stack.push(field);
// }







$.tester = function tester(){
  var tester = this;

  tester.test = function(test_type, input){ };
  tester.is_checked = function(field){
    return field.is(':checked');
  };
  tester.is_empty = function(input) {
    return input === '';
  };
  tester.is_not_empty = function(input) {
    return input !== '';
  };
  tester.is_num = function(value){
    return (/^[0-9]{1,}$/).test(value);
  };
  tester.is_string = function(string){
    return string.match(/^[A-Za-z\-',.`''´ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåæœçèéêëìíîïñòóôõöýüûúùÿ\s]*$/);
  };
  tester.is_string_or_num = function(name) {
    return name.match(/^[A-Za-z0-9\-',.`''´ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝàáâãäåæœçèéêëìíîïñòóôõöýüûúùÿ\s]*$/);
  };
  tester.validate_zipcode = function(zipcode){
    // Canada + us 5-9 digits
    var reg = /^([ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1})|(\d{5}(-\d{4})?)$/i;
    return zipcode.match(reg);
  }; // validate_zipcode
  tester.validate_phone = function(phone){
    return phone.match(/\(?\d{3}\)? ?[-. ]?\d{3}[-. ]?\d{4}/);
  };
  tester.validate_email = function(email) {
    return (/^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email);
  }; // validate_email
  tester.validate_name = function(name) {
    return tester.is_string(name);
  };

  // credit cards
  // 'visa'              => "/^4\d{3}-?\d{4}-?\d{4}-?\d{4}$/",       // Visa: length 16, prefix 4, dashes optional.
  // 'mastercard'        => "/^5[1-5]\d{2}-?\d{4}-?\d{4}-?\d{4}$/",  // Mastercard: length 16, prefix 51-55, dashes optional.
  // 'amex'              => "/^3[4,7]\d{13}$/",                      // American Express: length 15, prefix 34 or 37.
  // 'discover'          => "/^6011-?\d{4}-?\d{4}-?\d{4}$/",     // Discover: length 16, prefix 6011, dashes optional.
  tester.validate_credit_card = function(type, value){
    var regex = "";
    switch(type){
      case 'visa':          regex = /^4\d{3}-?\d{4}-?\d{4}-?\d{4}$/;          break;
      case 'mastercard':    regex = /^5[1-5]\d{2}-?\d{4}-?\d{4}-?\d{4}$/;     break;
    }
    return value.match(regex);
  }; // validate_credit_card
}; // tester