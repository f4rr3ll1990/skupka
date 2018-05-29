<style>
    .pull {
        display: inline-block;
    }
    .skupka_btn {
        padding: 15px;
        text-align: center;

    }
    .skupka_btn:hover {
        cursor: pointer;
        color: #fff;
        background-color: rgba(43, 143, 219, 0.651);
    }
    .skupka_btn:hover .del_skupka_cat {
        background-color: rgb(199, 87, 87);
    }

    .skupka_cat_row {
        border-right: 1px solid rgb(34, 109, 167);
    }
    .skupka_cat_row .active {
        color: #fff;
        background-color: #2B8CDB;
    }
    #skupka_product_add {
        float: right;
        margin-top: 20px;
        margin-right: 5px;
    }
    #skupka-product-delete {
        margin: -5px 0px 10px 0px;
    }
    .skupka-product-head {
        border-bottom: 1px solid rgb(34, 109, 167);
    }
    .skupka-product-row {
        padding: 15px;
        border-bottom: 1px solid rgba(102, 102, 102, 0.1);
    }
    .out_of_list:before {
        content: '\203B';
    }

    .cat_list_wrap {
        border-left: 1px solid rgb(34, 109, 167);
    }
</style>
<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1>Скупка краденного xD</h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
      <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#skupka-products" aria-controls="skupka-products" role="tab" data-toggle="tab">Товары</a></li>
            <li role="presentation"><a href="#skupka-categories" aria-controls="skupka-categories" role="tab" data-toggle="tab">Категории товаров</a></li>
            <li role="presentation"><a href="#skupka-settings" aria-controls="skupka-settings" role="tab" data-toggle="tab">Настройка модуля</a></li>
        </ul>
    
      <!-- Tab panes -->
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="skupka-products">
                <div class="row">
                    <div class="col-sm-12">
                        <h4>Добавить товар:</h4>
                    </div>
                    <hr>
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <label for="sk_in_name">Название:</label>
                            <input class="form-control" type="text" name="sk_in_name" id="skupka_add_input">
                        </div>
                        <div class="col-sm-4">
                                <label for="sk_in_cat">Категория:</label>
                            <select name="sk_in_cat" class="form-control" id="skupka_add_select">
                                <option value="not_changed" selected="selected">*</option> 
                                <?php foreach($categories as $category){ ?>
                                    <option value="<?php echo $category['category_id'] ?>"><?php echo $category['category_name'] ?></option>
                                <?php } ?>                                                      
                            </select>
                        </div>
                        <div class="sol-sm-2">
                            <button class="btn btn-info" id="skupka_product_add">Добавить</button>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-12">
                        <h4>Список товаров:</h4>
                    </div>
                    <div class="col-sm-2 skupka_cat_row">
                        <?php foreach($categories as $category){ ?>
                            <div class="col-sm-12 skupka_btn" data-category="<?php echo $category['category_id'] ?>">
                                <?php echo $category['category_name'] ?>
                            </div>
                        <?php } ?>
                    </div>

                    <div class="col-sm-10">
                        <div class="row">
                            <div class="col-sm-12 skupka-product-head">
                                <div class="col-sm-6">
                                    <h4>Название:</h4>
                                </div>
                                <div class="col-sm-2 col-sm-offset-1">
                                    <div class="pull"><h4>Поиск</h4></div>
                                    <div class="pull" id="form"></div>                                    
                                </div>
                                <div class="col-sm-2 sol-sm-offset-1">
                                        <button class="btn btn-danger" id="skupka-product-delete">Удалить без подтверждения</button>
                                        <input type="checkbox" name="delallprd" id="delete_all_products">
                                </div>
                            </div>
                        </div>
                        <div class="row" id="skupka">
                            <?php foreach($phones as $phone){ ?>
                            <div class="col-sm-12 skupka-product-row">
                                <div class="col-sm-10">
                                    <?php echo $phone['product_name']; ?>
                                </div>
                                <div class="col-sm-1 col-sm-offset-1">
                                    <input class="box" type="checkbox" name="id[]" value="<?php echo $phone['product_id']; ?>">
                                </div>
                            </div>                        
                            <?php } ?>
                        </div>
                    </div>
                </div>             
            </div>
            <div role="tabpanel" class="tab-pane" id="skupka-categories">
                <div class="row">
                    <div class="col-sm-6 cat_add_wrap">
                        <div class="col-sm-12">
                            <h4>Добавить категорию:</h4>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <label for="skupka_cat_input"></label>
                                <input type="text" name="skupka_cate_add" id="skupka_cat_input" class="form-control">
                            </div>
                            <div class="col-sm-6">
                                <button class="btn btn-info" id="skupka_cat_add">Добавить</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 cat_list_wrap">
                        <div class="col-sm-12">
                            <h4>Список категорий:</h4>
                        </div>
                        <?php foreach($categories as $category){ ?>
                            <div class="col-sm-12 skupka_btn">
                                <div class="col-sm-10">
                                    <?php echo $category['category_name'] ?>
                                </div>
                                <div class="col-sm-2">
                                    <button class="del_skupka_cat" data-delcatid="<?php echo $category['category_id'] ?>">
                                        <i class="fa fa-trash-o" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="skupka-settings">
                <div class="row">
                    <div class="col-sm-12">
                        <h4>Настройки модуля:</h4>
                    </div>
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <label for="skupka_meta_head">Мета тайтл:</label>
                            <input type="text" name="skupka_meta_head" id="skupka_meta_head" class="form-control" value="<?php echo $skupka_title; ?>">
                            <hr>
                            <label for="skupka_meta_descr">Мета Описание:</label>
                            <input type="text" name="skupka_meta_descr" id="skupka_meta_descr" class="form-control" value="<?php echo $skupka_descr; ?>">
                            <hr>
                            <label for="skupka_page_header">Заголовок страницы:</label>
                            <input type="text" name="skupka_page_header" id="skupka_page_header" class="form-control" value="<?php echo $skupka_page_header; ?>">
                            <hr>
                            <label for="skupka_page_descr">Описание:</label>
                            <textarea name="skupka_page_descr" id="skupka_page_descr" class="form-control"><?php echo $skupka_page_descr; ?></textarea>
                            <hr>
                            <button id="skupka_settings_save" class="btn btn-info">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  </div>
</div>

<script>
$(document).ready(function(){
    $('#skupka_page_descr').summernote({height: 300});
    $('.skupka_btn:first-child').addClass("active");

    $('.skupka_btn').click(function() {
        var that = $(this);
        var category = that.data('category');        
        var post = {
            category: category
        };
        console.log('click id= '+ category);
        $.ajax({
          url: 'index.php?route=skupka/skupka/getProductsAjax&token=<?php echo $token; ?>',
          type: 'post',
          data: post,
          dataType: 'json',
          beforeSend: function() {
            console.log('before send: '+ category);
          },
          error: function (json) {
            console.log('error');
            console.log(json);
          },
          success: function(json) {
            console.log('success');
            console.log(json);

            $('.skupka_cat_row > .active').removeClass('active');
            $(that).addClass('active');
            $('#skupka').html('');
            if(json.length > 0 ){
                for (var key in json){
                    $('#skupka').append('<div class="col-sm-12 skupka-product-row"><div class="col-sm-10">'+ json[key]['product_name'] +'</div><div class="col-sm-1 col-sm-offset-1"><input class="box" type="checkbox" name="id[]" value="'+ json[key]['product_id'] +'"></div></div>');
                }
                
            }
          }
        });
        return false;
    });


    $('.nav-tabs a').click(function (e) {
      e.preventDefault()
      $(this).tab('show')
    });

    $('#delete_all_products').change(function(){
        if(this.checked){
            $('.box').prop('checked', true);
        }else{
            $('.box').prop('checked', false);
        }
    });

    
    //Добавление
    $('#skupka_product_add').click(function() {
        var name = $('#skupka_add_input').val();
        var category = $('#skupka_add_select').val();

        var post = {
            prname: name,
            prcategory: category
        };

        console.log(post);
        if(category == 'not_changed'){
            alert('Выберите категорию!');            
        }
        else{
            $.ajax({
              url: 'index.php?route=skupka/skupka/addProduct&token=<?php echo $token; ?>',
              type: 'post',
              data: post,
              dataType: 'json',
              beforeSend: function() {
                console.log('before send: '+ post.name +'; id = '+ post.category);
              },
              error: function (json) {
                console.log('error');
                console.log(json);
              },
              success: function(json) {
                console.log('success');
                console.log(json);
                location.reload();
              }
            });
        }
        return false;
    });

    //Удаление
    $('#skupka-product-delete').click(function(){
        $.ajax({
            url: 'index.php?route=skupka/skupka/deleteProduct&token=<?php echo $token; ?>',
            type: 'post',
            data: $("#skupka-products .box:checked"),
            dataType: 'json',
            beforeSend: function() {
                console.log($("#skupka-products .box:checked"));
            },
            error: function (json) {
                console.log(json);		
            },
            success: function(json) {
                console.log(json);		
                location.reload();			
            }
        });
        return false;
    });

    //Добавление категории
    
    $('#skupka_cat_add').click(function() {
        var name = $('#skupka_cat_input').val();

        var post = {
            name: name
        };

        $.ajax({
          url: 'index.php?route=skupka/skupka/addCategory&token=<?php echo $token; ?>',
          type: 'post',
          data: post,
          dataType: 'json',
          beforeSend: function() {
          },
          error: function (json) {
            console.log('error');
            console.log(json);
          },
          success: function(json) {
            console.log('success');
            console.log(json);
            location.reload();
          }
        });
        return false;
    });

    //Удаление категории
    $('.del_skupka_cat').click(function() {
        var id = $(this).data('delcatid');        
        var post = {
            id: id
        };
        $.ajax({
          url: 'index.php?route=skupka/skupka/deleteCategory&token=<?php echo $token; ?>',
          type: 'post',
          data: post,
          dataType: 'json',
          beforeSend: function() {
              console.log('beforeSend');
          },
          error: function (json) {
            console.log('error');
            console.log(json);
          },
          success: function(json) {
            console.log('success');
            console.log(json);
            location.reload();
          }
        });
        return false;
    });


    //Настройки
    
    $('#skupka_settings_save').click(function() {
        var head = $('#skupka_meta_head').val();
        var descr = $('#skupka_meta_descr').val();
        var pagehead = $('#skupka_page_header').val();
        var pagedescr = $('#skupka_page_descr').val();

        var post = {
            head: head,
            descr: descr,
            pagehead: pagehead,
            pagedescr: pagedescr
        };

        $.ajax({
          url: 'index.php?route=skupka/skupka/saveSettings&token=<?php echo $token; ?>',
          type: 'post',
          data: post,
          dataType: 'json',
          beforeSend: function() {
          },
          error: function (json) {
            console.log('error');
            console.log(json);
          },
          success: function(json) {
            console.log('success');
            console.log(json);
            location.reload();
          }
        });
        return false;
    });


});



(function ($) {
  jQuery.expr[':'].Contains = function(a,i,m){
      return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
  };

  function filterList(header, list) {
    var form = $("<form>").attr({"class":"filterform","action":"#"}),
        input = $("<input>").attr({"class":"filterinput","type":"text"});
    $(form).append(input).appendTo(header);

    $(input)
      .change( function () {
        var filter = $(this).val();
        if(filter) {

          $matches = $(list).find('.skupka-product-row .col-sm-10:Contains(' + filter + ')').parent();
          $('.skupka-product-row', list).not($matches).slideUp();
          $matches.slideDown();

        } else {
          $(list).find(".skupka-product-row").slideDown();
        }
        return false;
      })
    .keyup( function () {
        $(this).change();
    });
  }

  $(function () {
    filterList($("#form"), $("#skupka"));
  });
}(jQuery));
</script>

<?php echo $footer; ?>