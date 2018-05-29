<?php echo $header; ?>
<style>
    .skupka_btn {
        padding: 15px;
        text-align: center;

    }
    .skupka_btn:hover {
        cursor: pointer;
        color: #fff;
        background-color: rgba(43, 143, 219, 0.651);
    }
    .skupka_cat_row {
        border-right: 1px solid rgb(34, 109, 167);
    }
    .skupka_cat_row .active {
        color: #fff;
        background-color: #2B8CDB;
    }
    #skupka {
        padding-top: 10px;
        max-height: 500px;
        overflow-y: scroll;
    }
    #skupka::-webkit-scrollbar-track {
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	    background-color: #F5F5F5;
    }

    #skupka::-webkit-scrollbar {
	    width: 10px;
	    background-color: #F5F5F5;
    }

    #skupka::-webkit-scrollbar-thumb {
	    background-color: #0ae;
	    background-image: -webkit-gradient(linear, 0 0, 0 100%,
	                   color-stop(.5, rgba(255, 255, 255, .2)),
					   color-stop(.5, transparent), to(transparent));
    }

    .skupka-product-row {
        padding: 15px;
        border-bottom: 1px solid rgba(102, 102, 102, 0.1);
    }
    .out_of_list {
        font-size: 14px !important;
    }
    .out_of_list:before {
        content: '\203B';
    }
    .skupka-contacts {
        font-size: 20px;
    }
    .skupka-phones {
        background-image: url(<?php echo 'http://' . $_SERVER['SERVER_NAME'] . '/image/call.svg'; ?>);
        background-repeat: no-repeat;
        background-position: center;
    }
    .skupka-visit {
        background-image: url(<?php echo 'http://' . $_SERVER['SERVER_NAME'] . '/image/visit.svg'; ?>);
        background-repeat: no-repeat;
        background-position: center;
    }
</style>
<div class="container">

    <ul class="breadcrumb">            
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>            
    </ul>
    
    <div class="row">
        <div class="col-sm-12">
            <h1><?php echo $skupka_page_header; ?></h1>
            <p><?php echo htmlspecialchars_decode($skupka_page_descr); ?></p>
            <div class="text-center">
                <img src="<?php echo 'http://' . $_SERVER['SERVER_NAME'] . '/image/skupka.jpg' ?>" alt="" class="img-responsive">
            </div>
            <hr>
            <p><?php echo $skupka_tablehead; ?></p>
            <hr>
            <br>
            <div class="col-sm-2 skupka_cat_row">
                <?php foreach($categories as $category){ ?>
                    <div class="col-sm-12 skupka_btn" data-category="<?php echo $category['category_id'] ?>">
                        <?php echo $category['category_name'] ?>
                    </div>
                <?php } ?>
            </div>            
            <div class="col-sm-10" id="skupka">
            <?php foreach($phones as $phone){ ?>
                <div class="col-sm-12 skupka-product-row"><?php echo $phone['product_name'] ?></div>
            <?php } ?>
            </div>            
        </div>
        <hr>
        <br>
        <div class="col-sm-12">
                <br>
                <p class="out_of_list"><strong>Также рассмотрим предложения на модели отсутствующие в списке.</strong></p>
        </div>
    </div>
    <div class="row">
        <hr>
        <div class="col-sm-12 skupka-contacts">
            <br>
            <div class="col-sm-6 skupka-phones">
                <div><strong>Позвоните нам:</strong></div>
                <hr>
                <div class="text-center">Краснодар: <i class="fa fa-phone" aria-hidden="true"></i> 8918-653-73-73 (WhatsApp)</div>
                <hr>
                <div class="text-center">Волгоград: <i class="fa fa-phone" aria-hidden="true"></i> 88442-60-90-29</div>
            </div>
            <div class="col-sm-6 skupka-visit">
                <div><strong>Сдайте телефон или планшет в любой из наших магазинов:</strong></div>
                <hr>
                <div class="text-center">Краснодар: <i class="fa fa-map-marker" aria-hidden="true"></i> (Центр р-н) ул.Мира 25 офис 1 вход со двора.</div>
                <hr>
                <div class="text-center">Волгоград: <i class="fa fa-map-marker" aria-hidden="true"></i> (Центр р-н) пр-т Ленина 25 вход со двора.</div>
            </div>
        </div>
    </div>

</div><!-- !container -->

<script>
$(document).ready(function(){
    $('.skupka_btn:first-child').addClass("active");

    $('.skupka_btn').click(function() {
        var that = $(this);
        var category = that.data('category');        
        var post = {
            category: category
        };
        console.log('click id= '+ category);
        $.ajax({
          url: 'index.php?route=skupka/skupka/getProductsAjax',
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
                    $('#skupka').append('<div class="col-sm-12 skupka-product-row">'+ json[key]['product_name'] +'</div>');
                }
                
            }
          }
        });
        return false;
    });
});
</script>
<?php echo $footer; ?>