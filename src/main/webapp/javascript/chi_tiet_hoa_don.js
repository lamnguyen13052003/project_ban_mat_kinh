$(document).ready(function () {
    displayFormEditContactCustomer();
    saveInfoCustomer();
});

function saveInfoCustomer() {
    $("#save").click(function () {
        const email = $("#input-email").val();
        const  phoneNumber = $("#input-phone-number").val();
        const address = $("#input-address").val();
        $(".email-customer").text(email);
        $(".number-phone-customer").text(phoneNumber);
        $(".address-customer").text(address);
    });
}
function displayFormEditContactCustomer(){
    $("#edit").click(function (){
        const email = $(".email-customer").eq(1).text();
        const phone_number = $(".number-phone-customer").eq(1).text();
        const address = $(".address-customer").text();
        $("#input-email").val(email);
        $("#input-phone-number").val(phone_number);
        $("#input-address").val(address);
    });
}