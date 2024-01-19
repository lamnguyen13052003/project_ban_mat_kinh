$(document).ready(function () {
    const button = $("#account-page").find(".account-sidebar-menu").find("li>button");
    button.click(function () {
        button.removeClass("active");
        const index = $(this).attr("data-bs-target");
        $(this).addClass("active");
        display_account_page(index);
    });

    $("#input-avatar").change(function () {
        var selectedFile = this.files[0];
        const imageUrl = window.URL.createObjectURL(selectedFile);
        $("#avatar").attr("src", imageUrl);
    });

    $("#signout").click(function () {
        $.get("/maven_war/LogOut", function (){
            window.location.replace("index.jsp");
        });
    });
});

function display_account_page(index) {
    const page = $("#account-page").find("div.account-page-content");
    page.removeClass("active");
    page.eq(index).addClass("active");
}

// document.querySelector("#update_profile").addEventListener("click",(e)=>{
//     e.preventDefault();
//     const dataF = new FormData(document.querySelector("#update_profile"));
//     console.log(dataF)
//     $.ajax({
//         url: 'api/profile',
//         data: dataF,
//         p':"multipart/form-data",
//         processData: false,
//         type: 'POST',
//         success: function ( data ) {
//             console.log(data)
//         }
//     });
// })

function uploadProfile() {
    var fullName = document.getElementById('fullname_edit').value;
    var sex = document.getElementById('sex_edit').value;
    var birthday = document.getElementById('birthday_edit').value;
    var avatarInput = document.getElementById('input-avatar');
        if (avatarInput.files.length > 0) {
            var avatarFile = avatarInput.files[0];
        }

    var formData = new FormData();
    formData.append('full_name', fullName);
    formData.append('sex', sex);
    formData.append('birthday', birthday);
    formData.append('avatar', avatarFile);
    $.ajax({
        url: 'api/profile',
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            console.log('Upload successful');
            console.log(response);
            Swal.fire({
                title: 'Thành công!',
                text: 'Cập nhật thành công',
                icon: 'susscess',
                confirmButtonText: 'Oke',
                timer: 1500
            }).then(rs=>location.reload())
        },
        error: function(error) {
            console.error('Error uploading profile');
            Swal.fire({
                title: 'Thất bại!',
                text: error.responseText,
                icon: 'error',
                confirmButtonText: 'Oke'
            })
        }
    });

}
function changePassword({email}){
    console.log(email)
    Swal.fire({
        title: 'Đổi mật khẩu',
        html:
            '<input id="password" type="password" class="swal2-input" placeholder="Mật khẩu">' +
            '<input id="confirmPassword" type="password" class="swal2-input" placeholder="Nhập lại mật khẩu">',
        showCancelButton: true,
        confirmButtonText: 'Gửi',
        cancelButtonText: 'Hủy',
        focusConfirm: false,
        preConfirm: () => {
            const password = Swal.getPopup().querySelector('#password').value;
            const confirmPassword = Swal.getPopup().querySelector('#confirmPassword').value;

            // Validate the passwords (you may want to add more validation)
            if (password !== confirmPassword) {
                Swal.showValidationMessage('Mật khẩu không hợp lệ!');
            }
            return { password: password, confirmPassword: confirmPassword };
        }
    }).then(async (result) => {
        if (result.isConfirmed) {
            const password = result.value.password;
            const rePassword = result.value.confirmPassword;
            console.log({
                email:email,
                password:password,
                rePassword:rePassword
            })
            const url = `/maven_war/user/changePassword`;

            try {
                const response = await fetch(url, {
                    method: "POST",
                    mode: "cors",
                    cache: "no-cache",
                    credentials: "same-origin",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        email: email,
                        password: password,
                        rePassword: rePassword
                    }),
                });

                const responseData = await response.json();
                if (response.ok) {
                    Swal.fire({
                        title: 'Thay đổi mật khẩu thành công',
                        confirmButtonText: 'OK'
                    });
                } else {
                    // Handle server response when not OK (e.g., display an error message)
                    Swal.fire({
                        icon: 'error',
                        title: 'Thay đổi mật khẩu thất bại',
                        confirmButtonText: 'OK'
                    });
                }
            } catch (err) {
                Swal.fire({
                    icon: 'error',
                    title: 'Shiba...',
                    text: err,
                    confirmButtonText: 'OK'
                });
            }


        }
    });
}