
$(function(){
//	putParentPageHeight();
});

function calcPageHeight(doc) {
    var cHeight = Math.max(doc.body.clientHeight, doc.documentElement.clientHeight);
    var sHeight = Math.max(doc.body.scrollHeight, doc.documentElement.scrollHeight);
    var height  = Math.max(cHeight, sHeight);
    return height;
  }

function putParentPageHeight() {
    var height = calcPageHeight(document)+100;
    alert(height);
    parent.document.getElementById( 'contentFrame' ).style.height = height +  'px';     //contentFrame 父页面id
  }

  window.onload =  function () {
    var height = calcPageHeight(document);
    parent.document.getElementById( 'contentFrame' ).style.height = height +  'px';     //contentFrame 父页面id
  }