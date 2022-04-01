window.addEventListener("load", function() {
    let formulario = document.querySelector("form.contactoFormulario");

    formulario.addEventListener("submit", function(e) {
        e.preventDefault();

        let campoNombre = document.querySelector("input.name");

        if(campoNombre.value == ""){
            alert("El campo de nombre tiene que estar completo");
        }
    });
})