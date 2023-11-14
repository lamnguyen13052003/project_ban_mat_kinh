$(document).ready(function () {
   $("#search-account-id").next().css({"cursor": "pointer"}).click(function () {
       search_account_id($(this).prev());
   });

    $("#search-account-name").next().css({"cursor": "pointer"}).click(function () {
        search_account_name($(this).prev());
    });

    $("#input-lock-account").change(function () {
        search_lock_account($(this));
    });

    $("#input-account-role").change(function () {
        search_account_role($(this));
    });
});

function search_account_id(input) {
    const list_account = $(".account");
    list_account.removeClass("d-none");
    const value = input.val();
    if (value === "") {
        return;
    }

    list_account.addClass("d-none");
    list_account.filter(function () {
        var account_id = $(this).attr("data-account-id")[0];
        alert(account_id);
        if (account_id.search(value) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}

function search_account_name(input) {
    var list_account = $(".account");
    list_account.removeClass("d-none");
    const value = input.val().toLowerCase();
    if (value === "") {
        return;
    }

    list_account.addClass("d-none");
    list_account.filter(function () {
        var account_name = $(this).attr("data-account-name").join("").toLowerCase();
        if (account_name.search(value) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}

function search_lock_account(input) {
    var list_account = $(".account");
    list_account.removeClass("d-none");
    const value = input.val();
    if (value === "all") {
        return;
    }

    list_account.addClass("d-none");
    list_account.filter(function () {
        var lock_account = $(this).attr("data-lock-account");
        if (lock_account.search(value) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}

function search_account_role(input) {
    var list_account = $(".account");
    list_account.removeClass("d-none");
    const value = input.val();
    if (value === "all") {
        return;
    }

    list_account.addClass("d-none");
    list_account.filter(function () {
        var lock_account = $(this).attr("data-account-role");
        if (lock_account.search(value) >= 0) {
            $(this).removeClass("d-none");
        }
    });
}