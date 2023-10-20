$(document).ready(function () {
    $("input#search").each(function () {
        displayPlaceholder($(this));
    });
});

function displayPlaceholder(element){
    if (!element.val()) {
        var string = "Nhập tên sản phẩm!       ";
        var val = "";
        let index = 0;
        setInterval(function (char) {
            val += string.charAt(index);
            element.attr("placeholder", val);
            index++;
            if(index === string.length){
                index = 0;
                val = "";
                element.attr("placeholder", "");
            }
        }, 150);
    }
}
/**main**/
/*section 1*/

$(document).ready(function() {
    var currentSlide = 0;
    var totalSlides = $('.slide').length;

    function showSlide(slideIndex) {
        $('.slide').hide();
        $('.slide:eq(' + slideIndex + ')').fadeIn(600, 'linear');
    }

    $('.right').click(function() {
        $('.carousel ul li button').removeClass('slick-active');
        currentSlide = (currentSlide + 1) % totalSlides;
        $('.carousel ul li:nth-child('+(currentSlide + 1)+') button').addClass('slick-active');
        showSlide(currentSlide);
    });

    $('.left').click(function() {
        $('.carousel ul li button').removeClass('slick-active');
        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
        $('.carousel ul li:nth-child('+(currentSlide + 1)+') button').addClass('slick-active');
        showSlide(currentSlide);
    });
    // btn phan trang
    $('.slick').click(function () {
        clearInterval(interval);
        $('.carousel ul li button').removeClass('slick-active');
        $(this).addClass('slick-active');
        var elementID = $($(this)).attr('id');
        var index = parseInt(elementID[elementID.length - 1]);
        showSlide(index);
    })

    // Tự động chuyển slide sau một khoảng thời gian
    function autoSlide() {
        $('.carousel ul li button').removeClass('slick-active');
        currentSlide = (currentSlide + 1) % totalSlides;
        $('.carousel ul li:nth-child('+(currentSlide + 1)+') button').addClass('slick-active');
        showSlide(currentSlide);
    }

    var interval = setInterval(autoSlide, 5000);

    $('.carousel').hover(
        function() {
            clearInterval(interval);
        },
        function() {
            interval = setInterval(autoSlide, 5000);
        }
    );

    showSlide(currentSlide);
});

/****section 2*******/
$(document).ready(function() {
    var initialImage = "../font/img-fsale/item_1.png";
    var hoverImage = "../font/img-fsale/item_1_hover_sm.png";
    $(".no-hover-img").hover(
        function() {
            $(this).attr("src", hoverImage);
        },
        function() {
            $(this).attr("src", initialImage);
        }
    );
});
/*fire to-nho*/
$(document).ready(function() {
    var isLarge = false;

    function resizeImage() {
        if (isLarge) {
            $(".to-nho").css({ width: "30px", height: "30px" });
        } else {
            $(".to-nho").css({ width: "50px", height: "50px" });
        }
        isLarge = !isLarge; // Đảo ngược trạng thái kích thước
    }
    setInterval(resizeImage, 100);
});







