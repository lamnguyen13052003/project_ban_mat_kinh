// const elements = document.querySelectorAll(".upload-img input[id]");
//
// elements.forEach(function(element) {
//     element.addEventListener("change", function (){
//         uploadFile(element);
//     });
//
// })
// function uploadFile(element) {
//     let file = element.files[0];
//
//     var formData = new FormData();
//     formData.append(element.id, file);
//
//     let xhr = new XMLHttpRequest();
//
//     // Mở kết nối và gửi yêu cầu POST
//     xhr.open('POST', 'upload-file-on-banner-management', true);
//
//
//     xhr.onload = function () {
//         if(xhr.status === 200){
//             console.log('File uploaded successfully.');
//         }else{
//             console.error('Error uploading file.');
//         }
//
//     }
//     xhr.send(formData);
// }
$(document).ready(function(){
  uploadFile();
})
function uploadFile() {
    $(".upload-img input").change(function (){
        const bannerId = $(this).attr("id");
        $.ajax({
            url : '../upload-file-on-banner-management',
            data: bannerId,
            method: 'POST',
            success: function (data){
                console.log("upload file successfully");
            },
            error: function (){
                console.log("error uploading file");
            }
        }) ;


    });
}