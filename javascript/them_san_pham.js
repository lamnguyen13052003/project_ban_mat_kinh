$(document).ready(function () {
    setEvent();
});
//
// var textIsDarken;
//
/*Nhập text từ bản phím vào phần mô tả sản phẩm*/

//
/*Thêm hình vào phn mô tả sản phẩm*/
function addImgForExpandedInfoProduct(file) {
    var selectedFile = file.files[0];
    const imageUrl = window.URL.createObjectURL(selectedFile);

    $("#frame-content")
        .find("*")
        .last()
        .after('<div class="img">\n' +
            '         <img src="' + imageUrl + '" alt="' + selectedFile.name + '">\n' +
            '          <button class="cancel text-danger">x</button>\n' +
            '   </div>');

    $("#frame-content")
        .find(".img")
        .last()
        .find(".cancel")
        .click(function () {
            $(this).parent().remove();
        });
}
//
/*Thêm hình vào sản phẩm*/
function addImgFileForProduct(file) {
    var selectedFile = file.files[0];
    const imageUrl = window.URL.createObjectURL(selectedFile);

    $("#main").find(".input-img-product-body").find(".img-product").last().after(' <div class="img-product">\n' +
        '                        <img src="' + imageUrl + '" alt="' + selectedFile.name + '">\n' +
        '                        <button class="text-danger cancel">x</button>\n' +
        '                    </div>');

    $("#main").find(".input-img-product-body").find(".img-product").last().find(".cancel").click(function () {
        $(this).parent().remove();
        updateSelectImgOption();
    });
    updateSelectImgOption();
}
/*Cập nhật lại danh sách các hình có thể chọn làm hình ảnh cho phần select option*/
function updateSelectImgOption() {
    const listImg = $("#main").find(".input-img-product-body").find(".img-product");
    $("#select-img-option-product").html('<option selected disabled>Hình ảnh</option>');
    for (var i = 0; i < listImg.length; i++) {
        $("#select-img-option-product").find("option").last().after('<option value="' + i + '" >Hình ' + i + '</option>');
    }
}

/*Thết lập event*/
function setEvent() {
    setChangeForUpdateImg();
}

function setChangeForUpdateImg() {
    $("#input-img-product").change(function (event) {
        addImgFileForProduct(this);
    });


    $("#input-img-for-expanded-info-product").change(function (event) {
        addImgForExpandedInfoProduct(this);
    });
}