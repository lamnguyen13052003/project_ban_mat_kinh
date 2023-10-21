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
    //     var product1 = new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s03_master.png"],"branh 1", "tên 1", 150000, 120000, 5, 20, 25, "../../product/trong_kinh/more_info/demo.html");
    // var product2 = new Product([], "branh 2", "tên 2", 120000, null, 1, 200, 210, "../../product/trong_kinh/more_info/demo.html");
    // var listInfProduct = [product1, product2];
    loaddingProduct();
})


function loaddingProduct() {
    var listInfoProduct = [
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K1/s7-playkids-k1-c128-007_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K1/s7-playkids-k1-c258-002_master.png", ],"S7 Playkids", "Gọng Kính Trẻ Em PLAY KIDS S7 & ILUVU K1", 1600000.0, 1440000.0, 5, 2464, 5827, "../../product/trong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-OEM-JC054/gong-kinh-can-tre-em-054-06_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-OEM-JC054/gong-kinh-can-tre-em-054-12_master.png", ],"OEM", "Gọng Kính Trẻ Em TR90 OEM JC054", 150000.0, 135000.0, 5, 2464, 5827, "../../product/trong_kinh/more_info/demo.html"),
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
