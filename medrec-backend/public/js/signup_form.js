 function change(val) {
     var filename = val.replace(/^.*[\\\/]/, '')
     document.getElementById("uploadFile").innerHTML = filename;
 };

 function EnableDisable(InputEmail1) {
     //Reference the Button.
     var btnSubmit = document.getElementById("submit");
     var fn = document.getElementById("fullname");
     var qual = document.getElementById("Qual");
     var upload = document.getElementById("u_button");

     //Verify the TextBox value.

     if (fn.value == "" || qual.value == "" || upload.val == "") {

         btnSubmit.disabled = true;
         btnSubmit.className = "btn btn-secondary";



     } else {
         //Disable the TextBox when TextBox is empty.
         btnSubmit.disabled = false;
         btnSubmit.className = "btn btn-primary";
     }
 };