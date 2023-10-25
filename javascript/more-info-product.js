$(document).ready(function () {
    showMoreInfor();
    selectOption();
    changeAmount();
    setRate();

    $("#button-account").parent().attr("href", "../../../account.html");
});

function showMoreInfor() {

    $("#main .productTabsContent .tab-content .tab-pane a.readmore div").click(function () {
        $(this).parent().addClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane a.readless").removeClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane>div").removeClass("overflow-hidden").attr("style", "");
    });

    $("#main .productTabsContent .tab-content .tab-pane a.readless  div").click(function () {
        $(this).parent().addClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane a.readmore").removeClass("d-none");
        $("#main .productTabsContent .tab-content .tab-pane>div").addClass("overflow-hidden").attr("style", "height: 500px;");
    });
}

function selectOption() {
    $("#main .productWrap .productWrapDetail .product-swatch button").click(function () {
        $("#main .productWrap .productWrapDetail .product-swatch button").removeClass("active");
        $(this).addClass("active")
    });
}

function changeAmount(){
    $("#main .productWrap .productWrapDetail .productActionMain button.minusQuan").click(function () {
        var val =  $("#quantity");
        if(Number(val.val()) > 1){
            val.val(Number(val.val()) - 1);
        }
    });

    $("#main .productWrap .productWrapDetail .productActionMain button.plusQuan").click(function () {
        var val =  $("#quantity");
        val.val(Number(val.val()) + 1);
    });
}

function setRate(){
    $("#customer-rate li i").attr("class", "fa-solid fa-star");
    $("#customer-rate li").click(function (){
        let amount = $(this).attr("class").charAt(0);
        console.log(amount);
        $("div#customer-rate li i").attr("class", "fa-regular fa-star");
        for(var index = 0; index < amount; index++){
            $("div#customer-rate li").eq(index).children().attr("class", "fa-solid fa-star");
        }
    });

}