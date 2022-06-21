function dropdown(val) {
  document.getElementById("dp_button").innerHTML = val;
}

function myfunction() {
  let abha = document.getElementById("sb").value;
  location.replace(`/patientinfo/${abha}`);
}
