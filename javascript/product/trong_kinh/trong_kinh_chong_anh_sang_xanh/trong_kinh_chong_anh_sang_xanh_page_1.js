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
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Chemi-Perfect-UV-Crystal-U6-Coated-1.60-(Loc-anh-sang-xanh)/noi-dong-trong-kinh-chemi-u6-1-536x400.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Chemi-Perfect-UV-Crystal-U6-Coated-1.60-(Loc-anh-sang-xanh)/Photo-12-06-10-24-12-2017-scaled-450x450.jpg", ],"CHEMI", "Tròng kính Chemi Perfect UV Crystal U6 Coated 1.60 (Lọc ánh sáng xanh)", 872000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Elements-UV-Blue-Cut-–-Loc-anh-sang-xanh/bang-gia-trong-kinh-anh-sang-xanh-element.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Elements-UV-Blue-Cut-–-Loc-anh-sang-xanh/trong-kinh-anh-sang-xanh-element-2-768x768.jpg", ],"Element", "Tròng kính Elements UV Blue Cut – Lọc ánh sáng xanh", 480000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-HOYA-Stellify-Blue-Control-1.55-(Loc-anh-sang-xanh)/bang-gia-trong-kinh-hoya-2023.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-HOYA-Stellify-Blue-Control-1.55-(Loc-anh-sang-xanh)/blue-control-400x400.jpg", ],"HOYA", "Tròng kính HOYA Stellify Blue Control 1.55 (Lọc ánh sáng xanh)", 930000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Zeiss-Digital-DuraVision-BlueProtect-UV--Trong-kinh-loc-anh-sang-xanh/bang-gia-trong-kinh-zeiss-digital.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Zeiss-Digital-DuraVision-BlueProtect-UV--Trong-kinh-loc-anh-sang-xanh/chiet-xuat-trong-kinh-622x400.jpg", ]," ZEISS", "Zeiss Digital DuraVision BlueProtect UV- Tròng kính lọc ánh sáng xanh", 4480000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-sieu-mong-loc-anh-sang-xanh-Chemi-Perfect-UV-U6-1.74/banner-trong-kinh-anh-sang-anh-u6-sieu-mong.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-sieu-mong-loc-anh-sang-xanh-Chemi-Perfect-UV-U6-1.74/chemi-u6-anh-sang-xanh-1-1-510x510.jpg", ],"CHEMI", "Tròng kính siêu mỏng lọc ánh sáng xanh Chemi Perfect UV U6 1.74", 872000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Essilor-Crizal-Prevencia-anh-sang-xanh/bang-gia-trong-kinh-anh-sang-xanh-essilor-prevencia-2022.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Essilor-Crizal-Prevencia-anh-sang-xanh/crizal-prevencia-768x402.jpg", ],"ESSILOR", "Tròng kính Essilor Crizal Prevencia ánh sáng xanh", 1380000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Đon-trong-đanh-Freeform-Visual-Tech/23_ca47760bc00241619c75d2d3593dfc5a.png", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Đon-trong-đanh-Freeform-Visual-Tech/ho_tro_đo_can.png", ],"Visual Tech", "Đơn tròng đánh Freeform Visual Tech", 1600000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-ZEISS-BlueGuard-–-Trong-kinh-loc-anh-sang-xanh/trong-kinh-zeiss-bluegruard-1-1-800x800.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-ZEISS-BlueGuard-–-Trong-kinh-loc-anh-sang-xanh/trong-kinh-zeiss-bluegruard-2-1-800x800.jpg", ]," ZEISS", "Tròng kính ZEISS BlueGuard – Tròng kính lọc ánh sáng xanh", 2780000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-HOYA-Stellify-Blue-Control-1.60-(Loc-anh-sang-xanh)/bang-gia-trong-kinh-hoya-2023.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-HOYA-Stellify-Blue-Control-1.60-(Loc-anh-sang-xanh)/blue-control-400x400.jpg", ],"HOYA", "Tròng kính HOYA Stellify Blue Control 1.60 (Lọc ánh sáng xanh)", 1580000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Kodak-UVBlue-Lens-–-Loc-anh-sang-xanh/1_s5374.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Kodak-UVBlue-Lens-–-Loc-anh-sang-xanh/bang-gia-trong-kinh-kodak-uvblue-lens-anh-sang-xanh.jpg", ],"KODAK", "Tròng kính Kodak UVBlue Lens – Lọc ánh sáng xanh", 1000000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Chemi-Perfect-UV-Crystal-U6-Coated-1.67-(Loc-anh-sang-xanh)/noi-dong-trong-kinh-chemi-u6-1-536x400.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Chemi-Perfect-UV-Crystal-U6-Coated-1.67-(Loc-anh-sang-xanh)/thong-so-ky-thuat-chiet-suat-trong-kinh-1-603x400.jpg", ],"CHEMI", "Tròng kính Chemi Perfect UV Crystal U6 Coated 1.67 (Lọc ánh sáng xanh)", 1360000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Essilor-Crizal-Rock/bang-gia-trong-kinh-essilor-crizal-rock-co-san.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/Trong-kinh-Essilor-Crizal-Rock/gioi-thieu-trong-kinh-essilor-crizal-rock.jpg", ],"ESSILOR", "Tròng kính Essilor Crizal Rock", 1230000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/ZEISS-DuraVision-BlueProtect-UV-–-Trong-kinh-loc-anh-sang-xanh/bang-gia-trong-kinh-zeiss-lotutec-2023.jpg", "../../images/product/trong-kinh/trong-kinh-chong-anh-sang-xanh/ZEISS-DuraVision-BlueProtect-UV-–-Trong-kinh-loc-anh-sang-xanh/bao-bi-trong-kinh-anh-sang-xanh-zeiss-duravision-blueprotect-510x510.jpg", ],"ZEISS", "ZEISS DuraVision BlueProtect UV – Tròng kính lọc ánh sáng xanh", 1290000.0, null, 3, 1344, 8820, "../../product/trong_kinh/more_info/demo.html"),
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
