$(document).ready(function () {
    $.ajax({
        url: "../product_manager",
        method: "GET",
        data: {
            action: "band-name"
        },
        dataType: "JSON",
        success: function (data) {
            for(var i = 0; i < data.brandNames.length; i++){
                $("#list-brand-name li").last().after(`<li><a class="dropdown-item" href="link">${data.brandNames[i]}</a></li>`);
            }
        },
        error:function () {
          console.log("Lỗi")
        }
    });
})
