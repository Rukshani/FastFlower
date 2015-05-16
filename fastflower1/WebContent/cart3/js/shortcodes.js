(function($){
	
	
	
	$(document).ready(function(){	
		
		$(document).on('mousedown touchstart', '.frbe_product_slider_container .frbe_product_slide_img_wrapper> img', function(e){
			var date = new Date();
			$(this).data({'time' : date.getTime()});
			$(this).off('click');
			e.preventDefault();
		});
		
		$(document).on('mouseup touchend', '.frbe_product_slider_container .frbe_product_slide_img_wrapper > img', function(e){
			$(this).on('click', function(e){
				e.preventDefault();
			});
			var date = new Date();
			e.preventDefault();
			var oldTime = $(this).data('time');
			if(date.getTime() - oldTime < 150) {
				window.location.href = $(this).parent().attr('data-product-href');	
			}
		});


		
		$(document).on('click', '.frbe_product_quickview', function(e){
			 // e.preventDefault();
			var ind, $container;
			if($(this).closest('.frbe_product_slide').length > 0){
				ind = parseInt($(this).closest('.frbe_product_slide').attr('data-colection-index'));
				$container = $(this).closest('.frbe_product_slider_container');
				var settings = $container.data('settings');
			} else {
				ind = parseInt($(this).closest('.frbe_grid_item').attr('data-colection-index'));
				$container = $(this).closest('.frbe_product_grid_container');

			}
			
			$container.data('product_link_propagation', true);
			var data = $container.data('product_content');
		
			var elementData = data[ind].split('||SEP||');
			frbeProductQuickviewContentChange(elementData, $container);
			frbeProductQuickviewShaderToggle($container);
		});
		
		$(document).on('click', '.frbe_product_quickview_close', function(){
			var $wrp = $(this).closest('.frbe_product_quickview_wrapper');
			$wrp.stop(true).animate({opacity:0}, 300, function(){$(this).hide();});
			frbeProductQuickviewShaderToggle($wrp.siblings('.frbe_product_slider_container'));
		});
		
		$(document).on('click', '.frbe_product_slider_add_to_cart', function(e){
			e.stopPropagation();
			e.preventDefault();
	        addToCart($(this).attr('data-cart-href'), $(this));
	        return false;
		});
		
		$(document).on('click', '.frbe_grid_item' , function(e){
			e.stopPropagation();
			e.preventDefault();	
		});
		
		$(document).on('dragstart', '.frbe_grid_item' , function(e){
			e.preventDefault();	

		});

		$(document).on('click', '.frbe_product_grid_container .frbe_grid_item .wp-post-image', function(){
			var prodLink = $(this).closest('.frbe_grid_item').attr('data-product-href');
			window.location.href = prodLink;
		});
		
		
		$(document).on('dragstart', '.frbe_products_list ul.products a', function(e){
			e.preventDefault();
		});
		
	});

	function addToCart(url, $this) {
 	   $.get(url, function() {
             $this.siblings('.frbe_product_slider_view_cart').show();
	});
	}

	function frbeProductQuickviewShaderToggle($container) {
		if($('.frbe_product_quickview_shader').length <= 0) {
			$('body').prepend('<div class="frbe_product_quickview_shader hidden"></div>');
		}
		var $this = $('.frbe_product_quickview_shader');
		if($this.hasClass('hidden')) {
			$this.show().stop(true).animate({opacity : 1}, 300).removeClass('hidden');
		} else {
			$this.stop(true).animate({opacity : 0}, 300, function(){$(this).hide();}).addClass('hidden');
		}	
	}
	
	function frbeProductQuickviewContentChange(elementData, $container){
		var structure = '<div class="frbe_product_quickview_wrapper">'+
							'<div class="frbe_product_quickview_close">X</div>'+
							'<div class="frbe_quickview_slider">'+
								'<div class="frbe_quickview_slides">'+
									'<div class="frbe_quickview_slide"></div>'+
								'</div>'+
							'</div>'+
							'<div class="frbe_quickview_content">'+
								'<span class="frbe_quickview_cat"></span>'+
								'<a class="frbe_quickview_headline"></a>'+
								'<div class="frbe_quickview_price"></div>'+
								'<div class="frbe_quickview_text"></div>'+
								'<a class="frbe_quickview_add_to_cart add_to_cart_button" href="" rel="nofollow"></a>'+
							'</div>'+
						'</div>'
		if($('.frbe_product_quickview_wrapper').length > 0) {
			$('.frbe_product_quickview_wrapper').remove();
		}
		$('body').prepend(structure);
		var $quickviewWrapper = $('.frbe_product_quickview_wrapper');
		var gallery = elementData[8].split('|--|');
		var catLinks = elementData[3].split('|--|');
		var catNames = elementData[2].split('|--|');
		
		$quickviewWrapper.find('.frbe_quickview_add_to_cart').attr('href', elementData[9]).html(elementData[10]);
		$quickviewWrapper.find('.frbe_quickview_text').html(elementData[0]);
		$quickviewWrapper.find('.frbe_quickview_headline').attr('href', elementData[4]).html(elementData[1]);
		var catWrapper = $quickviewWrapper.find('.frbe_quickview_cat');
		for(i=0; i<catLinks.length; i++){
			catWrapper.append('<a></a>').children('a:last').attr('href', catLinks[i]).html(catNames[i]);
			if(i != catLinks.length-1){
				catWrapper.append(', ');
			}
		}
		$quickviewWrapper.find('.frbe_quickview_price').html('<span '+(elementData[7] != '' ? 'class="crossed"' : '')+'>'+elementData[6]+elementData[5]+(elementData[7] != '' ? '</span>, '+elementData[6] : '</span>')+elementData[7]);
		
		
		$quickviewWrapper.find('.frbe_quickview_slides').empty();
		for(i=0; i<gallery.length; i++){
			$quickviewWrapper.find('.frbe_quickview_slides').append('<div class="frbe_quickview_slide"></div>');
			$quickviewWrapper.find('.frbe_quickview_slide:last').html(gallery[i]);	
		}
		$quickviewWrapper.find('.frbe_quickview_slide').each(function(){
			var $img = $(this).children('img');
			var height = parseInt($img.attr('height'));
			var width =  parseInt($img.attr('width'));
			var refH = $(this).height();
			var refW = $(this).width();
			var ratio = height/width;
			if(refH/ratio > refW) {
				$img.css({'width' :'auto', 'max-height' :'100%', 'max-width' :'none', 'height' : 'auto'});
				if(height > refH) {
					$img.css({"margin-left" : (refW-refH/ratio)/2});
				} else {
					$img.css({"margin-left" : (refW-height/ratio)/2});
					$img.css({"margin-top" : (refH-width/ratio)/2});
				}
			} else {
				$img.css({'max-width' :'100%', 'height' :'auto', 'max-height' :'none', 'width' : 'auto'});
				if(width > refW) {
					$img.css({"margin-top" : (refH-refW*ratio)/2});
				}else {
					$img.css({"margin-left" : (refW-height/ratio)/2});
					$img.css({"margin-top" : (refH-refW*ratio)/2});
				}
			}
		});
		frbeProductQuickviewInit($container);
		$quickviewWrapper.show().animate({opacity: 1}, 300);
	}

	function frbeProductQuickviewInit($this) {
		if(typeof $this.data("settings") != 'object'){
			$this.data("settings", new Object());
		}
		var settings = $this.data("settings");
		settings["quickview_swiper"] = $('.frbe_quickview_slider').swiper({
			mode:"horizontal",
			loop: true,
			slidesPerView: 1,
			resizeReInit : true,
			wrapperClass : "frbe_quickview_slides",
			slideClass: "frbe_quickview_slide",
			preventLinks : true,
			preventLinksPropagation : true
		});
	}


	$.fn.frbeProductSlider = function(){
		var $this = $(this);
		var settings = {};
		settings["spv"] = parseInt($this.attr("data-spv"));
		settings["asr"] = $this.attr("data-asr");
		settings["rref"] = parseInt($this.attr("data-rref"));
		settings["ratio"] = parseFloat(settings["asr"].split(":")[1])/parseFloat(settings["asr"].split(":")[0]);
		settings["swiper"] = $this.swiper({
			mode:"horizontal",
			loop: true,
			slidesPerView: settings["spv"],
			resizeReInit : true,
			wrapperClass : "frbe_product_slider_wrapper",
			slideClass: "frbe_product_slide",
			preventLinks : true,
			preventLinksPropagation : true
		});
		$this.data("settings", settings);
		var textHeight = 0;
		
		$this.find('.frbe_product_slide_text_wrapper').each(function(){
			currentElHeight = $(this).height() +parseInt($(this).css('padding-top')) + parseInt($(this).css('padding-bottom'));
			if(currentElHeight > textHeight) {
				textHeight = currentElHeight;
			}
			if($(this).find('.frbe_product_slider_sale_price').length > 0) {
				$(this).find('.frbe_product_slider_regular_price').css('text-decoration', 'line-through');
			}
		});
			var $innerWrp = $this.find(".frbe_product_slide .frbe_product_slide_inner");

		$this.find(".frbe_product_slide").height($innerWrp.height() + parseInt($innerWrp.css('padding-top')) + parseInt($innerWrp.css('padding-bottom')));
		$this.height($this.find(".frbe_product_slide:first").width()*settings["ratio"]+textHeight);
		$this.find(".frbe_product_slide_img_wrapper").height($this.height() - textHeight-parseInt($this.find(".frbe_product_slide_inner").css('padding-left'))*2);
		$this.find("img.wp-post-image").each(function(){
			frbCpsImageCentering($this.find(".frbe_product_slide_img_wrapper"), $(this));
		});

	}
	
	function frbCpsImageCentering($wrpThis, $cThis) {
		var width = parseInt($cThis.attr("width")), 
			height = parseInt($cThis.attr("height")),
			wrpWidth = $wrpThis.width(),
			wrpHeight =$wrpThis.height(),
			reduction = wrpWidth/width;
			reduction = reduction > 1 ? 1 : reduction ;
		$cThis.css({"margin-left" : (wrpWidth-width*reduction)/2, "margin-top" : (wrpHeight - height*reduction)/2});
	}

	$.fn.frbeProductSliderResize = function(){
		var $this = $(this);
		var settings = $this.data('settings'), calculatedNum = Math.floor($this.width()/settings['rref']);
		settings['spvRecalc'] = calculatedNum > settings['spv'] ? settings['spv'] : calculatedNum;
		settings['spvRecalc'] = settings['spvRecalc'] < 1 ? 1 : settings['spvRecalc'];
		settings['swiper'].params.slidesPerView=settings['spvRecalc'];
		settings['swiper'].reInit();
		
		var textHeight = 0;
		$this.find('.frbe_product_slide_text_wrapper').each(function(){
			currentElHeight = $(this).height() +parseInt($(this).css('padding-top')) + parseInt($(this).css('padding-bottom'));
			if(currentElHeight > textHeight) {
				textHeight = currentElHeight;
			}
			if($(this).find('.frbe_product_slider_sale_price').length > 0) {
				$(this).find('.frbe_product_slider_regular_price').css('text-decoration', 'line-through');
			}
		});
		$this.height($this.find('.frbe_product_slide:first').width()*settings['ratio']+textHeight);
		$this.find('.frbe_product_slide').height($this.height());
		settings['swiper'].setWrapperTranslate(0,0,0);
		$this.find(".frbe_product_slide_img_wrapper").height($this.height() - textHeight-parseInt($this.find(".frbe_product_slide_inner").css('padding-left'))*2);
		$this.find("img.wp-post-image").each(function(){
			frbCpsImageCentering($this.find(".frbe_product_slide_img_wrapper"), $(this));
		});
		
		if('touchstart' in window) {
			$('.frbe_product_slider_add_to_cart').addClass('mobile');
		} else {
			$('.frbe_product_slider_add_to_cart').removeClass('mobile');
		}
		if('touchstart' in window || $(window).width()/window.devicePixelRatio < 752 ) {
			$('.frbe_product_quickview').addClass('disabled');
		} else {
			$('.frbe_product_quickview').removeClass('disabled');
		}
	}


	// products grid init

	$.fn.frbeProductsGridRefresh = function(){
		var $this = $(this);
		var itemWidth,itemHeight, img, imgHeight, imgWidth, widthRatio, heightRatio, wrapperWidth, itemCount, noTopPaddingItems;
		$this.find('.frbe_grid_item_wrapper').each(function(){

			wrapperWidth = $(this).closest('.fbuilder_module').width();
			itemCount = 0;
			$(this).each(function(){
				$(this).removeClass('frbe_grid_item_760 frbe_grid_item_455');
				if (wrapperWidth<760 && wrapperWidth>455) {
					noTopPaddingItems=2;
					$(this).addClass('frbe_grid_item_760');
				}
				else if (wrapperWidth<=455) {
					noTopPaddingItems=1;
					$(this).addClass('frbe_grid_item_455');
				}
				else {
					noTopPaddingItems=3;
				}
			});

			itemWidth = $(this).outerWidth(true);
			
			if ($(this).hasClass('frbe_grid_item_single')) {
				itemHeight = itemWidth/2;
			} else if ($(this).hasClass('frbe_grid_item_double')) {
				itemHeight = itemWidth+6;
			} else {
				itemHeight = itemWidth;
			}

			$(this).height(itemHeight);
			img = $(this).find('img');
			imgHeight = img.attr('height');
			imgWidth = img.attr('width');
			widthRatio = imgWidth/itemWidth;
			heightRatio = imgHeight/itemHeight;
			
			if (widthRatio<heightRatio) {
				img.css('width','100%');
				imgHeight/=widthRatio;
				img.css('height',imgHeight);
				heightRatio = imgHeight - itemHeight;
				widthRatio = 0;
				img.css({'width':'100%', 'height':'auto', 'margin-top':0-heightRatio/2+'px'});
			} else {
				img.css('height','100%');
				imgWidth/=heightRatio;
				img.css('width',imgWidth);
				widthRatio = imgWidth - itemWidth;
				heightRatio = 0;
				img.css({'height':'100%', 'width':'auto', 'margin-left':0-widthRatio/2+'px'});
			}
		});

		$this.isotope({
			itemSelector: '.frbe_grid_item_wrapper',
			masonry: {
				columnWidth: 1

			}
		});
		$this.isotope('reLayout');
	}

	$.fn.frbeProductsGridResize = function(){

		

		var itemWidth,itemHeight, img, imgHeight, imgWidth, widthRatio, heightRatio, wrapperWidth, itemCount, noTopPaddingItems;
		
		

		$(this).removeClass('frbe_grid_no_top_padding');

		$(this).find('.frbe_grid_item_wrapper').each(function(){

			wrapperWidth = $(this).closest('.fbuilder_module').width();
			itemCount = 0;
		
				$(this).removeClass('frbe_grid_item_760 frbe_grid_item_455');
				if (wrapperWidth<760 && wrapperWidth>455) {
					noTopPaddingItems=2;
					$(this).addClass('frbe_grid_item_760');
				}
				else if (wrapperWidth<=455) {
					noTopPaddingItems=1;
					$(this).addClass('frbe_grid_item_455');
				}
				else {
					noTopPaddingItems=3;
				}



			itemWidth = $(this).outerWidth(true);
			
			if (itemCount<noTopPaddingItems)
				$(this).addClass('frbe_grid_no_top_padding');

			itemCount++;


			if ($(this).hasClass('frbe_grid_item_single')) {
				itemHeight = itemWidth/2;
			} else if ($(this).hasClass('frbe_grid_item_double')) {
				itemHeight = itemWidth+6;
			} else {
				itemHeight = itemWidth;
			}
			img = $(this).find('img');

			imgHeight = img.attr('height');
			imgWidth = img.attr('width');
			
			widthRatio = imgWidth/itemWidth;
			heightRatio = imgHeight/itemHeight;

			$(this).height(itemHeight);
			
			
			if (widthRatio<heightRatio) {
				img.css('width','100%');
				imgHeight/=widthRatio;
				img.css('height',imgHeight);
				heightRatio = imgHeight - itemHeight;
				widthRatio = 0;
				img.css({'width':'100%', 'height':'auto', 'margin-top':0-heightRatio/2+'px'});
			} else {
				img.css('height','100%');
				imgWidth/=heightRatio;
				img.css('width',imgWidth);
				widthRatio = imgWidth - itemWidth;
				heightRatio = 0;
				img.css({'height':'100%', 'width':'auto', 'margin-left':0-widthRatio/2+'px'});
			}
			
			
		});
		
	}


// 			products 

	$.fn.frbeProductListRefresh = function(){
		var $this = $(this);
		var cart_url = $this.attr('data-frbe_cart_url');
		var aspect_ratio = $this.attr('data-frbe_aspect_ratio');

		var width, height, imgHeight, imgWidth, origImgWidth, origImgHeight;



		$this.find('ul.products > li').each(function(){

			$(this).find('a.add_to_cart_button').html('<i class="products-shop2"></i><span><span>ADD TO CART</span></span>');
			$('<div class="frbe_product_list_added_to_cart"><a href="'+cart_url+'"><i class="frb_icon na na-svg179"></i></a></div>').insertAfter($(this).find('a.add_to_cart_button'));


			width = $(this).width();
			origImgWidth = parseInt($(this).find('img').attr('width')); 
			origImgHeight = parseInt($(this).find('img').attr('height')); 
			imgHeight = origImgHeight/origImgWidth * width;

			if (aspect_ratio == '1:1.5') 
				height = width*1.5;
			else if (aspect_ratio == '16:9')
				height = width * 0.5625;
			else 
				height = width;

			if ($(this).find('.frbe_product_list_image').length==0) {
				$(this).find('img').wrap('<div class="frbe_product_list_image"></div>');
			}
			$(this).find('.frbe_product_list_image').width('100%').height(height);

			frbCpsImageCentering($(this).find('.frbe_product_list_image'), $(this).find('.frbe_product_list_image img'));
			
		});

		 $('body').append('<style>#'+$this.attr('id')+' a.add_to_cart_button { top:'+(height-41)+'px; }');
		 $(this).find('.frbe_product_list_added_to_cart').css({'top' : height-83});

		$(this).find('.frbe_product_list_image').hover(function(){
			$(this).parent().next().addClass('frbe_product_hover');
		}, function(){

			$(this).parent().next().removeClass('frbe_product_hover');
		});

		$(this).find('.frbe_product_list_added_to_cart').click(function(e){
			e.stopPropagation();
			var pHref = $(this).children('a').attr('href');
			window.location.href = pHref;
		});

		$(this).find('.frbe_product_list_added_to_cart > a').click(function(e){
			e.preventDefault();
			
		});

		$(this).find('.add_to_cart_button').click(function(){
			$(this).siblings('.frbe_product_list_added_to_cart').css('display', 'block');
		});

		$(this).find('ul.products > li > a:not(".add_to_cart_button")').click(function(e){
			e.preventDefault();
		});
		$(this).find('ul.products > li > a:not(".add_to_cart_button") .frbe_product_list_image').click(function(e){
			var href = $(this).closest('a').attr('href');
			window.location.href = href;
		});
	}

	

	$.fn.frbeProductListResize  = function(){ 

		var columns = $(this).attr('data-frbe_columns');
		var frbe_module_wrapper_width = $(this).closest('.fbuilder_module').width();

		$(this).removeClass('frbe_products_list_100 frbe_products_list_50 frbe_products_list_33');

		if (frbe_module_wrapper_width < 370 && columns>1) {
			$(this).addClass('frbe_products_list_100');
		} else if (frbe_module_wrapper_width < 650 && columns>2) {
			$(this).addClass('frbe_products_list_50');
		} else if (frbe_module_wrapper_width < 800 && columns>3) {
			$(this).addClass('frbe_products_list_33');
		}

	$(this).frbeProductListRefresh();

	}


})(jQuery);