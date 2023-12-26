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
//     xhr.open('POST', '../upload-file-on-banner-management', true);
//     // xhr.setRequestHeader("Content-Type", "multipart/form-data");
//     xhr.send(formData);
//     xhr.onload = function () {
//         if(xhr.status === 200){
//             console.log('File uploaded successfully.');
//         }else{
//             console.error('Error uploading file.');
//         }
//
//     }
//
// }
$(document).ready(function(){
  uploadFile();
})
function uploadFile() {
    $(".upload-img input").change(function (){
        const bannerId = $(this).attr("id");
        var file = $(this)[0].files[0];
        console.log(file);
        let formData = new FormData();
        formData.append(bannerId, file);
        $.ajax({
            url : '../upload-file-on-banner-management',
            data: formData,
            method: 'POST',
            processData: false,
            contentType: false,
            success: function (data){
                console.log("upload file successfully");
            },
            error: function (){
                console.log("error uploading file");
            }
        }) ;


    });
}