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
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Chemi-Perfect-UV-Crystal-U6-Coated-1.60-(Loc-anh-sang-xanh)/noi-dong-trong-kinh-chemi-u6-1-536x400.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Chemi-Perfect-UV-Crystal-U6-Coated-1.60-(Loc-anh-sang-xanh)/Photo-12-06-10-24-12-2017-scaled-450x450.jpg", ],"CHEMI", "Tròng kính Chemi Perfect UV Crystal U6 Coated 1.60 (Lọc ánh sáng xanh)", 872000.0, null, 3, 1344, 8820, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Elements-UV-Blue-Cut-–-Loc-anh-sang-xanh/bang-gia-trong-kinh-anh-sang-xanh-element.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Elements-UV-Blue-Cut-–-Loc-anh-sang-xanh/trong-kinh-anh-sang-xanh-element-2-768x768.jpg", ],"Element", "Tròng kính Elements UV Blue Cut – Lọc ánh sáng xanh", 480000.0, null, 3, 1344, 8820, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-HOYA-Stellify-Blue-Control-1.55-(Loc-anh-sang-xanh)/bang-gia-trong-kinh-hoya-2023.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-HOYA-Stellify-Blue-Control-1.55-(Loc-anh-sang-xanh)/blue-control-400x400.jpg", ],"HOYA", "Tròng kính HOYA Stellify Blue Control 1.55 (Lọc ánh sáng xanh)", 930000.0, null, 3, 1344, 8820, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Zeiss-Digital-DuraVision-BlueProtect-UV--Trong-kinh-loc-anh-sang-xanh/bang-gia-trong-kinh-zeiss-digital.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Zeiss-Digital-DuraVision-BlueProtect-UV--Trong-kinh-loc-anh-sang-xanh/chiet-xuat-trong-kinh-622x400.jpg", ]," ZEISS", "Zeiss Digital DuraVision BlueProtect UV- Tròng kính lọc ánh sáng xanh", 4480000.0, null, 3, 1344, 8820, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-sieu-mong-loc-anh-sang-xanh-Chemi-Perfect-UV-U6-1.74/banner-trong-kinh-anh-sang-anh-u6-sieu-mong.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-sieu-mong-loc-anh-sang-xanh-Chemi-Perfect-UV-U6-1.74/chemi-u6-anh-sang-xanh-1-1-510x510.jpg", ],"CHEMI", "Tròng kính siêu mỏng lọc ánh sáng xanh Chemi Perfect UV U6 1.74", 872000.0, null, 3, 1344, 8820, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.60-SP/Mo-rong-1.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.60-SP/Mo-rong.png", ],"Chemi", "Tròng Kính Chemi U1 1.60 SP", 300000.0, 270000.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.67-ASP/Mo-ta-1.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.67-ASP/Mo-ta-2.png", ],"Chemi", "Tròng Kính Chemi U1 1.67 ASP", 700000.0, 630000.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Hoya-Phoenix-1.53HVP-Triver/hoya-phoenix-001_master.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Hoya-Phoenix-1.53HVP-Triver/hoya-phoenix-trivex-_1__master.png", ],"Hoya", "Tròng Kính Hoya Phoenix 1.53HVP Triver", 1480000.0, 1332000.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U2-1.60SP/chemi-u2-1-6-001_master.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U2-1.60SP/demo-slide-1.png", ],"Chemi", "Tròng Kính Chemi U2 1.60SP", 0.0, 0.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-ZEISS-PhotoFusion-X-–-Trong-kinh-đoi-mau/gong-kinh-zeiss-photofusion-X-1-800x800.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-ZEISS-PhotoFusion-X-–-Trong-kinh-đoi-mau/gong-kinh-zeiss-photofusion-X-2-510x510.jpg", ],"ZEISS", "Tròng kính ZEISS PhotoFusion X – Tròng kính đổi màu", 5380000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-VisionX-–-Singapore/bang-gia-trong-kinh-doi-mau-visionX.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-VisionX-–-Singapore/cac-lop-phu-trong-kinh-doi-mau-vision-x.jpg", ],"VisionX", "Tròng kính đổi màu VisionX – Singapore", 1150000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Elements-Photo-Grey-(Xam-khoi)/bang-gia-trong-kinh-doi-mau-element.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Elements-Photo-Grey-(Xam-khoi)/trong-kinh-doi-mau-element-2.jpg", ],"ELEMENT", "Tròng kính đổi màu Elements Photo Grey (Xám khói)", 1180000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-kiem-soat-anh-sang-xanh-–-Chemi-1,60-ASP-PhotoBlue/giay-chung-nhan-dai-li-chemi.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-kiem-soat-anh-sang-xanh-–-Chemi-1,60-ASP-PhotoBlue/trong-kinh-doi-mau-anh-sang-xanh-chemi-1-1.jpg", ],"CHEMI", "Tròng kính đổi màu kiểm soát ánh sáng xanh – Chemi 1,60 ASP PhotoBlue", 1480000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Classic-(-Khoi-Tra-)/bang-gia-trong-kinh-doi-mau-essilor-transition-classic-2022.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Classic-(-Khoi-Tra-)/noi-dung-trong-kinh-essilor-transitions-crizal-forte-uv-1.50-airmark-3.png", ],"ESSILOR", "Tròng kính đổi màu Essilor Transitions Classic ( Khói Trà )", 1980000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Gen8/bang-gia-trong-kinh-doi-mau-essilor-gen8-2022.jpg", "../../images/product/trong-kinh/trong-kinh-doi-mau/Trong-kinh-đoi-mau-Essilor-Transitions-Gen8/banner-trong-kinh-doi-mau-essilor-transition-gen8.jpg", ],"ESSILOR", "Tròng kính đổi màu Essilor Transitions Gen8", 3338000.0, null, 1, 4365, 9836, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.67-SP/bang-mau.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.67-SP/chemi-color-blue-80f-01_821c376c65a446c1b34bfd13f2709419_master.png", ]," Chemi", "Tròng Kính Màu Chemi Stock U2 1.67 SP", 1240000.0, 1116000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Mau-Phan-Cuc-Mong-1.61-Polarized-Optimax-(-Đo-Can-0-đen--6.00)/Mo-ta-1.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Mau-Phan-Cuc-Mong-1.61-Polarized-Optimax-(-Đo-Can-0-đen--6.00)/trong_kinh_mau_161_polarized_optimax__1__32f1fc15312d4338af0e3e4bab08b6f3_master.png", ]," Optimax", "Tròng Màu Phấn Cực Mỏng 1.61 Polarized Optimax ( Độ Cận 0 đến -6.00)", 800000.0, 720000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Kinh-Đon-Trong-Đanh-Nhuom-Mau-ZEISS-DuraVision-Platinum-UV-Tieu-chuan-(AS)/kinh1-copy.png", "../../images/product/trong-kinh/trong-kinh-mau/Kinh-Đon-Trong-Đanh-Nhuom-Mau-ZEISS-DuraVision-Platinum-UV-Tieu-chuan-(AS)/kinh1.png", ],"ZEISS", "Kính Đơn Tròng Đánh Nhuộm Màu ZEISS DuraVision Platinum UV Tiêu chuẩn (AS)", 3680000.0, 3312000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.60-SP/bang-mau.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.60-SP/chemi-color-blue-80f-01_821c376c65a446c1b34bfd13f2709419_master.png", ]," Chemi", "Tròng Kính Màu Chemi Stock U2 1.60 SP", 800000.0, 720000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Đanh-Mau-Chemi-Rx-Tieu-Chuan/156-400asp_master.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Đanh-Mau-Chemi-Rx-Tieu-Chuan/bang-mau-thuc-te.png", ],"Chemi", "Tròng Đánh Màu Chemi Rx Tiêu Chuẩn", 2034000.0, 1830600.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
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
