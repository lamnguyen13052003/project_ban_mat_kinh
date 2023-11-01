$(document).ready(function () {
    setEvent()

    addText();
});

var textIsDarken;

/*Nhập text từ bản phím vào phần mô tả sản phẩm*/
function addText() {
    $("#new-text").keypress(function (event) {
        if (event.which == '13') {
            add_text_in_list($(this).html());
            $(this).text("")
            $(this).prev().mouseup(function () {
                $(this).attr("contenteditable", "true");
                changeAttrEdit($(this));
                textIsDarken = getTextIsDarken();
            });

            $(this).prev().keypress(function (event) {
                if (event.which == '13') {
                    $(this).removeAttr("contenteditable");
                    changeAttrEdit($("#new-text"));

                    if ($(this).text() == "") {
                        $(this).remove();
                    }
                }
            });

            changeAttrEdit($(this));
        }

    });

    $("#new-text").mouseup(function () {
        changeAttrEdit($(this));
        textIsDarken = getTextIsDarken();
    });
}

/*Thêm hình vào phn mô tả sản phẩm*/
function addImgForExpandedInfoProduct(file) {
    var selectedFile = file.files[0];
    const imageUrl = window.URL.createObjectURL(selectedFile);

    $("#frame-content")
        .find("*")
        .last()
        .after('<div class="img">\n' +
            '         <img src="' + imageUrl + '" alt="' + selectedFile.name + '">\n' +
            '          <button class="cancel text-danger">x</button>\n' +
            '   </div>');

    $("#frame-content")
        .find(".img")
        .last()
        .find(".cancel")
        .click(function () {
            $(this).parent().remove();
        });
}

/*Thêm hình vào sản phẩm*/
function addImgFile(file) {
    var selectedFile = file.files[0];
    const imageUrl = window.URL.createObjectURL(selectedFile);

    $("#main").find(".input-img-product-body").find(".img-product").last().after(' <div class="img-product">\n' +
        '                        <img src="' + imageUrl + '" alt="' + selectedFile.name + '">\n' +
        '                        <button class="text-danger cancel">x</button>\n' +
        '                    </div>');

    $("#main").find(".input-img-product-body").find(".img-product").last().find(".cancel").click(function () {
        $(this).parent().remove();
        updateSelectImgOption();
    });
    updateSelectImgOption();
}

/*Cập nhật lại danh sách các hình có thể chọn làm hình ảnh cho phần select option*/
function updateSelectImgOption() {
    const listImg = $("#main").find(".input-img-product-body").find(".img-product");
    $("#select-img-option-product").html('<option selected disabled>Hình ảnh</option>');
    for (var i = 0; i < listImg.length; i++) {
        $("#select-img-option-product").find("option").last().after('<option value="' + i + '" >Hình ' + i + '</option>');
    }
}

function getTextIsDarken() {
    return window.getSelection().toString();
}

function editText(type) {
    if (textIsDarken == null) return;

    switch (type) {
        case "format_bold": {
            formatBold(textIsDarken);
            break;
        }
        case "format_italic": {
            formatItalic(textIsDarken);
            break;
        }
        case "format_underlined": {
            formatUnderlined(textIsDarken);
            break;
        }

        case "link": {
            addLink(textIsDarken);
            break;
        }

        case "format_list_numbered": {
            break;
        }
    }
}

function changeTagNameNextText(type) {
    switch (type) {
        case "format_bold": {
            formatBold(textIsDarken);
            break;
        }
        case "format_italic": {
            formatItalic(textIsDarken);
            break;
        }
        case "format_underlined": {
            formatUnderlined(textIsDarken);
            break;
        }

        case "format_list_numbered": {
            format_list_numbered(textIsDarken);
            break;
        }
    }
}

function formatBold(text) {
    var noteEdit = $("#frame-content>*[edit='true']"),
        htmlNodeEdit = noteEdit.html() + "",
        indexFirst = htmlNodeEdit.indexOf(text),
        first = htmlNodeEdit.substring(0, indexFirst),
        edit = `<strong>` + text + `</strong>`,
        end = htmlNodeEdit.substring((indexFirst + text.length), htmlNodeEdit.length),
        newNote = first + edit + end;


    if (htmlNodeEdit.indexOf(edit) >= 0) {
        first = htmlNodeEdit.substring(0, indexFirst - `<strong>`.length),
            end = htmlNodeEdit.substring((indexFirst + text.length + `</strong>`.length), htmlNodeEdit.length);
        newNote = first + text + end;
    }

    noteEdit.html(newNote);
}

function formatItalic(text) {
    var noteEdit = $("#frame-content>*[edit='true']"),
        htmlNodeEdit = noteEdit.html() + "",
        indexFirst = htmlNodeEdit.indexOf(text),
        first = htmlNodeEdit.substring(0, indexFirst),
        edit = `<em>` + text + `</em>`,
        end = htmlNodeEdit.substring((indexFirst + text.length), htmlNodeEdit.length),
        newNote = first + edit + end;

    if (htmlNodeEdit.indexOf(edit) >= 0) {
        first = htmlNodeEdit.substring(0, indexFirst - `<em>`.length),
            end = htmlNodeEdit.substring((indexFirst + text.length + `</em>`.length), htmlNodeEdit.length);
        newNote = first + text + end;
    }

    noteEdit.html(newNote);
}

function formatUnderlined(text) {
    var noteEdit = $("#frame-content>*[edit='true']"),
        htmlNodeEdit = noteEdit.html() + "",
        indexFirst = htmlNodeEdit.indexOf(text),
        first = htmlNodeEdit.substring(0, indexFirst),
        edit = `<u>` + text + `</u>`,
        end = htmlNodeEdit.substring((indexFirst + text.length), htmlNodeEdit.length),
        newNote = first + edit + end;

    if (htmlNodeEdit.indexOf(edit) >= 0) {
        first = htmlNodeEdit.substring(0, indexFirst - `<u>`.length),
            end = htmlNodeEdit.substring((indexFirst + text.length + `</u>`.length), htmlNodeEdit.length);
        newNote = first + text + end;
    }

    noteEdit.html(newNote);
}

function addLink(text) {
    $("#button-show-input-link").click();
}

function add_text_in_list(html) {
    if(!$("#format_list_numbered").is(":checked") && !$("#format_list_bulleted").is(":checked")){
        $("#new-text").before(`<p>` + html + `</p>`);
        return;
    }

    if ($("#new-text").prev().is("ul") || $("#new-text").prev().is("ol")) {
        const form = `<li>` + html + `</li>`;
        if ($("#new-text").prev().find("li").length != 0) {
            $("#new-text").prev().find("li:last").after(form)
        } else {
            $("#new-text").prev().html(form);
        }
    }
}

function changeAttrEdit(node) {
    $("#frame-content").find("*[edit='true']").removeAttr("edit");
    node.attr("edit", "true");
}

function actionListUl() {
    if ($("#new-text").prev().is("ul") && $("#new-text").prev().find("li") == 0) {
        $("#new-text").prev().remove();
    }

    if (!$("#new-text").prev().is("ul")) {
        $("#new-text").before(`<ul></ul>`)
    }
}

function actionListOl() {
    if ($("#new-text").prev().is("ol") && $("#new-text").prev().find("li") == 0) {
        $("#new-text").prev().remove();
    }

    if (!$("#new-text").prev().is("ol")) {
        $("#new-text").before(`<ol></ol>`)
    }
}

/*Hủy event press enter của form*/
$(document).keypress(
    function (event) {
        if (event.which == '13') {
            event.preventDefault();
        }
    });

/*Thết lập event*/
function setEvent() {
    setClickForButtonCancel();

    setClickForNewText();

    setFocusNextText();

    setChangeForUpdateImg();

    setClickForItemEdit();

    setClickForButtonSaveURL();

    setClickForEditItem();
}

function setClickForNewText() {
    $("#new-text").click(function () {
        if ($(this).text().indexOf(`Nhập nội dung tại đây......`) >= 0) {
            $(this).text("").css({"color": "#000"});
        }
        $("#frame-content").find("*:not(#new-text)").removeAttr("contenteditable");
        $("#frame-content").find("*:not(#new-text)").removeAttr("edit");
    });
}


function setClickForButtonCancel() {
    $(".cancel").click(function (event) {
        $(this).parent().remove();
        updateSelectImgOption();
    });
}

function setFocusNextText() {
    $(".input-expanded-info-product-body").click(function (event) {
        if (event.target == this) {
            $("#new-text").focus();
            changeAttrEdit($("#new-text"));
            if ($("#new-text").text().indexOf(`Nhập nội dung tại đây......`) >= 0) {
                $("#new-text").text("").css({"color": "#000"});
            }
        }
    });
}

function setChangeForUpdateImg() {
    $("#input-img-product").change(function (event) {
        addImgFile(this);
    });


    $("#input-img-for-expanded-info-product").change(function (event) {
        addImgForExpandedInfoProduct(this);
    });

}

function setClickForItemEdit() {
    $(".item-edit").mousedown(function () {
        var type = $(this).attr("value");
        editText(type);
    });
}

function setClickForButtonSaveURL() {
    $("#button-save-url").mouseup(function () {
        var url = $("#input-link").val(),
            text = textIsDarken;
        if (url == "") return;

        var noteEdit = $("#frame-content>*[edit='true']"),
            htmlNodeEdit = noteEdit.html() + "",
            indexFirst = htmlNodeEdit.indexOf(text),
            first = htmlNodeEdit.substring(0, indexFirst),
            edit = `<a class="text-primary text-decoration-underline link" title="` + url + `" href="` + url + `">` + text + `</a>`,
            end = htmlNodeEdit.substring((indexFirst + text.length), htmlNodeEdit.length),
            newNote = first + edit + end;

        noteEdit.html(newNote);
    });
}

function setClickForEditItem() {
    $(".item-edit:not(.item-edit[value=link])").find("input").mousedown(function () {
        // if (textIsDarken != null && textIsDarken != "") return;

        if ($(this).is(":checked")) {
           alert("checked");
        } else {
            alert("dont checked");
        }
    });
}