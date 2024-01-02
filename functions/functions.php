<?php
    $servername = "localhost:3307";
    $username = "root";
    $password = "";
    $dbname = "shopthoitrang";

    // Create connection
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }

    // getRealIpUser()

    function getRealIpUser() {

        switch (true) {
            
            case(!empty($_SERVER['HTTP_X_REAL_IP'])) : return $_SERVER['HTTP_X_REAL_IP'];
            case(!empty($_SERVER['HTTP_CLIENT_IP'])) : return $_SERVER['HTTP_CLIENT_REAL_IP'];
            case(!empty($_SERVER['HTTP_X_ROWARDED'])) : return $_SERVER['HTTP_X_RORWARDED_FOR'];

            default : return $_SERVER['REMOTE_ADDR'];

        }

    }

    // add cart

    function add_cart() {

        global $conn;

        if (isset($_GET['add_cart'])) {

            $ip_add = getRealIpUser();

            $product_id = $_GET['add_cart'];

            $product_size = $_POST['product_size'];

            $product_quantity = $_POST['product_quantity'];

            $check_product = "SELECT * FROM cart WHERE ip_add='$ip_add' AND product_id='$product_id'";
            
            $run_check = mysqli_query($conn, $check_product);

            $count_check = mysqli_num_rows($run_check);

            if ($count_check > 0) {
                echo "<script>alert('Thêm vào giỏ hàng thành công'); window.location='cart.php';</script>";
                exit();
            }

            // if ($count_check>0) {

            //     echo "
            //         <div class='popup'>
            //             <div class='popup__content'>
            //                 <div class='popup__image'>
            //                     <img src='assets/icon-location.svg' alt='>
            //                 </div>

            //                 <div class='popup__text'>
            //                     <h4 class='popup__title'>Thêm vào giỏ thành công</h4>
            //                     <p class='popup__desc'>Sản phẩm này đã được thêm vào giỏ hàng</p>
            //                 </div>
                            
            //                 <a href='cart.php' class='popup__btn'>Chuyển đến giỏ hàng</a>
            //             </div>
            //         </div>
            //     ";

            //     //echo "<script>window.open('details.php?product_id=$product_id','_self')</script>";
                
            //     exit();
            // }

            $get_product = "SELECT * FROM products WHERE product_id='$product_id'";

            $run_product = mysqli_query($conn, $get_product);

            $row_product = mysqli_fetch_array($run_product);

                $product_total = $row_product['product_total'];

            if ($product_total < $product_quantity) {
                echo "
                    <div class='popup'>
                        <div class='popup__content'>
                            <div class='popup__image'>
                                <img src='assets/icon-location.svg' alt='>
                            </div>

                            <div class='popup__text'>
                                <h4 class='popup__title'>Kho hàng còn lại không đủ</h4>
                                <p class='popup__desc'>Số lượng bạn đã chọn lớn hơn kho hàng còn lại của chúng tôi, vui lòng thay đổi số lượng.</p>
                            </div>
                            
                            <a href='details.php?product_id=$product_id' class='popup__btn'>Đồng ý</a>
                        </div>
                    </div>
                ";

                exit();
            }
            
            else {

                $get_price = "SELECT * from products where product_id='$product_id'";

                $run_price = mysqli_query($conn, $get_price);

                $row_price = mysqli_fetch_array($run_price);

                    $product_label = $row_price['product_label'];

                    $product_sale = $row_price['product_sale'];

                    $product_price = $row_price['product_price'];

                    if ($product_label == "sale") {

                        $product_price = $product_sale;

                    } else {

                        $product_price = $product_price;

                    }


                $query = "insert into cart (product_id, ip_add, p_size, p_price, p_quantity) values ('$product_id', '$ip_add', '$product_size', '$product_price', '$product_quantity')";

                $run_query = mysqli_query($conn, $query);

                echo "<script>window.open('details.php?product_id=$product_id','_self')</script>";
            }
        }
    }

    // get items

    function items() {

        global $conn;

            $ip_add = getRealIpUser();

            $get_items = "SELECT * FROM cart WHERE ip_add='$ip_add'";

            $run_items = mysqli_query($conn, $get_items);

            $count_items = mysqli_num_rows($run_items);

            echo $count_items;
    }

    // get p_category
        function get_p_category() {

            global $conn;
            
                if (isset($_GET['product_category'])) {

                    $product_category_id = $_GET['product_category'];

                    $get_products = "select * from products where product_category_id='$product_category_id'";

                    $run_products = mysqli_query($conn, $get_products);

                    $count_product = mysqli_num_rows($run_products);

                    if ($count_product==0) {

                        echo "<script>alert('Sản phẩm tạm thời hết hàng')</script>";
                        echo "<script>window.open('shop.php','_self')</script>";

                    } else {

                        while ($row_products = mysqli_fetch_array($run_products)) {

                            $product_id = $row_products['product_id'];

                            $product_title = $row_products['product_title'];

                            $product_price = $row_products['product_price'];
                            $product_price_format = number_format($product_price, 0, ',', '.');

                            $product_image_1 = $row_products['product_image_1'];

                            $product_label = $row_products['product_label'];

                            $product_sale = $row_products['product_sale'];
                            $product_sale_format = number_format($product_sale, 0, ',', '.');
                                
                            if ($product_label == 'new') {

                                $label = "<div class='contentProducts__label new'>mới</div>";

                            } else {

                                $label = "<div class='contentProducts__label'>giảm giá</div>";

                            }

                            if ($product_label == 'sale') {

                                $price = " 
                                    <div class='contentProducts__priceFinal'>$product_sale_format ₫</div>
                                    <div class='contentProducts__priceOriginal'>$product_price_format ₫</div>
                                ";

                            } else {

                                $price = "<div class='contentProducts__priceFinal'>$product_price_format ₫</div>";

                            }

                        
                            echo "

                            <a class='contentProducts__card anime' href='details.php?product_id=$product_id'>
                                
                            $label

                            <figure class='contentProducts__image'>
                                <img src='admin/$product_image_1' alt=''>
                            </figure>
                            <div class='contentProducts__text'>
                                <h4 class='contentProducts__productTitle'>$product_title</h4>
                                <div class='contentProducts__priceContainer'>
                                    $price
                                </div>
                                <div class='contentProducts__info'>
                                    <p class='contentProducts__link'><span>chi tiết</span><svg xmlns='http://www.w3.org/2000/svg' class='icon icon-tabler icon-tabler-circle-plus' width='44' height='44' viewBox='0 0 24 24' stroke-width='1.5' stroke='#7E56C8' fill='none' stroke-linecap='round' stroke-linejoin='round'>
                                    <path stroke='none' d='M0 0h24v24H0z'/>
                                    <circle cx='12' cy='12' r='9' />
                                    <line x1='9' y1='12' x2='15' y2='12' />
                                    <line x1='12' y1='9' x2='12' y2='15' />
                                    </svg>
                                    </p>
                                    <div class='contentProducts__view cta cta02'><span>Xem</span></div>
                                </div>
                            </div>
                        </a>
                    ";
                }
            }
        }
    }

    // get category
        function get_category() {

            global $conn;
            
                if (isset($_GET['category'])) {

                    $category_id = $_GET['category'];

                    $get_products = "select * from products where category_id='$category_id'";

                    $run_products = mysqli_query($conn, $get_products);

                    $count_product = mysqli_num_rows($run_products);

                    if ($count_product==0) {

                        echo "<script>alert('Sản phẩm tạm thời hết hàng')</script>";
                        echo "<script>window.open('shop.php','_self')</script>";

                    } else {

                        while ($row_products = mysqli_fetch_array($run_products)) {

                            $product_id = $row_products['product_id'];

                            $product_title = $row_products['product_title'];

                            $product_price = $row_products['product_price'];
                            $product_price_format = number_format($product_price, 0, ',', '.');

                            $product_image_1 = $row_products['product_image_1'];

                            $product_label = $row_products['product_label'];

                            $product_sale = $row_products['product_sale'];
                            $product_sale_format = number_format($product_sale, 0, ',', '.');
                                
                            if ($product_label == 'new') {

                                $label = "<div class='contentProducts__label new'>mới</div>";

                            } else {

                                $label = "<div class='contentProducts__label'>giảm giá</div>";

                            }

                            if ($product_label == 'sale') {

                                $price = " 
                                    <div class='contentProducts__priceFinal'>$product_sale_format ₫</div>
                                    <div class='contentProducts__priceOriginal'>$product_price_format ₫</div>
                                ";

                            } else {

                                $price = "<div class='contentProducts__priceFinal'>$product_price_format ₫</div>";

                            }

                        
                            echo "

                            <a class='contentProducts__card anime' href='details.php?product_id=$product_id'>
                                
                            $label

                            <figure class='contentProducts__image'>
                                <img src='admin/$product_image_1' alt=''>
                            </figure>
                            <div class='contentProducts__text'>
                                <h4 class='contentProducts__productTitle'>$product_title</h4>
                                <div class='contentProducts__priceContainer'>
                                    $price
                                </div>
                                <div class='contentProducts__info'>
                                    <p class='contentProducts__link'><span>chi tiết</span><svg xmlns='http://www.w3.org/2000/svg' class='icon icon-tabler icon-tabler-circle-plus' width='44' height='44' viewBox='0 0 24 24' stroke-width='1.5' stroke='#7E56C8' fill='none' stroke-linecap='round' stroke-linejoin='round'>
                                    <path stroke='none' d='M0 0h24v24H0z'/>
                                    <circle cx='12' cy='12' r='9' />
                                    <line x1='9' y1='12' x2='15' y2='12' />
                                    <line x1='12' y1='9' x2='12' y2='15' />
                                    </svg>
                                    </p>
                                    <div class='contentProducts__view cta cta02'><span>Xem</span></div>
                                </div>
                            </div>
                        </a>
                    ";
                }
            }
        }
    }
            
?>