// $(document).ready(function () {
//     $(".imageInput").on("change", function (event) {
//         const input = event.target;
//         const previewId = $(input).data("preview");
//         previewImage(event, previewId);
//     });
//
//     function previewImage(event, previewId) {
//         console.log("run")
//         const input = event.target;
//         const reader = new FileReader();
//
//         reader.onload = function () {
//             $("#" + previewId).attr("src", reader.result);
//         };
//
//         reader.readAsDataURL(input.files[0]);
//     }
// });


// document.getElementById("banner-login").addEventListener("change", function() {
//     var fileInput = this;
//
//     // Kiểm tra xem có tệp tin nào đã được chọn hay không
//     if (fileInput.files.length > 0) {
//         // Lấy đối tượng File đại diện cho tệp tin đã chọn
//         var file = fileInput.files[0];
//
//         // Hiển thị thông tin về tệp tin
//         console.log("File Name:", file.name);
//         console.log("File Size:", file.size, "bytes");
//         console.log("File Type:", file.type);
//     } else {
//         console.log("No file selected.");
//     }
// });


let removeButton = document.querySelector('#banner-login');
removeButton.addEventListener("change", function () {
    //create ajax request
    let xhr = new XMLHttpRequest();

    //prepare the request
    xhr.open("GET","banner-manager", true);

    // send the request
    xhr.send();

    //process the request
    xhr.onload = () => {
      if(xhr.status === 200) {
          // let data = xhr.responseText;
          console.log("xhr run");
      }
    };
})
