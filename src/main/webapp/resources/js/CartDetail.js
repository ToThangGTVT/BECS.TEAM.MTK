var testGlobal;
var contentPath = "/" + window.location.href.split("/")[3];

function buttonChangeQuantity(btnClick) {
    console.log("in");
    testGlobal = btnClick;
    var inputQuantity = testGlobal.parent().children()[1];
    var itemId = $(inputQuantity).attr("data-item-id");
    var valQuantity = inputQuantity.value;
    if (isNaN(valQuantity)) {
        valQuantity = 1;
    } else {
        valQuantity = parseInt(valQuantity);
        if (btnClick.attr("data-btn-type") == "increase") {
            modifyEditCartOnServer(itemId, 1);
        } else {
            if (valQuantity == 1) {
                var resultConfirm = confirm("Do you want delete this item in cart ?");
                if (resultConfirm) {
                    modifyEditCartOnServer(itemId, 2);
                }
            } else {
                modifyEditCartOnServer(itemId, 3, valQuantity);
            }
        }
    }
    // inputQuantity.value = valQuantity;
}

function reloadCartItemDetail(contentCart) {
    var countItem = 0;
    var totalPrice = 0;
    $("#tableCartDetail tbody").html("");
    $(".product_qun").html(contentCart.length);
    for (let i = 0; i < contentCart.length; i++) {
        $("#tableCartDetail tbody").append(
            "<tr>\n" +
            "    <td class=\"product-thumbnail\"><a href=\"#\"><img\n" +
            "             src=\"" +contentPath + '/resources/upload/' + contentCart[i].image + "\" alt=\"product img\"></a></td>\n" +
            "    <td class=\"product-name\"><a href=\"#\">" + contentCart[i].title + "</a></td>\n" +
            "    <td class=\"product-price\"><span class=\"amount\">$" + contentCart[i].priceBook + "</span></td>\n" +
            "    <td class=\"product-quantity\">\n" +
            "       <div class=\"btn-group\">\n" +
            "           <button type=\"button\" class=\"btn btn-primary btn-decrease\" data-btn-type=\"decrease\"> - </button>\n" +
            "           <input data-preVal=\"" + contentCart[i].quantityBuy + "\"  type=\"text\" data-item-id=\"" + contentCart[i].id + "\"  class=\"btn btn-default input-quantity\" value=\"" + contentCart[i].quantityBuy + "\">\n" +
            "           <button type=\"button\" class=\"btn btn-primary btn-increase\" data-btn-type=\"increase\">+</button>\n" +
            "       </div>\n" +
            "    </td>\n" +
            "    <td class=\"product-subtotal\">$" + contentCart[i].priceTotal + "</td>\n" +
            "    <td class=\"product-remove\"><a class=\"iconDelete\" data-item-id=\"" + contentCart[i].id + "\">X</a></td>\n" +
            "</tr>");
        countItem = countItem + contentCart[i].quantityBuy;
        totalPrice = totalPrice + contentCart[i].priceTotal;
    }
    $("ul.cart__total__tk li")[0].innerHTML = "$" + totalPrice;
    $("ul.cart__total__tk li")[1].innerHTML = "$" + totalPrice;
    $("div.cart__total__amount span")[1].innerHTML = "$" + totalPrice;
}

function modifyEditCartOnServer(itemId, type) {
    var url;
    var quantityAddMore = 0;
    switch (type) {
        case 1:
            url = "/cart/addToCart";
            quantityAddMore = 1;
            break;
        case 2:
            url = "/cart/deleteCartItem";
            break;
        case 3:
            url = "/cart/reduceQuantity";
            quantityAddMore = -1;
            break;
    }

    $.ajax({
        type: "POST",
        url: contentPath + url,
        data: {itemId: itemId, quantityAddMore: quantityAddMore},
        dataType: "JSON",

        success: function (response) {
            reloadCartItemDetail(response);
            reloadContentInCart(response);
        },
        error: function (response) {
            showReport("Add cart fail", "- Some thing wrong: <br>- Maybe book is out of stock<br>- Or book id not found", true);
        }
    });
}

function checkCoulpon() {
    var coulpon = $(".cart__total__amount input[type='text']").val();
    $.ajax({
        type: "POST",
        url: contentPath + "/promotion/checkCoulpon",
        data: {coulpon: coulpon},
        dataType: "JSON",
        success: function (response) {
            $.ajax({
                type: "POST",
                url: contentPath + "/cart/showAllCart",
                dataType: "JSON",

                success: function (response2) {
                    var cartTotal = 0;
                    for (var i = 0; i < response2.length; i++) {
                        console.log(response2[i].priceTotal)
                        cartTotal = cartTotal + response2[i].priceTotal;
                    }
                    showReport("Add coulpon success", "- Your coulpon input have value is " + response.discount);
                    var priceReduce = cartTotal * (response.discount) / 100;
                    $(".cart__total__tk li")[1].innerHTML = "$" + priceReduce;
                    $(".cart__total__amount span")[1].innerHTML = "$" + (cartTotal - priceReduce);
                },
                error: function (error2) {
                    showReport("Cart is empty", "- Your coulpon is: " + response.discount + "%", true);
                }
            });

        },
        error: function (response) {
            showReport("Add cart fail", "- Some thing wrong: <br>- Maybe book is out of stock<br>- Or book id not found", true);
        }
    });
}

function inputNumberQuantity(input) {
    var preVal = input.attr("data-preVal");
    var itemId = input.attr("data-item-id");
    var quantity = input.val();
    if (isNaN(quantity)) {
        showReport("Input quantity error", "- Input only number ", true);
        input.val(preVal);
    } else {
        var quantity = parseInt(input.val());
        if (quantity < 0) {
            showReport("Input wrong ", "Input quantity negative number", true);
            input.val(preVal);
        } else {
            var quantityAddMore = quantity - preVal;
            $.ajax({
                type: "POST",
                url: contentPath + '/cart/reduceQuantity',
                data: {itemId: itemId, quantityAddMore: quantityAddMore},
                dataType: "JSON",

                success: function (response) {
                    reloadCartItemDetail(response);
                    reloadContentInCart(response);
                },
                error: function (response) {
                    input.val(preVal);
                    showReport("Add cart fail", "- Some thing wrong: <br>- Maybe book is out of stock<br>- Or book id not found", true);
                }
            });
        }
    }
}

function deleteCartInCartDetail(itemId) {
    var resultConfirm = confirm("Do you want delete this item in cart ?");
    if (resultConfirm) {
        modifyEditCartOnServer(itemId, 2);
    }
}

