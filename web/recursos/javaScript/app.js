const boton = document.querySelector('#modoOscuro');
const boton1 = document.querySelector('#modoGris');
const boton2 = document.querySelector('#modoBlanco');
const boton3 = document.querySelector('#idNormal');

var localConfig = localStorage.getItem('tema');
if(localConfig==="dark-theme")
{
    document.body.classList.toggle('dark-theme')
}else if(localConfig==="gray-theme")
{
   document.body.classList.toggle('gray-theme'); 
}else if(localConfig==="white-theme")
{
    document.body.classList.toggle('white-theme');  
}else if(localConfig==="normal")
{
    document.body.classList.remove('dark-theme');
     document.body.classList.remove('gray-theme');
    document.body.classList.remove('white-theme');
}

boton.addEventListener('click', () => {
    document.body.classList.remove('gray-theme');
    document.body.classList.remove('white-theme');
    document.body.classList.toggle('dark-theme');
    tema = 'dark-theme';localStorage.setItem("tema",tema);
    
});

boton1.addEventListener('click', () => {
     document.body.classList.remove('dark-theme');
    document.body.classList.remove('white-theme');
    document.body.classList.toggle('gray-theme');
    tema = 'gray-theme';localStorage.setItem("tema",tema);
});

boton2.addEventListener('click', () => {
     document.body.classList.remove('dark-theme');
    document.body.classList.remove('gray-theme');
    document.body.classList.toggle('white-theme');
    tema = 'white-theme';localStorage.setItem("tema",tema);
});
boton3.addEventListener('click', () => {
    document.body.classList.remove('dark-theme');
     document.body.classList.remove('gray-theme');
    document.body.classList.remove('white-theme');
    tema = 'normal';localStorage.setItem("tema",tema);
});



$(document).ready(function () {

    var zoomBase = 100;
    document.body.style.zoom = zoomBase + "%";

    $('#restBtn').on('click', function () {

        document.body.style.zoom = "100%";
    });

    $('#plusBtn').on('click', function () {
        zoomBase = zoomBase - 10;
        document.body.style.zoom = zoomBase + "%";
    });

    $('#minusBtn').on('click', function () {
        zoomBase = zoomBase + 10;
        document.body.style.zoom = zoomBase + "%";
    });

    $('#aplicarColor').on('click', function () {
        var textColor = document.getElementsByTagName("*");
        muestrario = document.querySelector("#ColorTexto");
        for (var i = 0; i < textColor.length; i++)
        {
//            img[i].style.cssText += filtro;
            textColor[i].style.cssText += " color: " + muestrario.value + " !important; ";
        }


    });


    $('#ByN').on('click', function () {
        aplicar('filter: grayscale(100%)');
    });
    $('#Sepia').on('click', function () {
        aplicar('filter:  sepia(100%)');
    });
    $('#BajoBrillo').on('click', function () {
        aplicar('filter: brightness(50%)');
    });
    $('#AltoContraste').on('click', function () {
        aplicar('filter: contrast(200%)');
    });
    $('#Saturar').on('click', function () {
        aplicar('filter: saturate(250%)');
    });
    $('#Normal').on('click', function () {
        aplicar('filter: none');
    });

    function aplicar(filtro) {
        var img = document.getElementsByTagName("img");
        for (var i = 0; i < img.length; i++)
        {
            img[i].style.cssText += filtro;
        }
    }

});





