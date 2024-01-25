$(document).ready(function () {
    for (let year = 2023; year <= 2200; year++) {
        $("#input-product-year").html($("#input-product-year").html() +
            `<option value="${year}">${year}</option>`
        );
        $("#input-category-year").html($("#input-category-year").html() +
            `<option value="${year}">${year}</option>`
        );
    }

    for (let month = 1; month <= 12; month++) {
        $("#input-product-month").html($("#input-product-month").html() +
            `<option value="${month}">Tháng ${month}</option>`
        );
    }

    const labelMonth = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
    const labelQuarter = ['Quý 1', 'Quý 2', 'Quý 3', 'Quý 4'];
    const data = [
        {
            label: 'Tổng danh số',
            data: [12, 19, 3, 5, 2, 3, 12, 19, 3, 5, 2, 3],
        },
        {
            label: 'Kính mát',
            data: [4, 3, 7, 4, 2, 25, 15, 20, 3, 7, 15, 20],
        },
        {
            label: 'Mắt kính trẻ em',
            data: [4, 3, 7, 4, 2, 25, 15, 20, 3, 7, 15, 20],
        },
        {
            label: 'Gọng kính',
            data: [4, 3, 7, 4, 2, 25, 15, 20, 3, 7, 15, 20],
        },
        {
            label: 'Tròng kính',
            data: [4, 3, 7, 4, 2, 25, 15, 20, 3, 7, 15, 20],
        }
    ];

    const chartProduct = createChart($("#chart-product"));

    const chartCategory = createChart($("#chart-category"));
    let colorCategory = [];
    let colorCategoryGroup = [];

    $(".number-by-category").change(function () {
        const dataSend = {
            "action": "number-by-category",
            "category": $("#input-category").val(),
            "quarter": $("#input-category-quarter").val(),
            "year": $("#input-category-year").val(),
        }


        $.ajax({
            url: "dashboard",
            dataType: "json",
            data: dataSend,
            method: "POST",
            success: function (data) {
                const arrayData = formatDataToArray(data.data);
                let dataset;
                if (dataSend.category == 0) {
                    colorCategory = createColor(arrayData, colorCategory);
                    dataset = formatDataForChart(arrayData, colorCategory);
                } else {
                    colorCategoryGroup = createColor(arrayData, colorCategoryGroup);
                    dataset = formatDataForChart(arrayData, colorCategoryGroup);
                }
                if (dataSend.quarter == 0) chartSell(chartCategory, labelMonth, dataset);
                else chartSell(chartCategory, labelQuarter, dataset);
            },
            error: function (jqXHR, textStatus, errorTh) {
                console.error("Lỗi");
            }
        });
    });

    $("#input-category").change();

    getProducts();
});

function chartSell(chart, label, data) {
    chart.data.datasets = data;
    chart.data.labels = label;
    chart.update();
}

function getProducts() {
    $.ajax({
        url: "dashboard",
        dataType: 'json',
        method: 'GET',
        data: {
            action: "products",
        },
        success: function (data) {
            let html = ``;
            const products = data.products;
            products.forEach(function (product) {
                    const optionProduct = `<option value="${product.id}">${product.name}</option>`
                    html += optionProduct;
                }
            )

            $("#input-product").html(html);
        }
    })
}

function formatDataToArray(data) {
    return Object.keys(data).map(key => ({
        label: key,
        data: data[key].map(entry => entry.quantity),
    }));
}

function formatDataForChart(data, colors) {
    let index = 0;
    data.map(function (entry) {
        entry['backgroundColor'] = colors[index++];
    });

    return data;
}

function createColor(data, colors) {
    if (colors.length === data.length) return colors
    data.map(function (entry) {
        colors.push(randomColor());
    });

    console.log(colors);
    return colors;
}

function createChart(ctx) {
    return new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [],
            datasets: [],
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}

function randomColor() {
    // Tạo một giá trị ngẫu nhiên cho mỗi thành phần màu (R, G, B)
    const randomComponent = () => Math.floor(Math.random() * 256);

    // Tạo một màu RGB ngẫu nhiên
    const color = `rgb(${randomComponent()}, ${randomComponent()}, ${randomComponent()})`;

    return color;
}


