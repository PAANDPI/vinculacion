//black
const boton = document.querySelector('#boton');
const configUser = window.matchMedia('(prefers-color-scheme: dark)');
const localConfig = localStorage.getItem('tema');
if (localConfig === 'dark') {
    document.body.classList.toggle('dark-theme')
    
} else if (localConfig === 'light') {
    document.body.classList.toggle('light-theme')
}
boton.addEventListener('click', () => {
    console.log(configUser.matches)
    let colorTema;
    if (configUser.matches) {
        // Entramos con modo oscuro
        document.body.classList.toggle('light-theme')
        colorTema = document.body.classList.contains('light-theme') ? 'light' : 'dark'

    } else {
        document.body.classList.toggle('dark-theme')
        colorTema = document.body.classList.contains('dark-theme') ? 'dark' : 'light'
    }
    localStorage.setItem('tema', colorTema)
})



function tamañoLetra() {
  size = $(".mitexto" ).css("font-size");
  size = parseInt(size, 10);
  $( ".tamaño-actual" ).text(size);
}


tamañoLetra();

// Función para disminuir el tamaño del texto (fuente) 
$(".disminuir").on("click", function() {
  if ((size - 2) >= 13) {
    $(".mitexto").css("font-size", "-=2");
    $(".tamaño-actual").text(size -= 1);
  }
});

// Función para aumentar el tamaño del texto (fuente) 
$(".aumentar").on("click", function() { 
  if ((size + 2) <= 47) {
    $(".mitexto").css("font-size", "+=2");
    $(".tamaño-actual").text(size += 1);
  }
});

// Función para restablecer el tamaño del texto (fuente) al tamaño inicial 
$(".restablecer").on("click", function() {
  $(".mitexto").css("font-size", "initial");
  size = $(".mitexto" ).css("font-size");
  size = parseInt(size, 10);
  $( ".tamaño-actual" ).text(size);
}); 

