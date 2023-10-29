$(document).ready(function () {
   document.getElementById("search-name-customer").addEventListener("input", function () {
        console.log(this.value);
       filter_name_customer(this.value)
    })
});

function filter_name_customer(key) {
    $("#main .table .body-table div").removeClass("d-none");
    if (key == "") {
        return;
    }

    var list_customer = $("#main .table .body-table>div");
    console.log(list_customer.length);
    list_customer.addClass("d-none");
    list_customer.filter(function () {
        var value = $(this).attr("value");
        if (value.toLowerCase().search(key.toLowerCase()) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}