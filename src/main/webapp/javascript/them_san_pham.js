$(document).ready(function () {
    setEvent();
});

/*Thêm hình vào phẩn mô tả sản phẩm*/
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

    $("#input-img").before('<div class="img-product">\n' +
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
    addSaleProduct();
}

function setChangeForUpdateImg() {
    $("#input-img-product").change(function (event) {
        addImgFileForProduct(this);
    });


    $("#input-img-for-expanded-info-product").change(function (event) {
        addImgForExpandedInfoProduct(this);
    });
}

function addOption() {
    $("#add-option").mouseup(function () {
        $("#input-option-product").before(`<div class="row a-input-option-product align-items-center mb-2">
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
                            <div class="col-3 me-3">
                                <select name="link-img-option" id="select-img-option-product">
                                    <option selected disabled>Hình ảnh</option>
                                </select>
                            </div>
                            <button type="button" class="cancel bg-danger rounded h-100 col-1" style="width: 40px">x</button>
                        </div>`)

        $("#input-option-product").prev().find(".cancel").mouseup(function () {
            $(this).parent().remove();
        });
    });
}

function addSaleProduct() {
    $("#add-sale-product").mouseup(function () {
        $("#input-sale-product").before(`
                            <div class="sale-product">
                                 <hr>
                                <input type="number" class="w-100" name="sale-product"
                                       placeholder="chiết khấu" required>
                                <div class="input-date-sale-product d-flex row align-items-center align-items-center">
                                    <div class="col-5 pe-0">
                                        <input type="date" class="w-100 mb-0" name="data-start-apply-sale">
                                    </div>
                                    <div class="col-1 px-0 mx-0 text-center">-</div>
                                    <div class="col-5 ps-0">
                                        <input type="date" class="w-100 mb-0" name="data-end-apply-sale">
                                    </div>
                                    <button type="button" class="cancel bg-danger rounded col-1 px-0">x</button>
                                </div>
                            </div> `);
        $("#input-sale-product").prev().find(".cancel").mouseup(function () {
            $(this).parent().parent().remove();
        });
    });
}

const ckeditor = CKEDITOR.replace('editor');
CKFinder.setupCKEditor(ckeditor, "ckfinder/");
ckeditor.setData(localStorage.getItem("describe") + `<div><br></div>`);
ckeditor.on('change', function (evt) {
    localStorage.setItem("describe", evt.editor.getData());
});