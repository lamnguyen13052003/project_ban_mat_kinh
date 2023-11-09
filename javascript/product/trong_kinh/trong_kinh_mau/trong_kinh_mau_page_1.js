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
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.67-SP/bang-mau.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.67-SP/chemi-color-blue-80f-01_821c376c65a446c1b34bfd13f2709419_master.png", ]," Chemi", "Tròng Kính Màu Chemi Stock U2 1.67 SP", 1240000.0, 1116000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Mau-Phan-Cuc-Mong-1.61-Polarized-Optimax-(-Đo-Can-0-đen--6.00)/Mo-ta-1.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Mau-Phan-Cuc-Mong-1.61-Polarized-Optimax-(-Đo-Can-0-đen--6.00)/trong_kinh_mau_161_polarized_optimax__1__32f1fc15312d4338af0e3e4bab08b6f3_master.png", ]," Optimax", "Tròng Màu Phấn Cực Mỏng 1.61 Polarized Optimax ( Độ Cận 0 đến -6.00)", 800000.0, 720000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Kinh-Đon-Trong-Đanh-Nhuom-Mau-ZEISS-DuraVision-Platinum-UV-Tieu-chuan-(AS)/kinh1-copy.png", "../../images/product/trong-kinh/trong-kinh-mau/Kinh-Đon-Trong-Đanh-Nhuom-Mau-ZEISS-DuraVision-Platinum-UV-Tieu-chuan-(AS)/kinh1.png", ],"ZEISS", "Kính Đơn Tròng Đánh Nhuộm Màu ZEISS DuraVision Platinum UV Tiêu chuẩn (AS)", 3680000.0, 3312000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.60-SP/bang-mau.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U2-1.60-SP/chemi-color-blue-80f-01_821c376c65a446c1b34bfd13f2709419_master.png", ]," Chemi", "Tròng Kính Màu Chemi Stock U2 1.60 SP", 800000.0, 720000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Đanh-Mau-Chemi-Rx-Tieu-Chuan/156-400asp_master.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Đanh-Mau-Chemi-Rx-Tieu-Chuan/bang-mau-thuc-te.png", ],"Chemi", "Tròng Đánh Màu Chemi Rx Tiêu Chuẩn", 2034000.0, 1830600.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U1-1,60/bang-mau.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Chemi-Stock-U1-1,60/chemi-color-blue-80f-01_821c376c65a446c1b34bfd13f2709419_master.png", ],"Chemi", "Tròng Kính Màu Chemi Stock U1 1,60", 560000.0, 504000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Ecolite-SunLens-By-Essilor/trong-kinh-mau-khoi-essilor-sunlens-gray-85-001_master.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mau-Ecolite-SunLens-By-Essilor/trong-kinh-mau-khoi-essilor-sunlens-gray-85-002_master.png", ],"SunLens", "Tròng Kính Màu Ecolite SunLens By Essilor", 630000.0, 567000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mat-Trang-Guong-Phan-Cuc-Optimax/optimax-201_016d79edc75b4c35bfb80e48db80ba6c_master.png", "../../images/product/trong-kinh/trong-kinh-mau/Trong-Kinh-Mat-Trang-Guong-Phan-Cuc-Optimax/optimax-202_2845002af793463e94126b4782c0c6f8_master.png", ],"Optimax", "Tròng Kính Mát Tráng Gương Phân Cực Optimax", 600000.0, 540000.0, 5, 621, 7037, "../../product/gong_kinh/more_info/thong_tin_san_pham.html"),
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
