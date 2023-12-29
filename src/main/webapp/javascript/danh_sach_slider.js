$(document).ready(function(){
  uploadFile();
    // showImageInBannerManagement();
});
function uploadFile() {
    $(".upload-img input").change(function (){
        const bannerId = $(this).attr("id");
        var file = $(this)[0].files[0];
        let formData = new FormData();
        formData.append(bannerId, file);
        $.ajax({
            url : '../upload-file-on-banner-management',
            data: formData,
            method: 'POST',
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data){
                if(bannerId === "slide-added"){
                    var slide = $('.edit-img').html();
                    let index = $('.slide-management').length;
                    var addHtml = "<div class=\"slide-management p-3\">\n" +
                        "                        <div class=\"item-img col\">\n" +
                        "                            <img class=\"img-fluid\" data-banner=\"slide-added-"+(index + 1)+"\" src=\"../"+data.url+"\" alt=\"\">\n" +
                        "                            <div class=\"check-box-img\">\n" +
                        "                                <input class=\"form-check-input\" type=\"checkbox\" id=\"check-img-"+(index + 1)+"\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                    </div>"
                   slide+=addHtml;
                    $('.edit-img').html(slide);
                }else{
                    $(`img[data-banner="${bannerId}"]`).attr("src", "../" + data.url);
                }

            },
            error: function (formData){
                console.log("error uploading file");
            }
        }) ;
    });
}
// function showImageInBannerManagement() {
//     $.ajax({
//         url: "../upload-file-on-banner-management",
//         dataType: "json",
//         method: "POST",
//         success: function (data) {
//
//             console.log("show image in banner management");
//         },
//         error: function (data){
//             console.log(data);
//             console.log("error")
//         }
//     });
// }