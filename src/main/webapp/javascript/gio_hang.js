$(document).ready(function () {
    upValueInputNumber();
    downValueInputNumber();
    removeProduct();
    selectProvince();
    selectDistrict();
    checkProduct();
    $.ajax({
        url: "address",
        method: "GET",
        dataType: "json",
        data: {
            action: "provinces"
        },
        success: function (data) {
            for (var i = 0; i < data.provinces.length; i++) {
                $("#provinces").find("option").last().before(`<option value="${data.provinces[i].code}">${data.provinces[i].fullName}</option>`);
            }
        }
    });
})

function upValueInputNumber(input) {
    $(".product .change-amount button.up").click(function () {
        const product = $(this).parent().parent();
        const input = $(this).prev();
        const checkbox = product.find(".product-checkbox").is(":checked");
        $.ajax({
            url: "cart",
            data: {
                action: "increase",
                productId: $(this).attr("product-id"),
                modelId: $(this).attr("model-id"),
                checked: checkbox
            },
            method: "OPTIONS",
            dataType: "json",
            success: function (data) {
                product.find(".total-money").text(data.totalPriceProduct);
                input.val(data.quantity);
                if (checkbox) setUpMoney(data);
            }
        });
    });
}

function downValueInputNumber(input) {
    $(".product .change-amount button.down").click(function () {
        const product = $(this).parent().parent();
        const input = $(this).next();
        const checkbox = product.find(".product-checkbox").is(":checked");
        $.ajax({
            url: "cart",
            data: {
                action: "reduce",
                productId: $(this).attr("product-id"),
                modelId: $(this).attr("model-id"),
                checked: checkbox
            },
            method: "OPTIONS",
            dataType: "json",
            success: function (data) {
                product.find(".total-money").text(data.totalPriceProduct);
                input.val(data.quantity);
                if (checkbox) setUpMoney(data);
            }
        });
    });
}

function removeProduct() {
    $("#list-product .product button.cancel").click(function () {
        const product = $(this).parent();
        const checkbox = product.find(".product-checkbox").is(":checked");
        $.ajax({
            url: "cart",
            data: {
                action: "remove",
                productId: $(this).attr("product-id"),
                modelId: $(this).attr("model-id"),
                checked: checkbox
            },
            method: "DELETE",
            dataType: "json",
            success: function (data) {
                $(".amount-product").text(data.amountProduct);
                if (checkbox) setUpMoney(data);
                product.remove();
            }
        });
    });
}

function selectProvince() {
    $("#provinces").change(function (e) {
        const code = e.target.value;
        $.ajax({
            url: "address",
            data: {
                action: "districts",
                code: code,
            },
            method: "GET",
            dataType: "json",
            success: function (data) {
                $("#districts").html(` <option selected value="" disabled style="color: #fff">Chọn quận/huyện</option>`);
                $("#wards").html('<option selected value="" disabled style="color: #fff">Chọn phường/xã</option>');
                for (var i = 0; i < data.districts.length; i++) {
                    $("#districts").find("option").last().before(`<option value="${data.districts[i].code}">${data.districts[i].fullName}</option>`);
                }
            }
        });
    });
}

function selectDistrict() {
    $("#districts").change(function (e) {
        const code = e.target.value;
        $.ajax({
            url: "address",
            data: {
                action: "wards",
                code: code,
            },
            method: "GET",
            dataType: "json",
            success: function (data) {
                $("#wards").html('<option selected value="" disabled style="color: #fff">Chọn phường/xã</option>');
                for (var i = 0; i < data.wards.length; i++) {
                    $("#wards").find("option").last().before(`<option value="${data.wards[i].code}">${data.wards[i].fullName}</option>`);
                }
            }
        });
    });
}

function checkProduct() {
    $(".product-checkbox").change(function (event) {
        const checkbox = $(this);
        $.ajax({
            url: "cart",
            method: "PUT",
            dataType: "json",
            data: {
                action: "checked",
                checked: checkbox.is(":checked"),
                productId: checkbox.attr("product-id"),
                modelId: checkbox.attr("model-id"),
            },
            success: function (data) {
                setUpMoney(data);
            }
        });
    });
}

function setUpMoney(data) {
    $("#totalBill").text(data.totalBill);
    $("#totalPriceReduced").text(data.totalPriceReduced);
    $("#shippingFee").text(data.shippingFee);
    $("#totalPay").text(data.totalPay);
}