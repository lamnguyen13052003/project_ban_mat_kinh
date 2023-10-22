

const initProduct = (type)=>{
    let data = []
    switch (type) {
        case "TITAN":
            data = [...gong_kinh_titan]
            break;
        case "KHOAN":
            data = [...gong_kinh_khoan]
            break;
            
        case "TRON":
            data = [...gong_kinh_tron]
            break;

        case "NUA_KHUNG":
            data = [...gong_kinh_nua_khung]
            break;
    
        default:
            data = [...gong_kinh_titan, ...gong_kinh_khoan, ...gong_kinh_tron ,...gong_kinh_nua_khung]
            break;
    }
    const mainProduct = document.querySelector(".main-product")
    data = data.slice(0, 15);
    data.map(tmp=>{
        mainProduct.innerHTML += initItem(tmp);
    })
}

const initItem = (item)=>{
    return `<div class="pro-loop col rounded-3">
    <!--Phạm vi hiển thị trong ô-->
    <div class="pro-loop-wrap position-relative">
        <!--Phần hình ảnh-->
        <div class="pro-loop-image position-relative">

            <!--Hiển thị hêt hàng-->
            <div class="pro-loop-sd z-2 position-absolute">
                <!--<span>Hết hàng</span>-->
            </div>

            <!--Hiển thị quà tặng-->
            <div class="gift product_gift_label d-none z-1" data-id="1012829436">
                <img class="lazyload" src="../../images/qua_tang.jpg" alt="icon quà tặng">
            </div>

            <!--Hiển thị hình ảnh-->
            <a href="/products/kinh-mat-gap-tron-oem-2015" class="pro-loop-image-item d-block">
                <!--Ảnh khi chưa horver vào phần "Ô hiển thị"-->
                <picture class="img-hidden-when-hover">
                    <img class="lazyloaded  rounded-3" src="../../../images/product/giong-kinh/${item['HỈNH ẢNH']}/0.jpg" alt=" Kính Mát Gập Tròn OEM 2015 ">
                </picture>
                <!--Ảnh khi horver vào phẩn "Ô hiển thị"-->
                <picture class="img-show-when-hover">
                    <img class="lazyloaded  rounded-3" src="../../../images/product/giong-kinh/${item['HỈNH ẢNH']}/1.jpg" alt=" Kính Mát Gập Tròn OEM 2015 ">
                </picture>
            </a>
        </div>

        <!--hiển thị sản phẩm đang là sản phẩm hot-->
        <div class="pro-loop-sold position-absolute">
            <label>
                <img src="../../images/hot.jpg" alt="pro-loop-sold">
            </label>
        </div>

        <!--Hiển thị tên thương hiệu-->
        <div class="pro-loop-brand text-center">
            <span class="pro-loop-vendor d-block">${item["THƯƠNG HIỆU"]}</span>
        </div>

        <!--Hiển thị tên sản phẩm-->
        <h3 class="pro-loop-name text-center">
            <a href="/products/kinh-mat-gap-tron-oem-2015" title="Tên sản phẩm">${item["TÊN"]}</a>
        </h3>


        <!--hiển thị giá-->
        <div class="pro-loop-price text-center mt-0">
            <p class="fw-bold d-inline me-3">${item["GIÁ"]} <span> ₫</span></p>
            <del>${item["GIÁ"]} <span> ₫</span></del>
        </div>

        <!--Hiển thị đánh giá và số lượng bán-->
        <div class="sold_qty text-center">
            <!--Phần đánh giá sao-->
            <div class="prod-review-loop   d-inline-block">
                <!--Danh sách ngôi sao-->
                <div class="onirvapp--shape-container d-inline-block">
                    <ul class="list-group list-group-horizontal">
                        <!--Các li có class checked là sao hoàn thiện-->
                        <li class="checked">
                            <i class="fa-solid fa-star" style="color: #fdd836;"></i>
                        </li>
                        <li class="checked">
                            <i class="fa-solid fa-star" style="color: #fdd836;"></i>
                        </li>
                        <li class="checked">
                            <i class="fa-solid fa-star" style="color: #fdd836;"></i>
                        </li>
                        <li>
                            <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                        </li>
                        <li>
                            <i class="fa-regular fa-star" style="color: #fdd836;"></i>
                        </li>
                    </ul>
                </div>

                <!--số lượng đánh giá-->
                <span class="onireviewapp-loopitem-title">(0 đánh giá)</span>
            </div>

            <!--Đường cắt ngang-->
            <span class="h-line d-inline-block"></span>

            <!--Phần hiển thị số lượng đã bán-->
            <div class="sold_qty_num  d-inline-block">
                <p class="m-0">
                    Đã bán: <span>12</span>
                </p>
            </div>
        </div>

        <!--2 nút thao tác-->
        <div class="pro-loop-bottom">
            <button type="button" class="f-button setAddCartLoop" data-type="add-cart" data-id="">
                Thêm vào giỏ hàng
            </button>
            <button type="button" class="f-button setBuyNow" data-type="buy-now" data-id="">Mua
                ngay
            </button>
        </div>
    </div>
</div>`
}