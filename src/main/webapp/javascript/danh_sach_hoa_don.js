/**find  name customer****/
$(document).ready(function () {
    document.getElementById("search-name-customer").addEventListener("input", function () {
        filter_name_customer(this.value)
    })
});

function filter_name_customer(key) {
    $("#main .show-list-bill .list-bill div").removeClass("d-none");
    if (key == "") {
        return;
    }

    var list_customer = $("#main .show-list-bill .list-bill>div");
    console.log(list_customer.length);
    list_customer.addClass("d-none");
    list_customer.filter(function () {
        var value = $(this).attr("value");
        if (value.toLowerCase().search(key.toLowerCase()) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}
/**find  bill****/
$(document).ready(function () {
    document.getElementById("find-bill").addEventListener("input", function () {
        console.log(this.value);
        filter_bill(this.value)
    })
});

function filter_bill(key) {
    $("#main .show-list-bill .list-bill div").removeClass("d-none");
    if (key == "") {
        return;
    }
    console.log("run")
    var list_bill = $("#main .show-list-bill .list-bill>div");
    list_bill.addClass("d-none");
    list_bill.filter(function () {
        var value = $(this).attr("id");
        if (value.toLowerCase().search(key.toLowerCase()) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}