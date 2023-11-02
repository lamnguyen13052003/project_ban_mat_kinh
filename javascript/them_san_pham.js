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
    addOption();
}

function setChangeForUpdateImg() {
    $("#input-img-product").change(function (event) {
        addImgFileForProduct(this);
    });


    $("#input-img-for-expanded-info-product").change(function (event) {
        addImgForExpandedInfoProduct(this);
    });
}

function addOption(){
    $("#add-option").mouseup(function () {
        const list_input_option_product = $("#frame-input-option-product").find(".a-input-option-product");
        if(list_input_option_product.length == 0){
            $("#frame-input-option-product").html(`<div class="row a-input-option-product align-items-center">
                            <div class="col-4">
                                <select name="option">
                                    <option value="" disabled selected>Lựa chọn</option>
                                    <option value="color">Màu sắc</option>
                                    <option value="extracts">Chiết suất</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <input type="text" name="value-option" placeholder="Giá trị">
                            </div>
                            <div class="col-3">
                                <select name="link-img-option" id="select-img-option-product">
                                    <option selected disabled>Hình ảnh</option>
                                </select>
                            </div>
                            <button type="button" class="cancel bg-danger rounded h-100 col-1">x</button>
                        </div>`)
        }else{
            list_input_option_product.last().after(`<div class="row a-input-option-product align-items-center mt-1">
                            <div class="col-4">
                                <select name="option">
                                    <option value="" disabled selected>Lựa chọn</option>
                                    <option value="color">Màu sắc</option>
                                    <option value="extracts">Chiết suất</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <input type="text" name="value-option" placeholder="Giá trị">
                            </div>
                            <div class="col-3">
                                <select name="link-img-option" id="select-img-option-product">
                                    <option selected disabled>Hình ảnh</option>
                                </select>
                            </div>
                            <button type="button" class="cancel bg-danger rounded h-100 col-1">x</button>
                        </div>`);
        }

        $("#frame-input-option-product").find(".a-input-option-product").last().find(".cancel").mouseup(function () {
            $(this).parent().remove();
        });
    });
}