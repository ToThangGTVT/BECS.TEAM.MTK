var contentPath = "/" + window.location.href.split("/")[3];

function checkReport(reportError, reportSuccess) {

    try {
        if (reportError != '') {
            var contentReport = JSON.parse(reportError)
            showReport(contentReport['title'], contentReport['content'], true);
        } else if (reportSuccess != '') {
            var contentReport = JSON.parse(reportSuccess)
            showReport(contentReport['title'], contentReport['content'], false);
        }
    } catch (e) {
        if (reportError != '') {
            showReport("Error", reportError, true);
        }
    }
}

function showReport(title, content, error) {

    var showtitle = $("#modal-id .modal-title");
    var showcontent = $("#modal-id .modal-body");
    var btnShowModal = $("#btn-showModal");
    showtitle.html(title);
    showcontent.html(content);
    if (!error) {
        $(".modal.fade.warning").attr("data-type", "success")
    }
    btnShowModal.click();
}

function addToCart(itemId) {
    $.ajax({
        type: "POST",
        url: contentPath + "/cart/addToCart",
        data: {itemId: itemId,quantityAddMore:1},
        dataType: "JSON",

        success: function (response) {
            reloadContentInCart(response);
            for (var i = 0; i < response.length; i++) {
                if (response[i].id == itemId) {
                    showToast("Add cart success", "- You add " + response[i].title + " to your cart success", false);
                }
            }

        },
        error: function (response) {
            showToast("Add cart fail", "- Some thing wrong: <br>- Maybe book is out of stock<br>- Or book id not found", true);
        }
    });
}

function addToCartWithQuantity(itemId, quantity) {
    $.ajax({
        type: 'POST',
        url: contentPath + "/cart/addToCart",
        data: {
            itemId: itemId,
            quantityAddMore: quantity
        },
        dataType: "JSON",
        success: function (response) {
            reloadContentInCart(response);
            for (var i = 0; i < response.length; i++) {
                if (response[i].id == itemId) {
                    showToast("Add cart success", "- You add " + response[i].title + " to your cart success", false);
                }
            }
        },
        error: function (response) {
            showToast("Add cart fail", "- Some thing wrong: <br>- Maybe book is out of stock<br>- Or book id not found", true);
        }
    })
}

function showToast(title, content, error) {
    if (error) {
        $("#toastComponent").attr("data-type-toast", "error");
    } else {
        $("#toastComponent").attr("data-type-toast", "success");
    }
    $("#toastComponent .toast-header").html(title);
    $("#toastComponent .toast-body").html(content);
    $('.toast').toast('show');
}

function deleteItemInCart(itemId){
    $.ajax({
        type: "POST",
        url: contentPath + "/cart/deleteCartItem",
        data: {itemId: itemId},
        dataType: "JSON",

        success: function (response) {
            reloadContentInCart(response);
        },
        error: function (response) {
            showToast("Delete cart fail", "- Some thing wrong:", true);
        }
    });
}

function getContextPath() {
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
}

function reloadContentInCart(contentCart) {
    var countItem = 0;
    var totalPrice = 0;
    $(".shopcart .block-minicart .miniproduct").html("");
    $(".product_qun").html(contentCart.length);
    for (let i = 0; i < contentCart.length; i++) {
        console.log(contentCart[i].image)
        $(".shopcart .block-minicart .miniproduct").append(
            '<div class="item01 d-flex mt--20">' +
            '<div class="col-3">' +
            '<a href="product-details.html"><img src="' + getContextPath() + '/resources/upload/' + contentCart[i].image + '"alt="product images"></a>' +
            '</div>' +
            '<div class="col-7">' +
            '<div class="product_prize d-flex justify-content-between" style="font-weight: 600;font-size: large;"><a href="product-details.html">' + contentCart[i].title + '</a></div>' +
            '<div class="product_prize d-flex justify-content-between">$' + contentCart[i].priceTotal + '</div>' +
            '<div class="product_prize d-flex justify-content-between">' +
            '<span class="qun">Qty: ' + contentCart[i].quantityBuy + '</span>' +
            '</div>' +
            '</div>' +
            '<div class="col-2">' +
            '<ul class="d-flex justify-content-end mt-3">' +
            '<li>' +
            '<a data-item-id="' + contentCart[i].id + '" class="btnDeleteCart">' +
            '<i style="font-size: xx-large" class="zmdi zmdi-delete"></i>' +
            '</a>' +
            '</li>' +
            '</ul>' +
            '</div>' +
            '</div>'
        )


        countItem = countItem + contentCart[i].quantityBuy;
        totalPrice = totalPrice + contentCart[i].priceTotal;
    }
    $(".shopcart .block-minicart .items-total span")[0].innerHTML = countItem + " items";
    $(".shopcart .block-minicart .total_amount span").html("$"+totalPrice);

}

