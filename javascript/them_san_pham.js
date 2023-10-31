$(document).ready(function () {
    $(".cancel").click(function (event) {
        $(this).parent().remove();
        updateSelectImgOption();
    });

    $("#input-img-product").change(function (event) {
        addImgFile(this);
    });
    $("#input-img-for-expanded-info-product").change(function (event) {
        addImgForExpandedInfoProduct(this);
    });
});


function addImgForExpandedInfoProduct(file) {
    var selectedFile = file.files[0];
    const imageUrl = window.URL.createObjectURL(selectedFile);

    $("#main")
        .find(".input-expanded-info-product-body")
        .find(".content-product")
        .find("*")
        .last()
        .after('<div class="img">\n' +
            '         <img src="'+ imageUrl +'" alt="'+ selectedFile.name +'">\n' +
            '          <button class="cancel text-danger">x</button>\n' +
            '   </div>');
    $("#main")
        .find(".input-expanded-info-product-body")
        .find(".content-product")
        .find(".img")
        .last()
        .find(".cancel")
        .click(function () {
            $(this).parent().remove();
        });
}

function addImgFile(file) {
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

$(document).keypress(
    function (event) {
        if (event.which == '13') {
            event.preventDefault();
        }
    });

function updateSelectImgOption() {
    const listImg = $("#main").find(".input-img-product-body").find(".img-product");
    $("#select-img-option-product").html('<option selected disabled>Hình ảnh</option>');
    for (var i = 0; i < listImg.length; i++) {
        $("#select-img-option-product").find("option").last().after('<option value="' + i + '" >Hình ' + i + '</option>');
    }
}

