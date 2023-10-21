class GongKinhTreEm {
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
    //     var product1 = new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s03_master.png"],"branh 1", "tên 1", 150000, 120000, 5, 20, 25, "../../product/gong_kinh/more_info/demo.html");
    // var product2 = new GongKinhTreEm([], "branh 2", "tên 2", 120000, null, 1, 200, 210, "../../product/gong_kinh/more_info/demo.html");
    // var listInfProduct = [product1, product2];
    loaddingProduct();
})


function loaddingProduct() {
    var listInfoProduct = [
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s01_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-JC052/gong-kinh-can-tre-em-hato-052-s03_master.png", ],"OEM", "Gọng Kính Cận Trẻ Em TR90 JC052", 135000.0, 150000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-LAOKAIKE-LK617/lk617-2_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-LAOKAIKE-LK617/lk617-3_master.png", ],"LAOKAIKE", "Gọng Kính Cận Trẻ Em TR90 LAOKAIKE LK617", 270000.0, 300000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-Vigcom-VG1537/gong-kinh-can-vigcom-vg1537-k10-01.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Can-Tre-Em-TR90-Vigcom-VG1537/gong-kinh-can-vigcom-vg1537-k10-01_master.png", ],"Vigcom", "Gọng Kính Cận Trẻ Em TR90 Vigcom VG1537", 270000.0, 300000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Bolon-Vick-BD5001/b31_f5e789ffa56649a7bfd40579c60f416c_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Bolon-Vick-BD5001/bd5001b10_df064d2535ef4fb1a21aab75469f723c_master.png", ],"BOLON", "Gọng Kính Trẻ Em Bolon Vick BD5001", 1440000.0, 1600000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Mat-Tre-Em-Chong-Anh-Sang-Xanh-Han-Che-Can-Giam-Moi-Mat-Hato-Unitech-Blue-Cut-2040/gong-kinh-tre-em-hato-jason-c32-model__2__215ed3338031471184237655844c2d3b_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Mat-Tre-Em-Chong-Anh-Sang-Xanh-Han-Che-Can-Giam-Moi-Mat-Hato-Unitech-Blue-Cut-2040/gong-kinh-tre-em-hato-jason-c32-model__4__2af1500fc6f84ffea61f57ba4c8434b9_master.png", ],"Hato Unitech", "Kính Mắt Trẻ Em Chống Ánh Sáng Xanh Hạn Chế Cận Giảm Mỏi Mắt Hato Unitech Blue Cut 2040", 225000.0, 250000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Chong-Anh-Sang-Xanh-Jason-ZC810/z4009470587239_ee4fea8b7604014735b9a563f6bf8485_b0e6b49f459a47c49e24de573c2a6ae7_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Chong-Anh-Sang-Xanh-Jason-ZC810/z4009470698230_ed97cc081ebc32f1e24dacc90d3c3abe_79f467aee2d84596a1bc3eec85c09130_master.png", ],"Jason", "Gọng Kính Trẻ Em Chống Ánh Sáng Xanh Jason ZC810", 540000.0, 600000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Mat-Tre-Em-Chong-Anh-Sang-Xanh-Jason-Blue-Cut-8100/rento-mgf8100__14__288ce39102e949e786efe9ba17ce595b_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Mat-Tre-Em-Chong-Anh-Sang-Xanh-Jason-Blue-Cut-8100/rento-mgf8100__15__7c89bc39326b4e03871ec01a0c9eca5f_master.png", ],"Jason", "Kính Mắt Trẻ Em Chống Ánh Sáng Xanh Jason Blue Cut 8100", 225000.0, 250000.0, "4", "9171", "9567", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-SONATA-R700/sonata-r700-c01_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-SONATA-R700/sonata-r700-c03_master.png", ],"SONATA", "Gọng Kính Trẻ Em TR90 SONATA R700", null, 650000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Mat-Tre-Em-Cat-Anh-Sang-Xanh-Zola-Blue-Cut-5105/001_ff341065b69346f3b58f4913ae3a9df3_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Mat-Tre-Em-Cat-Anh-Sang-Xanh-Zola-Blue-Cut-5105/002_7ebb9bbccc374095bddc77c865e694e7_master.png", ],"Zola", "Kính Mắt Trẻ Em Cắt Ánh Sáng Xanh Zola Blue Cut 5105", null, 480000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-SONATA-R701/sonata-r701-c01_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-SONATA-R701/sonata-r701-c02_master.png", ],"SONATA", "Gọng Kính Trẻ Em TR90 SONATA R701", null, 550000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Nam-Nu-HangTen-HT201415K/gong-kinh-hangten-ht201415k-001_090d9a3f55a24ba990d455e8eee6ad3e_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-Nam-Nu-HangTen-HT201415K/gong-kinh-hangten-ht201415k-003_0da63b19cddc4ff19a4c1752c9d4ed8e_master.png", ],"HANGTEN ", "Gọng Kính Trẻ Em Nam Nữ HangTen HT201415K", null, 680000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-tu-5---13-Tuoi-TR90-Chong-Anh-Sang-Xanh-Zola-5109/tr5109-_6__e773d085e895419e8c76a10c68ac0b8d_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-tu-5---13-Tuoi-TR90-Chong-Anh-Sang-Xanh-Zola-5109/tr5109-_7__9591222aac074a90a5edaf4cc81ce341_master.png", ]," Zola", "Gọng Kính Trẻ Em từ 5 - 13 Tuổi TR90 Chống Ánh Sáng Xanh Zola 5109", null, 400000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Chong-Anh-Sang-Xanh-Tre-Em-Tu-5---12-Tuoi-Jason-5108/z4003194875786_480b39d9c12d96071622a15d65733075_a3199e1f916e455a90715eda66e6cbfb_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Kinh-Chong-Anh-Sang-Xanh-Tre-Em-Tu-5---12-Tuoi-Jason-5108/z4003195002691_4117d42c2a614bb516c65c859bba06e2_741e8af6d20745fd838b2461202f5ded_master.png", ],"Jason", "Kính Chống Ánh Sáng Xanh Trẻ Em Từ 5 - 12 Tuổi Jason 5108", null, 400000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tron-Tre-Em-Chong-Anh-Sang-Xanh-Chong-Can-Hato-Unitech-8508/gong-kinh-tre-em-chong-anh-sang-xanh-unitech-8508__1__afa7c3cea6b847e28bdc0b3361066a97_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tron-Tre-Em-Chong-Anh-Sang-Xanh-Chong-Can-Hato-Unitech-8508/gong-kinh-tre-em-chong-anh-sang-xanh-unitech-8508__2__f752de80ccc44854b39ed300e0583713_master.png", ],"Jason", "Gọng Kính Tròn Trẻ Em Chống Ánh Sáng Xanh Chống Cận Hato Unitech 8508", null, 250000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YK8146/yk8146__2__0986e7a18e384386aeafb31e8c88dd95_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YK8146/yk8146__3__2a3b97bae7954b99a84a909a6159923f_master.png", ],"JASON", "KÍNH MẮT TRẺ EM CHỐNG ÁNH SÁNG XANH JASON BLUE CUT YK8146", null, 250000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Chong-Anh-Sang-Xanh-Zola-5121/tr5121-_6__06ea059afb244b5eb5659c05da973b2b_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Chong-Anh-Sang-Xanh-Zola-5121/tr5121-_8__437dd7f3caa7468c9bb84c83c0e7f772_master.png", ],"Zola", "Gọng Kính Trẻ Em TR90 Chống Ánh Sáng Xanh Zola 5121", null, 400000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Xspice-6100/gong-tre-em-xspice-c1__1__b5ca7e0ce6f54a6daa7135b5e9774f0e_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-TR90-Xspice-6100/gong-tre-em-xspice-c1__2__d76c47c9759649a7a94bd1a7ef0fa16b_master.png", ],"Xspice", "Gọng Kính Trẻ Em TR90 Xspice 6100", null, 420000.0, "3", "8476", "8718", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YKF8500/rento-mgf8100__14__9b3afbb0a5894765a4ae55eb272ca7c0_d783232f090f465abc0b9bbe24717b6e_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/KINH-MAT-TRE-EM-CHONG-ANH-SANG-XANH-JASON-BLUE-CUT-YKF8500/rento-mgf8100__15__708f6568243e4eed97c17943a24d07d3_cc876befaa04410aada2e75bc87275c6_master.png", ],"JASON", "KÍNH MẮT TRẺ EM CHỐNG ÁNH SÁNG XANH JASON BLUE CUT YKF8500", 225000.0, 250000.0, "3", "8708", "9320", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K3/s7-playkids-k3-c128-001_master.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K3/s7-playkids-k3-c258-001_master.png", ],"S7 Playkids", "Gọng Kính Trẻ Em PLAY KIDS S7 & ILUVU K3", 1260000.0, 1400000.0, "3", "8708", "9320", "../../product/gong_kinh/more_info/demo.html"),
        new GongKinhTreEm(["../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K2/s7-playkids-c293-001.png", "../../images/product/mat-kinh-tre-em/gong-kinh-tre-em/Gong-Kinh-Tre-Em-PLAY-KIDS-S7-&-ILUVU-K2/s7-playkids-c293-001_master.png", ],"S7 Playkids", "Gọng Kính Trẻ Em PLAY KIDS S7 & ILUVU K2", 1260000.0, 1400000.0, "3", "8708", "9320", "../../product/gong_kinh/more_info/demo.html"),
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
