$(document).ready(function () {
    uploadFile();
    allChecked();
    showModel();
    disableRemoveButton();
    getSlideChecked();
});

function uploadFile() {
    $(".upload-img input").change(function () {
        const bannerId = $(this).attr("id");
        var file = $(this)[0].files[0];
        const formData = new FormData();
        // formData.append('slide-id', $('.slide-management').last().attr('slide-id'));
        formData.append(bannerId, file);
        $.ajax({
            url: 'upload-file-on-banner-management',
            data: formData,
            method: 'POST',
            dataType: 'json',
            processData: false,
            contentType: false,
            success: function (data) {
                    $(`img[data-banner="${bannerId}"]`).attr("src", "../" + data.url);
            },
            error: function () {
                console.log("error uploading file");
            }
        });
    });
}

function allChecked() {
    $("#select-all-img").click(function () {
        $('.slide-management input[type=\"checkbox\"]').prop("checked", true);
        let disableBtn = $('.remove-img');
        disableBtn.prop('disabled', false);
    });
}

function showModel() {
    $('.remove-img').on('click', function () {
        $('.btn-show-model').click();
    });
}

function disableRemoveButton() {
    let disableBtn = $('.remove-img');
    disableBtn.prop('disabled', true);
    $('.slide-management').on('change', function () {
        $('.slide-management input[type=\"checkbox\"]').each(function getCheck(index, element) {
            let checked = $(element).prop('checked');
            if (checked) {
                disableBtn.prop('disabled', false);
                return false;
            }
            if(index === $(this).length - 1) {disableBtn.prop('disabled', true);}
        })
    });

}

function getSlideChecked() {
    $('.slide-management input[type="checkbox"]').on('change', () => {
        $('.slide-management input[type="checkbox"]').each((index, element) => {
            let checked = $(element).prop('checked');
            if (checked) {
                disableRemoveButton(false)
                let slideId = $(element).closest('.slide-management').attr('slide-id');
                let filePath = $(element).closest('.slide-management').find('img').attr('src');
                removeSlides(slideId, filePath);
            }
        })
    });
}

function removeSlides(slideId, filePath) {
    const formData = new FormData();
    formData.append('slideId', slideId);
    formData.append("file-path", filePath);
    $('#remove-img').click(() => {
        $.ajax({
            url: 'banner',
            data: formData,
            method: 'DELETE',
            dataType: "text",
            processData: false,
            contentType: false,
            success: function (data) {
                $('div[slide-id="' + slideId + '"]').remove();
            },
            error: function () {
                console.log("error");
            }
        })

    })
}

