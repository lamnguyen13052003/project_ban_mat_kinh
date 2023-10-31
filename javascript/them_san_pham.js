$(document).ready(function () {
    $(".cancel").click(function (event) {
        $(this).parent().remove();
        updateSelectImgOption();
    });

    const input = document.getElementById("input-img-product");
    $("#input-img-product").change(function (event) {
        getImgFile(this);
    });
});

function getImgFile(file) {
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

function updateSelectImgOption() {
    const listImg = $("#main").find(".input-img-product-body").find(".img-product");
    $("#select-img-option-product").html('<option selected disabled>Hình ảnh</option>');
    for(var i = 0; i < listImg.length; i++){
            $("#select-img-option-product").find("option").last().after('<option value="' + i  + '" >Hình ' + i + '</option>');
    }
}

