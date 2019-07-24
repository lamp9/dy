define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'product/index' + location.search,
                    add_url: 'product/add',
                    edit_url: 'product/edit',
                    del_url: 'product/del',
                    multi_url: 'product/multi',
                    table: 'product',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('id')},
                        {field: 'name', title: __('name')},
                        {field: 'desc', title: __('desc')},
                        {field: 'image', title: __('image'),events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'up_time', title: __('up_time'),operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'down_time', title: __('down_time'),operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'down_admin', title: __('down_admin')},
                        {field: 'up_admin', title: __('up_admin')},
                        {field: 'state', title: __('state'),searchList: {"0":__('State 0'),"1":__('State 1'),"2":__('State 2')},custom:{0:"success",1: 'info', 2:'danger'}, formatter: Table.api.formatter.label},
                        {field: 'status', title: __('Status'), searchList: {"normal":__('Normal'),"hidden":__('Hidden')}, formatter: Table.api.formatter.status},
                        {field: 'delete_time', title: __('delete_time'),operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'weigh', title: __('weigh')},
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    'dragsort_url': ''
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'product/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('id')},
                        {field: 'name', title: __('name')},
                        {field: 'desc', title: __('desc')},
                        {field: 'image', title: __('image'),events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {
                            field: 'delete_time',
                            title: __('delete_time'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'operate',
                            width: '130px',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'Restore',
                                    text: __('Restore'),
                                    classname: 'btn btn-xs btn-info btn-ajax btn-restoreit',
                                    icon: 'fa fa-rotate-left',
                                    url: 'product/restore',
                                    refresh: true
                                },
                                {
                                    name: 'Destroy',
                                    text: __('Destroy'),
                                    classname: 'btn btn-xs btn-danger btn-ajax btn-destroyit',
                                    icon: 'fa fa-times',
                                    url: 'product/destroy',
                                    refresh: true
                                }
                            ],
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
$(function () {

    $(".btn-generate").on("click",function () {
        // [{"key":}]
        $("#items").remove();
        $("#sku-info").remove();
        //alert(1);
        //console.log($("#product_key").val());return;
        let json = jQuery.parseJSON($("#product_key").val());
        let data = [];
        let arr = [];
        for (let row in json) {
            let value = {};
            value['key'] = row;
            value['value'] = json[row].split(",").sort();
            data.push(value);
            arr.push(value['value'])
        }

        $("#result").val(JSON.stringify(data));
        let result = arr.reduce((last, current) => {
            const array = [];
            last.forEach(par1 => {
                current.forEach(par2 => {
                    array.push(par1 + "," + par2);
                });
            });
            return array;
        });
        let html = '<div class="form-group" id="items">\n' +
            '        <label class="control-label col-xs-2 col-sm-2"></label>\n' +
            '        <span class="col-xs-2 col-sm-2">sku属性</span>\n' +
            '        <span class="col-xs-2 col-sm-2">库存</span>\n' +
            '        <span class="col-xs-2 col-sm-2">销量</span>\n' +
            '        <span class="col-xs-2 col-sm-2">天数</span>\n' +
            '        <span class="col-xs-2 col-sm-2">价格</span>\n' +
            '    </div>';
        html +="<div id='sku-info'>\n";
        for (let i = 0; i < result.length; i++) {
            html +=generate(i,result[i])
        }
        html +="</div >\n";
        $("#target").after(html);
        console.log(result);
    });

    function generate(key,value) {
        let base = '<div class="form-group">\n' +
            '<label class="control-label col-xs-2 col-sm-2"></label>\n'+
            '        <div class="col-xs-2 col-sm-2">\n' +
            '            <input readonly name="product['+key+'][sku]"  class="form-control"  type="text" value="'+value+'">\n' +
            '        </div>\n' +
            '        <div class="col-xs-2 col-sm-2">\n' +
            '            <input name="product['+key+'][stock]"  class="form-control"  type="text" value="0">\n' +
            '        </div>\n' +
            '        <div class="col-xs-2 col-sm-2">\n' +
            '            <input name="product['+key+'][sales]"  class="form-control"  type="text" value="0">\n' +
            '        </div>\n' +
            '        <div class="col-xs-2 col-sm-2">\n' +
            '            <input name="product['+key+'][day]"  class="form-control"  type="text" value="0">\n' +
            '        </div>\n' +
            '        <div class="col-xs-2 col-sm-2">\n' +
            '            <input name="product['+key+'][price]"  class="form-control"  type="text" value="0">\n' +
            '        </div>\n' +
            '    </div>';
        return base;
    }
});

/*
* <div class="form-group">
        <label class="control-label col-xs-2 col-sm-2">sku属性</label>
        <label class="control-label col-xs-2 col-sm-2">库存</label>
        <label class="control-label col-xs-2 col-sm-2">销量</label>
        <label class="control-label col-xs-2 col-sm-2">价格</label>
    </div>
    <div class="form-group">
        <div class="col-xs-2 col-sm-2">
            <input readonly  class="form-control"  type="text" value="sku属性">
        </div>
        <div class="col-xs-2 col-sm-2">
            <input  class="form-control"  type="text" value="库存">
        </div>
        <div class="col-xs-2 col-sm-2">
            <input  class="form-control"  type="text" value="销量">
        </div>
        <div class="col-xs-2 col-sm-2">
            <input  class="form-control"  type="text" value="价格">
        </div>
    </div>
*
* */