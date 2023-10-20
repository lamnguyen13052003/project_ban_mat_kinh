$(document).ready(function () {
    showMoreInfor();
    selectOption();
    changeAmount();
});

function showMoreInfor() {
    $("div#main .productTabsContent .tab-content .tab-pane a.readmore").click(function () {
        $(this).addClass("d-none");
        $("div#main .productTabsContent .tab-content .tab-pane a.readless").removeClass("d-none");
        $("div#main .productTabsContent .tab-content .tab-pane>div").removeClass("overflow-hidden").attr("style", "");
    });

    $("div#main .productTabsContent .tab-content .tab-pane a.readless").click(function () {
        $(this).addClass("d-none");
        $("div#main .productTabsContent .tab-content .tab-pane a.readmore").removeClass("d-none");
        $("div#main .productTabsContent .tab-content .tab-pane>div").addClass("overflow-hidden").attr("style", "height: 500px;");
    });
}

function selectOption() {
    $("div#main .productWrap .productWrapDetail .product-swatch button").click(function () {
        $("div#main .productWrap .productWrapDetail .product-swatch button").removeClass("active");
        $(this).addClass("active")
    });
}

function changeAmount(){
    $("div#main .productWrap .productWrapDetail .productActionMain button.minusQuan").click(function () {
        var val =  $("#quantity");
        if(Number(val.val()) > 1){
            val.val(Number(val.val()) - 1);
        }
    });

    $("div#main .productWrap .productWrapDetail .productActionMain button.plusQuan").click(function () {
        var val =  $("#quantity");
        val.val(Number(val.val()) + 1);
    });
}