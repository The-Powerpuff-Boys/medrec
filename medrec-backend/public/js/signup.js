function change(val) {
    var filename = val.replace(/^.*[\\\/]/, '')
    document.getElementById("uploadFile").innerHTML = filename;
};

function EnableDisable(temp) {
    //Reference the Button.
    var btnSubmit = document.getElementById("submit");
    var em = document.getElementById("InputEmail1");
    var pass = document.getElementById("InputPassword1");
    var pass1 = document.getElementById("InputPassword2");
    var fn = document.getElementById("InputUsername1");
    var l = document.getElementById("phno");
    var upload = document.getElementById("License_Number");

    //Verify the TextBox value.

    if (em.value == "" || pass.value == "" || pass1.value == "" || fn.value == "" || l.value == "" || upload.value == "") {



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