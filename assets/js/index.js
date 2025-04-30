window.addEventListener("DOMContentLoaded", () => {
    showLoader();
console.log('entra');
})

window.addEventListener("load", () => {
    setTimeout(() => {
        hideLoader();
}, 5000);
})


const loader = document.getElementById("loaderPagina");
const showLoader = () => {
    loader.classList.add("show_loader");
}
const hideLoader = () => {
    loader.classList.remove("show_loader");
}