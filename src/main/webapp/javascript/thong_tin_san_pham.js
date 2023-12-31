class Review {
    constructor(avatar, name, numberOfStar, comment, listImg, date) {
        this.avatar = avatar;
        this.name = name;
        this.numberOfStar = numberOfStar;
        this.comment = comment;
        this.listImg = listImg;
        this.date = date;
    }
}

$(document).ready(function () {
    showMoreInfor();
    selectOption();
    changeAmount();

    $(".account").find("a").attr("href", "../tai_khoan.jsp");;
});

/******Nút xổ thêm thông tin mô tả của sản phẩm******/
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

/*****Nút tăng giảm số lượng đặt hàng*****/
function changeAmount() {
    $("#main .productWrap .productWrapDetail .productActionMain button.minusQuan").click(function () {
        var val = $("#quantity");
        if (Number(val.val()) > 1) {
            val.val(Number(val.val()) - 1);
        }
    });

    $("#main .productWrap .productWrapDetail .productActionMain button.plusQuan").click(function () {
        var val = $("#quantity");
        val.val(Number(val.val()) + 1);
    });
}