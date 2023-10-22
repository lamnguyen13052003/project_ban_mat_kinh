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
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.60-SP/Mo-rong-1.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.60-SP/Mo-rong.png", ],"Chemi", "Tròng Kính Chemi U1 1.60 SP", 300000.0, 270000.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.67-ASP/Mo-ta-1.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U1-1.67-ASP/Mo-ta-2.png", ],"Chemi", "Tròng Kính Chemi U1 1.67 ASP", 700000.0, 630000.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Hoya-Phoenix-1.53HVP-Triver/hoya-phoenix-001_master.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Hoya-Phoenix-1.53HVP-Triver/hoya-phoenix-trivex-_1__master.png", ],"Hoya", "Tròng Kính Hoya Phoenix 1.53HVP Triver", 1480000.0, 1332000.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U2-1.60SP/chemi-u2-1-6-001_master.png", "../../images/product/trong-kinh/trong-kinh-dung-cho-kinh-khoan/Trong-Kinh-Chemi-U2-1.60SP/demo-slide-1.png", ],"Chemi", "Tròng Kính Chemi U2 1.60SP", 0.0, 0.0, 1, 5606, 9238, "../../product/gong_kinh/more_info/demo.html"),
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
