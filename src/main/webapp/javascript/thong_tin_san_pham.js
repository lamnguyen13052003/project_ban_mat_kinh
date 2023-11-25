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


/***************Tạo review********************/
function displayListReview(listReview) {
    listReview.forEach(review => {
        displayAReview(review);
    })
}

function displayAReview(review) {
    $("#onirvapp-review-list>div").last().after(`<div class="a-review mb-3">
                                    <div class="user">
                                        <div class="avatar-user left">
                                            <img src="${review.avatar}">
                                        </div>
                                        <div class="right">
                                            <div class="name-user"><span>${review.name}</span></div>
                                            <div class="onirvapp--shape-container d-inline-block">
                                                <ul class="list-group list-group-horizontal">
                                                    <!--Các li có class checked là sao hoàn thiện-->
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                    <li>
                                                        <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="date-review">
                                            <span>${review.date}</span>
                                        </div>
                                    </div>
                                    <div class="content-review">
                                        <div class="text-review">
                                            <span>${review.comment}</span>
                                        </div>
                                        <div class="img-review">
                                            <div class="input-review"></div>
                                        </div>
                                    </div>
                                </div>`);

    displayImgReview(review.listImg);
    displayStar(review.numberOfStar);
}

function displayImgReview(listImg) {
    listImg.forEach(img => {
        $("#onirvapp-review-list>div").last().find(".input-review").before(`<img src="${img}" alt="img-review.img" class="me-1">`);
    });
}

function displayStar(numberOfStar) {
    const star = $("#onirvapp-review-list>div").last().find(".list-group-horizontal").find("i");
    for (var i = 0; i < numberOfStar; i++) {
        star.eq(i).attr("class", "fa-solid fa-star ");
    }
}

/****************Đọc 1 review*****************8*/
function readReview() {
    var review = review();

    review.avatar('../logo.png');
    review.name = "Nguyễn Đnh Lam"
    review.numberOfStar = readNumberOfStar();
    review.comment = $("#review-text").val();

    return review;
}

function readNumberOfStar() {
    return $("#customer-rate li.checked").length;
}

