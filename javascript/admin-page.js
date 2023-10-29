$(document).ready(function () {

    $("#menu .account a").attr("href", "");
    $("#menu .account a img").attr("src", "../logo.png");
    $("#menu").find(".account").attr("class", "account col-lg-2 col-md-1 col-sm-1 border-0 px-lg-0");
    displayButtonSignOut();

    $("#sign_out").click(function () {
        sessionStorage.removeItem("account");
    });
});

function displayButtonSignOut() {
    $("#menu").find(".account").after(`<div class="sign_out col-lg-1 col-md-1 col-sm-1 border-0 px-lg-0">
         <a href="../index.html" id="sign_out">
              <button type="button" class="btn d-flex float-lg-end  me-xl-4 me-lg-2">
                  <span class="material-symbols-outlined">logout</span>
              </button>
         </a>
    </div>`);
}






