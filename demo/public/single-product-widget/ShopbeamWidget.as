﻿package {

	var prod_x:int = 0;
	
	function onMouseOver(event:MouseEvent):void {
      fadeIn(event.currentTarget.parent.listPrice);
      if (event.currentTarget.parent.listPrice.text !== product.salePrice.text) {
        fadeIn(event.currentTarget.parent.strikeThrough);
        fadeIn(event.currentTarget.parent.salePrice);
      }

      fadeIn(event.currentTarget.parent.brandName);
      fadeIn(event.currentTarget.parent.productName);
      fadeIn(event.currentTarget.parent.hoverMovie.bagActive);
      fadeOut(event.currentTarget.parent.hoverMovie.bagInactive);
      tweenAlpha(event.currentTarget.parent.backdrop, 0.6);
      tweenTo(event.currentTarget.parent.hoverMovie, 'x', SHOP_HERE_TWEEN_X);		
	}
	
	
	function onMouseOut(event:MouseEvent):void {
	var productDat;
	var index;
	
	  widgetData = JSON.parse(data);
	  var dollarFormatter:CurrencyFormatter = new CurrencyFormatter('usd');
		  log('swf received data for product index ' + index);
		
	  if(!index){
		  product.brandName.text = widgetData.initialProduct.brandName;
		  product.productName.text = widgetData.initialProduct.name;

		  product.listPrice.text = dollarFormatter.format((widgetData.initialVariant.listPrice / 100), true);
		  //strikeThrough.width ...
		  product.salePrice.text = dollarFormatter.format((widgetData.initialVariant.salePrice / 100), true);			
	  } else {
		  log("new prod");
          var spr:Sprite = new Sprite();
		  var ldrImg:Loader = new Loader();
		  ldrImg.load(new URLRequest(widgetData.initialVariant.images[0].url));
		  spr.addChild(ldrImg);
		  spr.name = "image";
		  var prod:MovieClip = new Product();
		  prod.addChild(spr);
		  prod.getChildByName("image").x = 0;
		  prod.getChildByName("image").y = 0;
		  prod.setChildIndex(spr, 0);
		  
		  prod_x += 300;
		  prod.brandName.text = widgetData.initialProduct.brandName;
		  prod.productName.text = widgetData.initialProduct.name;

		  prod.listPrice.text = dollarFormatter.format((widgetData.initialVariant.listPrice / 100), true);
		  //strikeThrough.width ...
		  prod.salePrice.text = dollarFormatter.format((widgetData.initialVariant.salePrice / 100), true);
		  prod.hoverArea.addEventListener(MouseEvent.CLICK, loaderClickHandler);
		  prod.hoverArea.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		  prod.hoverArea.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
          prod.hoverArea.buttonMode = true;
		  prod.hoverArea.useHandCursor = true;		  
		  prod.x += prod_x;
		  prod.y = 0;
		  addChild(prod);
	  }

	