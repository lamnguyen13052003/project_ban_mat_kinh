$(document).ready(function () {
    getBrandName();
    editProduct();
});

function getBrandName() {
    $.ajax({
        url: "product_manager",
        method: "GET",
        data: {
            action: "band-name"
        },
        dataType: "JSON",
        success: function (data) {
            for (var i = 0; i < data.brands.length; i++) {
                $("#list-brand-name li").last().after(`<li><a class="dropdown-item" href="link">${data.brands[i]}</a></li>`);
            }
        },
        error: function () {
            console.log("Lỗi")
        }
    });
}

function editProduct() {
    $(".edit-product").click(function () {
        const productId = $(this).attr("product-id");
        $.ajax({
            url: "product_manager",
            method: "POST",
            data: {
                action: "edit-product",
                "product-id": productId,
            },
            dataType: "JSON",
            success: function (data) {
                window.location.replace("chinh_sua_san_pham.jsp");
            },
            error: function () {
                console.log("Lỗi")
            }
        });
    });
}
