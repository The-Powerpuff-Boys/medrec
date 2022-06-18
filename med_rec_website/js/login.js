function EnableDisable(InputEmail1) {
    //Reference the Button.
    var btnSubmit = document.getElementById("submit");
    var em = document.getElementById("InputEmail1");
    var pass = document.getElementById("InputPassword1");
    var flag = 0;
    //Verify the TextBox value.

    if (em.value == "" || pass.value == "") {

        btnSubmit.disabled = true;
        btnSubmit.className = "btn btn-secondary";



    } else {
        //Disable the TextBox when TextBox is empty.
        btnSubmit.disabled = false;
        btnSubmit.className = "btn btn-primary";
    }
};