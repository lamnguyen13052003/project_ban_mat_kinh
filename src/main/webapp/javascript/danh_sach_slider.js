$(document).ready(function(){
  uploadFile();
  allChecked();
  removeSildes();
  disableRemoveButton();
});
function uploadFile() {
    $(".upload-img input").change(function (){
        const bannerId = $(this).attr("id");
        var file = $(this)[0].files[0];
        let formData = new FormData();
        formData.append(bannerId, file);
        $.ajax({
            url : 'upload-file-on-banner-management',
            data: formData,
            method: 'POST',
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data){
                if(bannerId === "slide-added"){
                    var slide = $('#show-slides').html();
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
                    $('#show-slides').html(slide);
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

function allChecked() {
    $("#select-all-img").on("click", function(){
        $( ".form-check-input" ).prop("checked", true);
    });
}

function removeSildes() {
    showModel();
    $("#remove-img").on("click", function(){
      $('.slide-management').each(function(index, element){
          var checked = $(element).find('input[type="checkbox"]').prop('checked');
          if (checked){
             $(element).addClass('d-none')
          }
      });
    });

}
function showModel() {
    $('.remove-img').on('click', function(){
        $('.btn-show-model').click();
    });
}
function disableRemoveButton() {
    let disableBtn = $('.remove-img');
    disableBtn.prop('disabled', true);
    $('.form-check-input').on('change', () => {
        disableBtn.prop('disabled', true);
        $('.form-check-input').each(function(index, element){
            let checked = $(element).prop('checked');
            if (checked){
                disableBtn.prop('disabled', false);
            }
        });
    });
}

function removeSlides() {
    
}


// function nonHover(element) {
//         if(element.prop('disabled')){
//             element.hover(() => {
//                 element.css('background-color','#fff').css('color', 'rgba(255,255,255,0.5)')
//                 .css('border','rgba(255,255,255,0) 2px solid')
//
//             },
//                 () => {
//                     element.css('background-color','#fff').css('color', 'rgba(255,255,255,0.5)')
//                         .css('border','rgba(255,255,255,0.5) 2px solid')
//                 }
//                 )
//         }
// }