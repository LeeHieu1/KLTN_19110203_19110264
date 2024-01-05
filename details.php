<?php
    session_set_cookie_params('86400');
    session_start();
    include("includes/db.php");
    include("functions/functions.php");

?>

<?php error_reporting(0);?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lalla | Chi tiết</title>
    <!--css swiper-->
    <link rel="stylesheet" href="css/swiper.min.css">
    <!--css files-->
    <link rel="stylesheet" href="css/details.css">
    <link rel="shortcut icon" href="assets/favicon.ico">

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-137426789-2"></script>
    <script>
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());

    gtag('config', 'UA-137426789-2');
    </script>

</head>

<body>
    <!--Navigation-->
    <?php
        include 'nav.php';
    ?>
    <!--end Navigation-->

    <!--Content-->
    <div class="wrapper">
        <div class="content">
            <section class="left">
                <div class="swiper-container galleryMain">
                    <!-- php get product your chose -->
                    <?php

                        if (isset($_GET['product_id'])) {

                            $product_id = $_GET['product_id'];

                            $get_product = "select * from products where product_id = '$product_id'";

                            $run_product = mysqli_query($conn, $get_product);

                            $row_product = mysqli_fetch_array($run_product);

                                $product_title = $row_product['product_title'];

                                $product_price = $row_product['product_price'];
                                $product_price_format = number_format($product_price, 0, ',', '.');

                                $product_image_1 = $row_product['product_image_1'];

                                $product_image_2 = $row_product['product_image_2'];

                                $product_image_3 = $row_product['product_image_3'];

                                $product_description = $row_product['product_description'];

                                $product_label = $row_product['product_label'];

                                $product_sale = $row_product['product_sale'];
                                $product_sale_format = number_format($product_sale, 0, ',', '.');

                                $product_quantity_size_s = $row_product['product_quantity_size_s'];
                                $product_quantity_size_m = $row_product['product_quantity_size_m'];
                                $product_quantity_size_l = $row_product['product_quantity_size_l'];


                        }
                    ?>
                    <!-- end php get product your chose -->
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="scene">
                                <img src="admin/<?php echo $product_image_1; ?>" alt="đang tải...">
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="scene">
                                <img src="admin/<?php echo $product_image_2; ?>" alt="đang tải...">
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="scene">
                                <img src="admin/<?php echo $product_image_3; ?>" alt="đang tải...">
                            </div>
                        </div>
                    </div>
                </div>
                <!--Add Arrows-->
                <div class="sliderNavigation">
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </section>

            <section class="right">
                <div class="rightContent">
                    <?php
                        $get_coupon = "select * from coupons where product_id='$product_id'";
                        $run_coupon = mysqli_query($conn, $get_coupon);
                        $row_coupon = mysqli_fetch_array($run_coupon);
                        if ($row_coupon > 0) {
                            $coupon_code = $row_coupon['coupon_code'];
                            $coupon_price = $row_coupon['coupon_price'];
                            $coupon_price_format = number_format($coupon_price, 0, ',', '.');
                            $show_coupon_price = "Ưu đãi giá chỉ còn $coupon_price_format khi nhập mã <b>$coupon_code</b>";
                        } else {
                            $show_coupon_price = "";
                        }
                    ?>
                    <div class="modal">
                        <p class="modal__title"><?php echo $product_title; ?></p>
                        <p class="modal__desc"><?php echo $product_description; ?>
                            <span><?php echo $show_coupon_price?></span>
                        </p>
                        <div class="modal__detailTotal">
                            <div class="modal__total">
                                <p> Số lượng </p>
                                <p class="size-s">Size (S):
                                    <?= $product_quantity_size_s; ?></p>
                                <p class="size-m">Size (M):
                                    <?= $product_quantity_size_m; ?></p>
                                <p class="size-l">Size (L):
                                    <?= $product_quantity_size_l; ?></p>
                            </div>
                            <br>
                            <!-- <p> <?php echo ""?> </p> -->
                            <div class="modal__sold">
                                <p>Đã bán <br>
                                    <?php 
                                    $get_sold = "SELECT * FROM customer_orders WHERE product_id='$product_id'";
                                    $run_sold = mysqli_query($conn, $get_sold);
                                    $count = mysqli_num_rows($run_sold);
                                    $total_quantity_s = 0;
                                    $total_quantity_m = 0;
                                    $total_quantity_l = 0;
                                    while ($row_sold = mysqli_fetch_array($run_sold)) {
                                        $product_quantity = $row_sold['product_quantity'];
                                        $product_size = $row_sold['product_size'];
                                        // Tăng tổng số lượng tương ứng với kích thước
                                        switch ($product_size) {
                                            case '1':
                                                $total_quantity_s += $product_quantity;
                                                break;
                                            case '2':
                                                $total_quantity_m += $product_quantity;
                                                break;
                                            case '3':
                                                $total_quantity_l += $product_quantity;
                                                break;
                                            default:
                                                break;
                                        }
                                    }
                                    // Hiển thị tổng số lượng theo từng kích thước
                                    echo "Size S: " . $total_quantity_s . "<br>";
                                    echo "Size M: " . $total_quantity_m . "<br>";
                                    echo "Size L: " . $total_quantity_l . "<br>";
                                    
                                ?></p>
                            </div>
                        </div>
                    </div>

                    <div class="price">
                        <?php
                        
                            if ($product_label == "sale") {

                                echo "
                                    <p class='price__final'>$product_sale_format ₫</p>
                                    <p class='price__original'>$product_price_format ₫</p>
                                ";
                            } else {

                                echo "<p class='price__final'>$product_price_format ₫</p>";

                            }
                        
                        ?>
                    </div>

                    <!--Form-->
                    <?php add_cart(); ?>

                    <form action="details.php?add_cart=<?= $product_id; ?>" method="post">
                        <div class="specs">
                            <div class="size">
                                <h3 class="subtitle">Kích Thước</h3>
                                <select name="product_size" id="product_size" required>
                                    <option disabled selected>Chọn Kích Thước</option>
                                    <option value="1" data-quantity="<?= $product_quantity_size_s; ?>">S (Còn :
                                        <?= $product_quantity_size_s; ?>)</option>
                                    <option value="2" data-quantity="<?= $product_quantity_size_m; ?>">M (Còn :
                                        <?= $product_quantity_size_m; ?>)</option>
                                    <option value="3" data-quantity="<?= $product_quantity_size_l; ?>">L (Còn :
                                        <?= $product_quantity_size_l; ?>)</option>
                                </select>
                            </div>

                            <div class="quantity">
                                <h3 class="subtitle" style="margin-bottom:15px;">Số Lượng</h3>
                                <div
                                    style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;padding:4px;">
                                    <input type="number" name="product_quantity" id="product_quantity" min="1">
                                </div>
                            </div>

                        </div>

                        <button class="btn" type="submit">
                            <img src="assets/icon-shopping-w.svg" alt="">
                            <span>thêm vào giỏ</span>
                        </button>
                    </form>
                </div>
            </section>
        </div>
    </div>

    <!--Script Files-->
    <script src="js/swiper.min.js"></script>

    <!--General-->
    <script src="js/main.js"></script>

    <script>
    document.getElementById('product_size').onchange = function() {
        var selectedOption = this.options[this.selectedIndex];
        var quantity = selectedOption.getAttribute('data-quantity');

        document.getElementById('product_quantity').setAttribute('max', quantity);
        document.getElementById('product_quantity').value = 1;
    };

    document.getElementById('product_quantity').addEventListener('input', function() {
        var quantityInput = parseInt(this.value);
        var maxQuantity = parseInt(this.getAttribute('max'));

        if (quantityInput > maxQuantity) {
            this.value = maxQuantity;
        }

        if (quantityInput < 1) {
            this.value = 1;
        }
    });
    </script>

    <script>
    // swiper   
    var mySwiper = new Swiper('.swiper-container', {
        effect: '',
        loop: false,
        speed: 1000,
        slidesPerView: 1,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        },
        pagination: {
            el: '.swiper-pagination',
            type: 'bullets',
            clickable: 'true'
        },


    });
    </script>
    <!--end Script Files-->
</body>

</html>