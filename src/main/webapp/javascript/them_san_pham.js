$(document).ready(function () {
    setEvent();

    $(".select-img-option-product").change(function (event) {
        const parent = $(this).parents(".a-input-option-product");
        parent.find("img").attr("src", event.target.value);
    });

    initSelectFilter("get-brands", $('#select-brand-product'));
    initSelectFilter("get-materials", $('#select-material-product'));
    initSelectFilter("get-types", $('#select-type-product'));
    sumit();
});

const ckeditor = CKEDITOR.replace('editor');
CKFinder.setupCKEditor(ckeditor, "../ckfinder/");
ckeditor.setData(localStorage.getItem("describe") + `<div><br></div>`);
ckeditor.on('change', function (evt) {
    localStorage.setItem("describe", evt.editor.getData());
});

function initSelectFilter(action, select) {
    $.ajax({
        url: 'edit_product_manager',
        method: "GET",
        data: {
            action: action
        },
        dataType: 'json',
        success: function (data) {
            select.html(`<option value=""></option>`);
            const datas = data[Object.keys(data)[0]];
            datas.forEach(function (item) {
                select.find(`option`).last().after(`<option value="${item}">${item}</option>`);
            });
        },
        error: function () {
            window.location.replace("../error.jsp");
        }
    });

    select.select2();
    // select.change(function () {
    //     console.log(select.select2(`data`)[0].id);
    // });
}

/*Cập nhật lại danh sách các hình có thể chọn làm hình ảnh cho phần select option*/
function updateSelectImgOption(element) {
    element.find('.select-img-option-product').html(`<option value="../images/avatar/default_avatar.png">Mặc định</option>`);
    const urls = $("#input-product-image-body").find(".product-image").find("img");
    for (let i = 0; i < urls.length; i++) {
        const url = $(urls[i]).attr("src");
        element.find('.select-img-option-product').find("option").last().after(`<option value="${url}" >Hình ${i}</option>`);
    }

    element.find("img").attr("src", "../images/avatar/default_avatar.png");
}

/*Thết lập event*/
function setEvent() {
    addImageProduct();
    addOption();
    addSaleProduct();
}

/*Thêm hình vào sản phẩm*/
function addImageProduct() {
    $("#input-product-image").change(function (event) {
        const selectedFile = this.files[0];
        // const imageUrl = window.URL.createObjectURL(selectedFile);

        const formData = new FormData();
        formData.append("image-product", selectedFile);
        formData.append("product-id", $("product-id").attr("product-id"));
        $.ajax({
            url: "edit_product_manager",
            data: formData,
            method: "PUT",
            dataType: "text",
            contentType: false, // Thiết lập contentType là false để không xử lý dữ liệu tự động
            processData: false, // Thiết lập processData là false để không xử lý dữ liệu tự động
            success: function (data) {
                $("#input-img").before(`<div class="product-image">
                                           <img src="../${data}" alt="image-product.png">
                                            <button type="button" path-file="${data}" class="text-danger cancel">x</button>
                                        </div>`);

                const cancel = $("#main").find(".input-product-image-body").find(".product-image").last().find(".cancel");

                cancel.click(function () {
                    removeImageProduct($(this).parent(), $(this));
                });

                const models = $(".a-input-option-product");
                for (let i = 0; i < models.length; i++) {
                    updateSelectImgOption($(models[i]));
                }
            },
            error: function () {
            }
        });

        this.value = ``;
    });
}

function removeImageProduct(parent, button) {
    const formData = new FormData();
    formData.append("path-file", button.attr("path-file"))
    $.ajax({
        url: "edit_product_manager",
        data: formData,
        method: "DELETE",
        dataType: "text",
        contentType: false, // Thiết lập contentType là false để không xử lý dữ liệu tự động
        processData: false, // Thiết lập processData là false để không xử lý dữ liệu tự động
        success: function (data) {
            parent.remove();
            const models = $(".a-input-option-product");
            for (let i = 0; i < models.length; i++) {
                updateSelectImgOption($(models[i]));
            }
            console.log(data);
        },
        error: function () {
            console.log("error");
        }
    });
}

function addOption() {
    $("#add-option").click(function () {
        $("#input-option-product").before(`<div class="row a-input-option-product align-items-center mb-2 model">
                            <hr>
                            <div class="col-2 text-center">
                                <img src="../images/avatar/default_avatar.png" alt="hinh_anh.png">
                            </div>
                            <div class="col-3">
                                <label>Tên mẫu</label>
                                <input class="model-name"  type="Text" required name="model-name" placeholder="Tên mẫu">
                                <small hidden="" class="text-danger">Tên mẫu không được bỏ trống!</small>
                            </div>
                            <div class="col-3">
                                <label>Số lượng</label>
                                <input class="model-quantity" type="number" required name="model-quantity" placeholder="Số lượng mẫu">
                                <small hidden="" class="text-danger">Số lượng mẫu không được bỏ trống!</small>
                            </div>
                            <div class="col-3">
                                <label>Lựa chọn hình</label>
                                <select class="select-img-option-product model-url-iamge" name="model-url-iamge">
                                    <option value="../images/avatar/default_avatar.png">Mặc định</option>
                                </select>
                                <small hidden="" class="text-danger">Vui lòng chọn hình cho mẫu!</small>
                            </div>
                            <button type="button" class="mx-auto cancel bg-danger rounded col-1"">x</button>
                        </div>`)

        $("#input-option-product").prev().find(".cancel").mouseup(function () {
            $(this).parent().remove();
        });

        updateSelectImgOption($("#input-option-product").prev());

        $("#input-option-product").prev().find(".select-img-option-product").change(function (event) {
            const parent = $(this).parents(".a-input-option-product");
            parent.find("img").attr("src", event.target.value);
        });
    });
}

function addSaleProduct() {
    $("#add-sale-product").mouseup(function () {
        $("#input-sale-product").before(`
                            <div class="sale-product product-discounts">
                                 <hr>
                                <div class="row d-flex">
                                    <div class="col-10">
                                        <input type="number" class="w-100 price-percentage" name="pricePercentage" placeholder="chiết khấu" required>
                                         <small hidden="" class="text-danger">Phần trăm giá giảm không được bỏ trống!</small>
                                    </div>
                                    <div class="col-2">
                                        <button type="button" class="w-100 h-100 cancel bg-danger rounded col-1">x</button>
                                    </div>
                                </div>
                                <div class="input-date-sale-product d-flex row align-items-center align-items-center">
                                    <div class="col-5 pe-0">
                                        <input required type="date" class="w-100 mb-0 ps-1 date-start" name="date-start-discount">
                                         <small hidden="" class="text-danger">Ngày bắt đầu không được bỏ trống!</small>
                                    </div>
                                    <div class="col-2 px-0 mx-0 text-center">-</div>
                                    <div class="col-5 ps-0">
                                        <input required type="date" class="w-100 mb-0 ps-1 date-end" name="date-end-discount">
                                        <small hidden="" class="text-danger">Ngày kết thúc không được bỏ trống!</small>
                                    </div>
                                </div>
                            </div>`);
        $("#input-sale-product").prev().find(".cancel").mouseup(function () {
            $(this).parents(".sale-product").remove();
        });
    });
}

function sumit() {
    $("#submit").click(function () {
        const beforeSubmit = beforeSumit();
        const complete = beforeSubmit[0];
        const formData = beforeSubmit[1];
        console.log(formData.get("product-name"));
        if (complete) {
            $.ajax({
                url: "edit_product_manager",
                data: formData,
                dataType: "text",
                method: "POST",
                processData: false, // Không xử lý dữ liệu gửi đi
                contentType: false,
                success: function (data) {
                    localStorage.removeItem("describe");
                    window.location.replace("quan_ly_san_pham.jsp");
                },
                error: function (e) {
                }
            });
        }
    });
}

function beforeSumit() {
    let complete = true;
    const formData = new FormData();

    complete = complete & getAction(formData);

    complete = complete & getProductId(formData);

    complete = complete & getProductName(formData);

    complete = complete & getProductCategoryId(formData);

    complete = complete & getProductDescribe(formData);

    complete = complete & getProductImages(formData);

    complete = complete & getModels(formData);

    complete = complete & getProductPrice(formData);

    complete = complete & getProductDiscount(formData);

    complete = complete & getBrand(formData);

    complete = complete & getMaterial(formData);

    complete = complete & getType(formData);

    return [complete, formData];
}

function getAction(formData) {
    const action = $("#submit").attr("action");
    if (!action) return false;
    formData.append("action", action);
    return true;
}

function getProductId(formData) {
    const productId = $("#product-id").attr("product-id");
    if (!productId) {
        window.location.replace("quan_ly_san_pham.jsp")
        return false;
    }
    formData.append("product-id", productId);
    return true;
}

function getProductName(formData) {
    const productName = $("#product-name").val();
    if (!productName) {
        $("#product-name").next().removeAttr("hidden");
        return false;
    }
    formData.append("product-name", productName);
    return true;
}

function getProductCategoryId(formData) {
    const productCategoryId = $("#product-category-id").val();
    if (!productCategoryId) {
        $("#product-category-id").next().removeAttr("hidden");
        return false;
    }
    formData.append("product-category-id", productCategoryId);
    return true;
}

function getProductDescribe(formData) {
    formData.append("product-describe", ckeditor.getData());
    return true;
}

function getModels(formData) {
    let complete = true;
    const elementModels = $(".model");
    const models = [];
    for (let i = 0; i < elementModels.length; i++) {
        const elementModel = $(elementModels[i]);

        const modelName = elementModel.find(".model-name").val();
        if (!modelName) {
            elementModel.find(".model-name").next().removeAttr("hidden");
            complete = false;
        }

        const modelQuantity = elementModel.find(".model-quantity").val();
        if (!modelQuantity) {
            elementModel.find(".model-quantity").next().removeAttr("hidden");
            complete = false;
        }

        let modelUrlIamge = elementModel.find(".model-url-iamge").val();
        modelUrlIamge = modelUrlIamge.substring(3, modelUrlIamge.length);
        if (!modelUrlIamge) {
            elementModel.find(".model-url-iamge").next().removeAttr("hidden");
            complete = false;
        }
        formData.append("model", [modelName, modelQuantity, modelUrlIamge]);
    }
    if (!complete) {
        $(".error-input-model").removeAttr("hiddent");
        return false;
    }

    return complete;
}

function getProductImages(formData) {
    let complete = true;
    const elementProductImages = $(".product-image");
    for (let i = 0; i < elementProductImages.length; i++) {
        let productImage = $(elementProductImages[i]).find("img").attr("src").toString();
        productImage = productImage.substring(3, productImage.length);
        if (!productImage) {
            complete = false;
        }

        formData.append("product-image", productImage);
    }
    if (!complete) {
        $(".error-product-image").removeAttr("hidden");
        return false;
    }

    return complete;
}

function getProductPrice(formData) {
    const productPrice = $("#price-product").val();
    if (!productPrice) {
        $("#price-product").next().removeAttr("hidden");
        return false;
    }
    formData.append("product-price", productPrice);
    return true;
}

function getProductDiscount(formData) {
    let complete = true;
    const elementProductDiscounts = $(".product-discounts");
    for (let i = 0; i < elementProductDiscounts.length; i++) {
        const elementProductDiscount = $(elementProductDiscounts[i]);

        const pricePercentage = elementProductDiscount.find(".price-percentage").val();
        if (!pricePercentage) {
            elementProductDiscount.find(".price-percentage").next().removeAttr("hidden");
            complete = false;
        }

        const dateStart = elementProductDiscount.find(".date-start").val();
        if (!dateStart) {
            elementProductDiscount.find(".date-start").next().removeAttr("hidden");
            complete = false;
        }

        const dateEnd = elementProductDiscount.find(".date-end").val();
        if (!dateEnd) {
            elementProductDiscount.find(".date-end").next().removeAttr("hidden");
            complete = false;
        }

        formData.append("product-discount", [pricePercentage, dateStart, dateEnd]);
    }
    if (!complete) {
        $(".error-input-model").removeAttr("hiddent");
        return false;
    }

    return complete;
}

function getBrand(formData) {
    const brand = $('#select-brand-product').select2(`data`)[0].id;
    if (!brand) {
        $(".error-select-brand-product").removeAttr("hidden");
        return false;
    }
    formData.append("brand", brand);
    return true;
}

function getMaterial(formData) {
    const material = $('#select-material-product').select2(`data`)[0].id;
    if (!material) {
        $(".error-select-material-product").removeAttr("hidden");
        return false;
    }
    formData.append("material", material);
    return true;
}

function getType(formData) {
    const type = $('#select-type-product').select2(`data`)[0].id;
    if (!type) {
        $(".error-select-type-product").removeAttr("hidden");
        return false;
    }
    formData.append("type", type);
    return true;
}
