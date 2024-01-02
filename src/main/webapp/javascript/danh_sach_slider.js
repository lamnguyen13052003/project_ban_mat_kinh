$(document).ready(function(){
  uploadFile();
  allChecked();
  removeSildes();
    dissableRemoveButton();
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
              nonChecked = true;
             $(element).addClass('d-none')
          }
      })
    });

}
function showModel() {
    $('.remove-img').on('click', function(){
        $('.btn-show-model').click();
    });
}
function dissableRemoveButton() {
    $('.form-check-input').on('change', () => {
        console.log($(this).length);
    })
    // if(!check){
    //     $('.remove-img').prop('disabled', true);
    // }else{
    //     $('.remove-img').prop('disabled', false);
    // }
}