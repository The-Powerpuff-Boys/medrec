function EnableDisable(InputEmail1) {
    //Reference the Button.
    var btnSubmit = document.getElementById("submit");
    var em = document.getElementById("InputEmail1");
    var pass = document.getElementById("InputPassword1");

    //Verify the TextBox value.

    if (em.value == "" || pass.value == "") {
        //Disable button
        btnSubmit.disabled = true;
        btnSubmit.className = "btn btn-secondary";



    } else {
        //Enable button
        btnSubmit.disabled = false;
        btnSubmit.className = "btn btn-primary";
    }
};