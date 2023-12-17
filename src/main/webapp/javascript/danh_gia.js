$(document).ready(function () {
    $(".account").find("a").attr("href", "../tai_khoan.jsp");
    uploadImageReview();
    setStar();
});

function uploadImageReview() {
    $("#input-img-review").change(function () {
        const file = document.getElementById("input-img-review").files[0];
        const url = window.URL.createObjectURL(file);
        const label = $("#label-upload-image");
        label.before(`
            <div class="a-img-review-product">
               <img src="${url}" alt="img-review">
               <button type="button" class="text-danger cancel">x</button>
            </div>
        `);

        const amountImg = label.parent().find("div.a-img-review-product").length;
        label.prev().find(".cancel").click(function () {
            $(this).parent().remove();
            if (amountImg === 5) {
                label.removeClass("d-none");
            }
        });

        if (amountImg === 5) {
            label.addClass("d-none");
        }

        const formData = new FormData();
        formData.append("input-img-review", file);
        formData.append("action", "add-image");
        console.log(file.length);
        $.ajax({
            url: "review",
            data: formData,
            method: "POST",
            dataType: "json",
            contentType: false, // Thiết lập contentType là false để không xử lý dữ liệu tự động
            processData: false, // Thiết lập processData là false để không xử lý dữ liệu tự động
            success: function (data) {
                console.log("Success");
            },
            error: function () {
                console.log("error");
            }
        })
    });
}

function setStar() {
    const listStar = $("#input-star>ul>li>i");
    listStar.attr("class", "fa-solid fa-star");
    listStar.parent().addClass("checked");
    const textQuality = ["Tệ", "Không hài lòng", "Bình thường", "Hài lòng", "Tuyệt vời"];

    listStar.click(function () {
        listStar.attr("class", "fa-regular fa-star");
        listStar.parent().removeClass("checked");

        const amountStar = $(this).attr("star");
        for (var i = 0; i < amountStar; i++) {
            listStar.eq(i).attr("class", "fa-solid fa-star");
            listStar.eq(i).parent().addClass("checked");
        }

        $("#text-quality-product").text(textQuality[amountStar - 1]);
    });
}