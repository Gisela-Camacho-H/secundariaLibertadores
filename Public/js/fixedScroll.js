window.onload = ()=>{

    const nav = document.querySelector('.navbar');
    const headerBackground = document.querySelector('.slogan').getBoundingClientRect();;

    window.addEventListener('scroll', ()=>{
        //if(window.scrollY > heigth) {
            if(window.scrollY < headerBackground.bottom - (headerBackground.bottom)/2) {
                nav.classList.remove('active');
            } else {
                nav.classList.add('active');
            }
    });
}
