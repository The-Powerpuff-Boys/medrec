function EnableDisable(InputEmail1) {
    //Reference the Button.
    var btnSubmit = document.getElementById("submit");
    var em = document.getElementById("InputEmail1");
    var pass = document.getElementById("InputPassword1");
    var pass1 = document.getElementById("InputPassword2");
    var flag = 0;
    //Verify the TextBox value.

    if (em.value == "" || pass.value == "" || pass1.value == "") {



        btnSubmit.disabled = true;
        btnSubmit.className = "btn btn-secondary";



    } else {


        btnSubmit.disabled = false;
        btnSubmit.className = "btn btn-primary";
    }
    if (pass1.value != pass.value) {
        document.getElementById("alert").style.display = "block";
    } else {
        document.getElementById("alert").style.display = "none";
    }
};