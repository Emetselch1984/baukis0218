document.addEventListener('DOMContentLoaded', function () {
    // console.log("hello")
    const arys =document.querySelector(".animate-title")
    const chars = arys.innerHTML.trim().split("");
    let el =  chars.reduce((acc, curr) => {
        curr = curr.replace(/\s+/, '&nbsp;');
        return `${acc}<span class="char">${curr}</span>`;
    }, "");
    arys.innerHTML = el

});

