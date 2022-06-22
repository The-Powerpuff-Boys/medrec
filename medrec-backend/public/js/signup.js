function EnableDisable(InputEmail1) {
    //Reference the Button.
    var btnSubmit = document.getElementById("submit");
    var _1 = document.getElementById("fullname");
    var _2 = document.getElementById("Qual");
    var _3 = document.getElementById("gender");
    var _4 = document.getElementById("phno");
    var _5 = document.getElementById("InputEmail1");
    var _6 = document.getElementById("InputUsername1");
    var pass1 = document.getElementById("InputPassword1");
    var pass2 = document.getElementById("InputPassword2");


    //Verify the TextBox value.

    if (_1.value == "" || _2.value == "" || _3.value == "" || _4.value == "" || _5.value == "" || _6.value == "" || pass1.value == "" || pass2.value == "") {



        btnSubmit.disabled = true;
        btnSubmit.className = "btn btn-secondary";



    } else {


        btnSubmit.disabled = false;
        btnSubmit.className = "btn btn-primary";
    }
    if (pass1.value != pass2.value) {
        document.getElementById("alert").style.display = "block";
    } else {
        document.getElementById("alert").style.display = "none";
    }
};