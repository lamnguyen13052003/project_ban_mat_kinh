$(document).ready(function () {
    var listStar = $("div.onirvapp--shape-container>ul>li");
    for (var star of listStar) {
        if (star.getAttribute("class") === "checked") {
            star.getElementsByTagName("i")[0].setAttribute("class", "fa-solid fa-star");
        }
    }

    addActionClickForButtonFilter();
});

function addActionClickForButtonFilter() {
    var listButton = $("div.filter>ul>li>button");
    for(var button of listButton){
        button.click(function () {
            changeColorButtonCheck($(this));
        });
    }
}

function changeColorButtonCheck(button) {
   if(key.indexOf("checked") >= 0){
        button.removeClass("checked");
   }else{
       button.addClass("checked");
   }
}