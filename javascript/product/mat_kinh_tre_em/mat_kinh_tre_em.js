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
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11005/12999461550_1562894287_a0d45da4cb0d447787804b4c57455ade_master - Copy.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11005/12999461550_1562894287_a0d45da4cb0d447787804b4c57455ade_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 11005", 150000.0, 135000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-3507/2020-01-14_164104_7bcd7e0c7aed4b5a96bdbf353452588f_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-3507/2020-01-14_164139_e5398e702abd49f590db5a8a399e2253_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 3507", 150000.0, 135000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Chuon-Chuon-Phi-Cong-Pilot-Phan-Cuc-Tre-Em-Aviator-Tu-4---10-Tuoi-Lapola-3029/lapola-3029__2__a915535d764947bc9c3aeedbc7df9233_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Chuon-Chuon-Phi-Cong-Pilot-Phan-Cuc-Tre-Em-Aviator-Tu-4---10-Tuoi-Lapola-3029/lapola-3029__3__6c6d36d7acc4498691dcb7f6477a62e0_master.png", ],"Lapola", "Kính Mát Chuồn Chuồn Phi Công Pilot Phân Cực Trẻ Em Aviator Từ 4 - 10 Tuổi Lapola 3029", 300000.0, 270000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-32005/2020-01-14_162408_6b2d485d580842e784091ed19e9ccf07_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-32005/untitled-7_bd01545bce3c4658a5ce1fcba36d45c5_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 32005", 150000.0, 135000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S8239/2020-01-14_161539_407b2b46cfa54f9f9542b75dd3b3c3c5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S8239/2020-01-14_161623_5944896e84e146589a58df72c52f55df_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S8239", 150000.0, 135000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-MC802/802__4__cfddb4b10ece4c2496fc7bee3f843276_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-MC802/802__5__6ecc83de6ca5482e95714fab22c72b62_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM MC802", 150000.0, 135000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11014/2020-01-14_165242_ede8b07bce704601b9f204bd0c82c56f_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11014/2020-01-14_165358_dc25ad580bd545bb8eacc05fc20e4634_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 11014", 150000.0, 135000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Mat-Kinh-Double-Shield-90960S/dbs_291_2e3cd561a9fa40388cc4550475957922_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Mat-Kinh-Double-Shield-90960S/dbs_294_00b54a4ad8c1473396609458550b1f59_master.png", ],"Double Shield", "Mắt Kính Double Shield 90960S", 80000.0, 72000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Bolon-BK5008/bk5008-f10-45_-510x510_c0a4a9bdd0cc4df685aece75b185a1c5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Bolon-BK5008/bk5008-f10-front-view-510x510_2732e7ac9f7e45dda516b5e2ce09031b_master.png", ],"BOLON", "Kính Mát Trẻ Em Bolon BK5008", 1600000.0, 1440000.0, 4, 5703, 9490, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-SONATA-R701/sonata-r701-c01_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-SONATA-R701/sonata-r701-c02_master.png", ],"SONATA", "Gọng Kính Trẻ Em TR90 SONATA R701", 550000.0, null, 2, 7602, 8652, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Nam-Nu-HangTen-HT201415K/gong-kinh-hangten-ht201415k-001_090d9a3f55a24ba990d455e8eee6ad3e_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Nam-Nu-HangTen-HT201415K/gong-kinh-hangten-ht201415k-003_0da63b19cddc4ff19a4c1752c9d4ed8e_master.png", ],"HANGTEN ", "Gọng Kính Trẻ Em Nam Nữ HangTen HT201415K", 680000.0, null, 2, 7602, 8652, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-tu-5---13-Tuoi-TR90-Chong-Anh-Sang-Xanh-Zola-5109/tr5109-_6__e773d085e895419e8c76a10c68ac0b8d_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-tu-5---13-Tuoi-TR90-Chong-Anh-Sang-Xanh-Zola-5109/tr5109-_7__9591222aac074a90a5edaf4cc81ce341_master.png", ]," Zola", "Gọng Kính Trẻ Em từ 5 - 13 Tuổi TR90 Chống Ánh Sáng Xanh Zola 5109", 400000.0, 360000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Chong-Anh-Sang-Xanh-Tre-Em-Tu-5---12-Tuoi-Jason-5108/z4003194875786_480b39d9c12d96071622a15d65733075_a3199e1f916e455a90715eda66e6cbfb_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Chong-Anh-Sang-Xanh-Tre-Em-Tu-5---12-Tuoi-Jason-5108/z4003195002691_4117d42c2a614bb516c65c859bba06e2_741e8af6d20745fd838b2461202f5ded_master.png", ],"Jason", "Kính Chống Ánh Sáng Xanh Trẻ Em Từ 5 - 12 Tuổi Jason 5108", 400000.0, 360000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tron-Tre-Em-Chong-Anh-Sang-Xanh-Chong-Can-Hato-Unitech-8508/gong-kinh-tre-em-chong-anh-sang-xanh-unitech-8508__1.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tron-Tre-Em-Chong-Anh-Sang-Xanh-Chong-Can-Hato-Unitech-8508/gong-kinh-tre-em-chong-anh-sang-xanh-unitech-8508__2.png", ],"Jason", "Gọng Kính Tròn Trẻ Em Chống Ánh Sáng Xanh Chống Cận Hato Unitech 8508", 250000.0, 225000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YK8146/yk8146__2__0986e7a18e384386aeafb31e8c88dd95_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YK8146/yk8146__3__2a3b97bae7954b99a84a909a6159923f_master.png", ],"JASON", "KÍNH MẮT TRẺ EM CHỐNG ÁNH SÁNG XANH JASON BLUE CUT YK8146", 250000.0, 225000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Chong-Anh-Sang-Xanh-Zola-5121/tr5121-_6__06ea059afb244b5eb5659c05da973b2b_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Chong-Anh-Sang-Xanh-Zola-5121/tr5121-_8__437dd7f3caa7468c9bb84c83c0e7f772_master.png", ],"Zola", "Gọng Kính Trẻ Em TR90 Chống Ánh Sáng Xanh Zola 5121", 400000.0, 360000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Xspice-6100/gong-tre-em-xspice-c1__1__b5ca7e0ce6f54a6daa7135b5e9774f0e_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Xspice-6100/gong-tre-em-xspice-c1__2__d76c47c9759649a7a94bd1a7ef0fa16b_master.png", ],"Xspice", "Gọng Kính Trẻ Em TR90 Xspice 6100", 420000.0, 378000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YKF8500/rento-mgf8100__14__9b3afbb0a5894765a4ae55eb272ca7c0_d783232f090f465abc0b9bbe24717b6e_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YKF8500/rento-mgf8100__15__708f6568243e4eed97c17943a24d07d3_cc876befaa04410aada2e75bc87275c6_master.png", ],"JASON", "KÍNH MẮT TRẺ EM CHỐNG ÁNH SÁNG XANH JASON BLUE CUT YKF8500", 250000.0, 225000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K3/s7-playkids-k3-c128-001_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K3/s7-playkids-k3-c258-001_master.png", ],"S7 Playkids", "Gọng Kính Trẻ Em PLAY KIDS S7 & ILUVU K3", 1400000.0, 1260000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
        new Product(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K2/s7-playkids-c293-001.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K2/s7-playkids-c293-001_master.png", ],"S7 Playkids", "Gọng Kính Trẻ Em PLAY KIDS S7 & ILUVU K2", 1400000.0, 1260000.0, 5, 2464, 5827, "../../product/gong_kinh/more_info/demo.html"),
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
