$(document).ready(function () {
    setRateProduct();
    addActionClickForButtonFilter();
    addActionClickForButtonSort();
});

function addActionClickForButtonFilter() {
    $("div.filter>ul>li>button").click(function (){
        changeColorButtonCheck($(this));
    });
}

function addActionClickForButtonSort() {
    $("div.sort>ul>li>button").click(function (){
        changeColorButtonCheck($(this));
    });
}

function changeColorButtonCheck(button) {
   if(button.attr("class").indexOf("checked") >= 0){
        button.removeClass("checked");
   }else{
       button.addClass("checked");
   }
}

function setRateProduct(){
    var listStar = $("div.onirvapp--shape-container>ul>li");
    for (var star of listStar) {
        if (star.getAttribute("class") === "checked") {
            star.getElementsByTagName("i")[0].setAttribute("class", "fa-solid fa-star");
        }
    }
}