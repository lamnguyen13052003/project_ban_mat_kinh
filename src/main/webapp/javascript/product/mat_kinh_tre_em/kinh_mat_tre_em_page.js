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

var listInfoProduct = [
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11005/12999461550_1562894287_a0d45da4cb0d447787804b4c57455ade_master - Copy.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11005/12999461550_1562894287_a0d45da4cb0d447787804b4c57455ade_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 11005", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-3507/2020-01-14_164104_7bcd7e0c7aed4b5a96bdbf353452588f_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-3507/2020-01-14_164139_e5398e702abd49f590db5a8a399e2253_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 3507", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Chuon-Chuon-Phi-Cong-Pilot-Phan-Cuc-Tre-Em-Aviator-Tu-4---10-Tuoi-Lapola-3029/lapola-3029__2__a915535d764947bc9c3aeedbc7df9233_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Chuon-Chuon-Phi-Cong-Pilot-Phan-Cuc-Tre-Em-Aviator-Tu-4---10-Tuoi-Lapola-3029/lapola-3029__3__6c6d36d7acc4498691dcb7f6477a62e0_master.png", ],"Lapola", "Kính Mát Chuồn Chuồn Phi Công Pilot Phân Cực Trẻ Em Aviator Từ 4 - 10 Tuổi Lapola 3029", 300000.0, 270000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-32005/2020-01-14_162408_6b2d485d580842e784091ed19e9ccf07_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-32005/untitled-7_bd01545bce3c4658a5ce1fcba36d45c5_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 32005", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S8239/2020-01-14_161539_407b2b46cfa54f9f9542b75dd3b3c3c5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S8239/2020-01-14_161623_5944896e84e146589a58df72c52f55df_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S8239", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-MC802/802__4__cfddb4b10ece4c2496fc7bee3f843276_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-MC802/802__5__6ecc83de6ca5482e95714fab22c72b62_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM MC802", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11014/2020-01-14_165242_ede8b07bce704601b9f204bd0c82c56f_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11014/2020-01-14_165358_dc25ad580bd545bb8eacc05fc20e4634_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 11014", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Mat-Kinh-Double-Shield-90960S/dbs_291_2e3cd561a9fa40388cc4550475957922_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Mat-Kinh-Double-Shield-90960S/dbs_294_00b54a4ad8c1473396609458550b1f59_master.png", ],"Double Shield", "Mắt Kính Double Shield 90960S", 80000.0, 72000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Bolon-BK5008/bk5008-f10-45_-510x510_c0a4a9bdd0cc4df685aece75b185a1c5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Bolon-BK5008/bk5008-f10-front-view-510x510_2732e7ac9f7e45dda516b5e2ce09031b_master.png", ],"BOLON", "Kính Mát Trẻ Em Bolon BK5008", 1600000.0, 1440000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-The-Thao-Tre-Em-Bong-Đa,-Bong-Ro-Panlees-JH054/1_d73c5bc71be042d684dd182248a6994a.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-The-Thao-Tre-Em-Bong-Đa,-Bong-Ro-Panlees-JH054/4189727513_211621448_dd0b50bc1d2948e189f91362084e9d31_master.png", ],"Panlees", "Kính Thể Thao Trẻ Em Bóng Đá, Bóng Rổ Panlees JH054", 300000.0, 270000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S859/kinh-mat-tre-em-s589-c01_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S859/kinh-mat-tre-em-s589-c02_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S859", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S816/13155252384_1562894287_411e41c0cf3c4d1294bb929085fa1566_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S816/1_80c1506201f2452abb230dcf487ffa46_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S816", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S802/9044641467_1562894287_f2c45c15e0ab40ffb58514fb038d16a4_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S802/kinh-mat-tre-em-tr90-hato-801-c-02_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S802", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Hop-Kim-Tron-Jason-3070/3070__1__7145b043bbde4c248d096bc766ecef02_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Hop-Kim-Tron-Jason-3070/3070__3__00825e1dbd7947c9872cbba09c2b710c_master.png", ],"Jason", "Kính Mát Trẻ Em Hợp Kim Tròn Jason 3070", 300000.0, 270000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-DM18038/18038__5__6ffbed663c8345118934fa364db481b5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-DM18038/18038__6__a3b2095e6ab2441abbdf58d4e900dccd_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM DM18038", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-T1759/okdai-t1759-002_5a8eef421d354cb282a589539612ec12_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-T1759/okdai-t1759-003_5419a7f833334546914597b6a1bfdbd2_master.png", ],"OKAI", "Kính Mát Trẻ Em Phân Cực Polarized OKAI T1759", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-8046/2020-01-14_153301_260a82efd1ad41b6aaad5705d89d9518_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-8046/ba_c726288d04d4471f9184ce42777b206c_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 8046", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-1908/untitled-1_96eeaf13a5bb4194916767869cde867e_master - Copy.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-1908/untitled-1_96eeaf13a5bb4194916767869cde867e_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 1908", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S852/vang-xah_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S852/xanh-hong_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S852", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-CT11010/okdai-ct11010-001_69f4d9e1c1d84100adc694b36fdd347d_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-CT11010/okdai-ct11010-008_03ec3e424b29429cbcdd2db750629814_master.png", ],"OKAI", "Kính Mát Trẻ Em Phân Cực Polarized OKAI CT11010", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    //page 2
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11005/12999461550_1562894287_a0d45da4cb0d447787804b4c57455ade_master - Copy.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11005/12999461550_1562894287_a0d45da4cb0d447787804b4c57455ade_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 11005", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-3507/2020-01-14_164104_7bcd7e0c7aed4b5a96bdbf353452588f_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-3507/2020-01-14_164139_e5398e702abd49f590db5a8a399e2253_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 3507", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Chuon-Chuon-Phi-Cong-Pilot-Phan-Cuc-Tre-Em-Aviator-Tu-4---10-Tuoi-Lapola-3029/lapola-3029__2__a915535d764947bc9c3aeedbc7df9233_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Chuon-Chuon-Phi-Cong-Pilot-Phan-Cuc-Tre-Em-Aviator-Tu-4---10-Tuoi-Lapola-3029/lapola-3029__3__6c6d36d7acc4498691dcb7f6477a62e0_master.png", ],"Lapola", "Kính Mát Chuồn Chuồn Phi Công Pilot Phân Cực Trẻ Em Aviator Từ 4 - 10 Tuổi Lapola 3029", 300000.0, 270000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-32005/2020-01-14_162408_6b2d485d580842e784091ed19e9ccf07_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-32005/untitled-7_bd01545bce3c4658a5ce1fcba36d45c5_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 32005", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S8239/2020-01-14_161539_407b2b46cfa54f9f9542b75dd3b3c3c5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S8239/2020-01-14_161623_5944896e84e146589a58df72c52f55df_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S8239", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-MC802/802__4__cfddb4b10ece4c2496fc7bee3f843276_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-MC802/802__5__6ecc83de6ca5482e95714fab22c72b62_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM MC802", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11014/2020-01-14_165242_ede8b07bce704601b9f204bd0c82c56f_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-11014/2020-01-14_165358_dc25ad580bd545bb8eacc05fc20e4634_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 11014", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Mat-Kinh-Double-Shield-90960S/dbs_291_2e3cd561a9fa40388cc4550475957922_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Mat-Kinh-Double-Shield-90960S/dbs_294_00b54a4ad8c1473396609458550b1f59_master.png", ],"Double Shield", "Mắt Kính Double Shield 90960S", 80000.0, 72000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Bolon-BK5008/bk5008-f10-45_-510x510_c0a4a9bdd0cc4df685aece75b185a1c5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Bolon-BK5008/bk5008-f10-front-view-510x510_2732e7ac9f7e45dda516b5e2ce09031b_master.png", ],"BOLON", "Kính Mát Trẻ Em Bolon BK5008", 1600000.0, 1440000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-The-Thao-Tre-Em-Bong-Đa,-Bong-Ro-Panlees-JH054/1_d73c5bc71be042d684dd182248a6994a.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-The-Thao-Tre-Em-Bong-Đa,-Bong-Ro-Panlees-JH054/4189727513_211621448_dd0b50bc1d2948e189f91362084e9d31_master.png", ],"Panlees", "Kính Thể Thao Trẻ Em Bóng Đá, Bóng Rổ Panlees JH054", 300000.0, 270000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S859/kinh-mat-tre-em-s589-c01_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S859/kinh-mat-tre-em-s589-c02_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S859", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S816/13155252384_1562894287_411e41c0cf3c4d1294bb929085fa1566_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S816/1_80c1506201f2452abb230dcf487ffa46_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S816", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S802/9044641467_1562894287_f2c45c15e0ab40ffb58514fb038d16a4_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S802/kinh-mat-tre-em-tr90-hato-801-c-02_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S802", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Hop-Kim-Tron-Jason-3070/3070__1__7145b043bbde4c248d096bc766ecef02_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Hop-Kim-Tron-Jason-3070/3070__3__00825e1dbd7947c9872cbba09c2b710c_master.png", ],"Jason", "Kính Mát Trẻ Em Hợp Kim Tròn Jason 3070", 300000.0, 270000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-DM18038/18038__5__6ffbed663c8345118934fa364db481b5_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-DM18038/18038__6__a3b2095e6ab2441abbdf58d4e900dccd_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM DM18038", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-T1759/okdai-t1759-002_5a8eef421d354cb282a589539612ec12_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-T1759/okdai-t1759-003_5419a7f833334546914597b6a1bfdbd2_master.png", ],"OKAI", "Kính Mát Trẻ Em Phân Cực Polarized OKAI T1759", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-8046/2020-01-14_153301_260a82efd1ad41b6aaad5705d89d9518_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-8046/ba_c726288d04d4471f9184ce42777b206c_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM 8046", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-1908/untitled-1_96eeaf13a5bb4194916767869cde867e_master - Copy.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-1908/untitled-1_96eeaf13a5bb4194916767869cde867e_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 1908", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S852/vang-xah_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Phan-Cuc-Tre-Em-TR90-OEM-S852/xanh-hong_master.png", ],"OEM ", "Kính Mát Phân Cực Trẻ Em TR90 OEM S852", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
    new Product(["../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-CT11010/okdai-ct11010-001_69f4d9e1c1d84100adc694b36fdd347d_master.png", "../../images/product/mat-kinh-tre-em/kinh-mat-tre-em/Kinh-Mat-Tre-Em-Phan-Cuc-Polarized-OKAI-CT11010/okdai-ct11010-008_03ec3e424b29429cbcdd2db750629814_master.png", ],"OKAI", "Kính Mát Trẻ Em Phân Cực Polarized OKAI CT11010", 150000.0, 135000.0, 4, 5703, 9490, "../../product/thong_tin_san_pham.jsp"),
];

var current_page = 0, amountPage =  Math.floor(listInfoProduct.length / 20) ==  listInfoProduct.length / 20 ? listInfoProduct.length / 20 :  Math.floor(listInfoProduct.length / 20) + 1;

$(document).ready(function () {
    changePage(current_page);
    actionButtonChangePage();
});

function loaddingProduct(index_page) {
    let index = 0, indexStart = 20 * index_page;
    let indexEnd = indexStart * (index_page + 1) <= listInfoProduct.length ? indexStart + 20 : listInfoProduct.length;
    var product = null;

    $("div.pro-loop").removeClass("d-none");
    for (; indexStart < indexEnd; indexStart++) {
        product = listInfoProduct[indexStart];
        var frameProduct = $("div.pro-loop").eq(index);
        loaddingImg(frameProduct, product.list_img);
        loaddingBrand(frameProduct, product.brand);
        loaddingName(frameProduct, product.name)
        loaddingPrice(frameProduct, product.old_price, product.new_price);
        loaddingStar(frameProduct, product.amount_star);
        loaddingAmountRate(frameProduct, product.amount_rate);
        loaddingAmountSelled(frameProduct, product.amount_selled)
        loaddingLinkMoreInfo(frameProduct, product.link_more_info);
        index++;
    }

    /*Xóa các khung hiển thị đi*/
    for (; index < 20; index++) {
        $("div.pro-loop").eq(index).addClass("d-none");
    }
}

function loaddingImg(product, listImg) {
    let index = 0;
    listImg.forEach((link) => {
        product.find(".pro-loop-image picture img").eq(index).attr("src", link);
        index++;
    });
}


function loaddingBrand(product, brand) {
    product.find(".pro-loop-brand>span").text(brand);
}

function loaddingName(product, name) {
    product.find(".pro-loop-name>a").text(name);
    product.find(".pro-loop-name>a").attr("title", name);
}

function loaddingPrice(product, old_price, new_price) {
    if (new_price === null) {
        product.find(".pro-loop-price>p").html(formatNumber(old_price) + " <span> ₫</span>");
        product.find(".pro-loop-price>del").text("");
    } else {
        product.find(".pro-loop-price>p").html(formatNumber(new_price) + " <span> ₫</span>");
        product.find(".pro-loop-price>del").html(formatNumber(old_price) + " <span> ₫</span>");
    }
}

function loaddingStar(product, amount) {
    product.find(".sold_qty .onirvapp--shape-container li").removeClass("checked")
    for (let i = 0; i < amount; i++) {
        product.find(".sold_qty .onirvapp--shape-container li").eq(i).addClass("checked");
    }
}

function loaddingAmountRate(product, amount) {
    product.find(".sold_qty .prod-review-loop>span").text("(" + amount + " đánh giá)")
}

function loaddingAmountSelled(product, amount) {
    product.find(".sold_qty .sold_qty_num>p>span").text(amount)
}

function loaddingLinkMoreInfo(product, link) {
    product.find(".pro-loop-image>a").attr("href", link);
}

function formatNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function displayNavigationChangePage(indexPage) {
    var frameButton = $("#navigation_change_page").find("li");

    if (amountPage <= 4) {
        for (var i = 1; i <= 4; i++) {
            if (i <= amountPage) {
                frameButton.eq(i).removeClass("d-none");
                frameButton.eq(i).find("button").attr("target-page", i).text(i);
            } else {
                frameButton.eq(i).addClass("d-none");
            }
        }

        return;
    }

    if (indexPage + 4 <= amountPage) {
        for (var i = 1; i <= 4; i++) {
            frameButton.eq(i).find("button").attr("target-page", indexPage + 1).text(indexPage + i);
        }
    } else {
        for (var i = 1; i <= 4; i++) {
            frameButton.eq(i).find("button").attr("target-page", amountPage - 4 + i).text(amountPage - 4 + i);
        }
    }
}


function changePage(indexPage) {
    loaddingProduct(indexPage)
    displayNavigationChangePage(indexPage);

    var frameButton = $("#navigation_change_page").find("li");
    frameButton.first().removeClass("d-none");
    frameButton.last().removeClass("d-none");
    if(indexPage == 0){
        frameButton.first().addClass("d-none")
    }

    if(indexPage == amountPage - 1){
        frameButton.last().addClass("d-none");
    }

    $("#navigation_change_page").find("li").removeClass("active");
    $("#navigation_change_page").find("li").eq(indexPage + 1).addClass("active");
}

function actionButtonChangePage() {
    var listLi = $("#navigation_change_page").find("li").find("button");
    for(var i = 1; i < 4; i++){
        listLi.eq(i).click(function () {
            var target_page = $(this).attr("target-page");
            if (current_page != target_page - 1) {
                current_page = target_page - 1;
                changePage(current_page);
            }
        });
    }

    listLi.first().click(function () {
        changePage(--current_page);
    });

    listLi.last().click(function () {
        changePage(++current_page);
    });
}