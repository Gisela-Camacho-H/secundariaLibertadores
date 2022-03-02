const nav = document.querySelector('nav');
const header = document.querySelector('.header_background');
window.addEventListener('scroll', fixNav);
  
function fixNav() {
    //if(window.scrollY > heigth) {
    if(window.scrollY > header.offsetHeight) {
        nav.classList.add('active');
    } else {
        nav.classList.remove('active');
    }
}

