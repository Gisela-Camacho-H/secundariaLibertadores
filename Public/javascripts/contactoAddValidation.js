
window.addEventListener("load", function() {
    let formulario = document.querySelector("form.contactoFormulario");

    formulario.addEventListener("submit", function(e) {
        e.preventDefault();

        let campoNombre = document.querySelector("input.nombre");

        if(campoNombre.value == ""){
            document.getElementById("errorNombre").innerHTML = "El campo de nombre tiene que estar completo";
        }

        let campoEmail = document.querySelector("input.email");
        
        if(campoEmail.value == ""){
            document.getElementById("errorEmail").innerHTML = "El campo de correo tiene que estar completo";
        }

        let campoTelefono = document.querySelector("input.telefono");
        
        if(campoTelefono.value == ""){
            document.getElementById("errorTelefono").innerHTML = "El campo de telefono tiene que estar completo";
        }

        let campoConsulta = document.querySelector("textarea.consulta");
        
        if(campoConsulta.value == ""){
            document.getElementById("errorConsulta").innerHTML = "El campo de consulta tiene que estar completo";
        }
    });
})