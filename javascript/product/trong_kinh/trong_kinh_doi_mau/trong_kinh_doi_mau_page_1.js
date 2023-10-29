class Product {
    constructor(list_img, brand, name, old_price, new_price, amount_star, amount_rate, amount_selled, link_more_info) {
        this.list_img = list_img;
        this.brand = brand;
        this.name = name;
        this.old_price = old_price;
        this.new_price = new_price;
        this.amount_star = amount_star;
        this.amount_rate = amount_rate;
        this.amount_selled = amount_selled;
        this.link_more_info = link_more_info
    }
}

$(document).ready(function () {
    loaddingProduct();
})


function loaddingProduct() {
    var listInfoProduct = [
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/ZEISS-PhotoFusion-X-(Grey)-–-Trong-kinh-đoi-mau-(Xam)/bang-gia-trong-kinh-zeiss-lotutec-2023.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/ZEISS-PhotoFusion-X-(Grey)-–-Trong-kinh-đoi-mau-(Xam)/chiet-xuat-trong-kinh-622x400.jpg", ],"ZEISS", "ZEISS PhotoFusion X (Grey) – Tròng kính đổi màu (Xám)", 3688000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Gen8-Style-Colors/4-mau-style-color.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Gen8-Style-Colors/cong-nghe-kinh-doi-mau.jpg", ],"ESSILOR", "Tròng kính đổi màu Essilor Transitions Gen8 Style Colors", 3938000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-Kinh-Đoi-Mau-Chemi-Sun-Guard-Photo-Gray-Crystal-U2-Xam-Khoi/296039543_1095577517725483_4487753074039266781_n.png", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-Kinh-Đoi-Mau-Chemi-Sun-Guard-Photo-Gray-Crystal-U2-Xam-Khoi/kinh-doi-mau-chemi.jpg", ],"Chemi", "Tròng Kính Đổi Màu Chemi Sun Guard Photo Gray Crystal U2 Xám Khói", 660000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-ZEISS-PhotoFusion-X-–-Trong-kinh-đoi-mau/gong-kinh-zeiss-photofusion-X-1-800x800.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-ZEISS-PhotoFusion-X-–-Trong-kinh-đoi-mau/gong-kinh-zeiss-photofusion-X-2-510x510.jpg", ],"ZEISS", "Tròng kính ZEISS PhotoFusion X – Tròng kính đổi màu", 5380000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-VisionX-–-Singapore/bang-gia-trong-kinh-doi-mau-visionX.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-VisionX-–-Singapore/cac-lop-phu-trong-kinh-doi-mau-vision-x.jpg", ],"VisionX", "Tròng kính đổi màu VisionX – Singapore", 1150000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Elements-Photo-Grey-(Xam-khoi)/bang-gia-trong-kinh-doi-mau-element.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Elements-Photo-Grey-(Xam-khoi)/trong-kinh-doi-mau-element-2.jpg", ],"ELEMENT", "Tròng kính đổi màu Elements Photo Grey (Xám khói)", 1180000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-kiem-soat-anh-sang-xanh-–-Chemi-1,60-ASP-PhotoBlue/giay-chung-nhan-dai-li-chemi.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-kiem-soat-anh-sang-xanh-–-Chemi-1,60-ASP-PhotoBlue/trong-kinh-doi-mau-anh-sang-xanh-chemi-1-1.jpg", ],"CHEMI", "Tròng kính đổi màu kiểm soát ánh sáng xanh – Chemi 1,60 ASP PhotoBlue", 1480000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Classic-(-Khoi-Tra-)/bang-gia-trong-kinh-doi-mau-essilor-transition-classic-2022.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Classic-(-Khoi-Tra-)/noi-dung-trong-kinh-essilor-transitions-crizal-forte-uv-1.50-airmark-3.png", ],"ESSILOR", "Tròng kính đổi màu Essilor Transitions Classic ( Khói Trà )", 1980000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Gen8/bang-gia-trong-kinh-doi-mau-essilor-gen8-2022.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Gen8/banner-trong-kinh-doi-mau-essilor-transition-gen8.jpg", ],"ESSILOR", "Tròng kính đổi màu Essilor Transitions Gen8", 3338000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/demo.html"),
    ];

    let index = 0;

    listInfoProduct.forEach((info) => {
        var product = $("div.pro-loop").eq(index);
        loaddingImg(product, info.list_img);
        loaddingBrand(product, info.brand);
        loaddingName(product, info.name)
        loaddingPrice(product, info.old_price, info.new_price);
        loaddingStar(product, info.amount_star);
        loaddingAmountRate(product, info.amount_rate);
        loaddingAmountSelled(product, info.amount_selled)
        loaddingLinkMoreInfo(product, info.link_more_info);
        index++;
    });

    /*Xóa các khung hiển thị đi*/
    for(; index < 20; index++){
        $("div.pro-loop").eq(index).addClass("d-none")
    }
}

function loaddingImg(product, listImg) {
    let index = 0;
    listImg.forEach((link) =>{
        product.find(".pro-loop-image picture img").eq(index).attr("src", link);
        index++;
    });
}


function loaddingBrand(product, brand){
    product.find(".pro-loop-brand>span").text(brand);
}

function loaddingName(product, name){
    product.find(".pro-loop-name>a").text(name);
    product.find(".pro-loop-name>a").attr("title", name);
}

function loaddingPrice(product, old_price, new_price){
    if(new_price === null){
        product.find(".pro-loop-price>p").html(formatNumber(old_price) + " <span> ₫</span>");
        product.find(".pro-loop-price>del").text("");
    }else{
        product.find(".pro-loop-price>p").html(formatNumber(new_price) + " <span> ₫</span>");
        product.find(".pro-loop-price>del").html(formatNumber(old_price) + " <span> ₫</span>");
    }
}

function loaddingStar(product, amount){
    product.find(".sold_qty .onirvapp--shape-container li").removeClass("checked")
    for(let i = 0; i < amount; i++){
        product.find(".sold_qty .onirvapp--shape-container li").eq(i).addClass("checked");
    }
}

function loaddingAmountRate(product, amount){
    product.find(".sold_qty .prod-review-loop>span").text("(" + amount + " đánh giá)")
}

function loaddingAmountSelled(product, amount) {
    product.find(".sold_qty .sold_qty_num>p>span").text(amount)
}

function loaddingLinkMoreInfo(product, link){
    product.find(".pro-loop-image>a").attr("href", link);
}

function formatNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
