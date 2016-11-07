<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.11.1/typeahead.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/corejs-typeahead/0.11.1/bloodhound.js"></script>
<script>
/**
* Keyword Form 추가를 위한 Javascript
* @author HyeYoungOh
*/
function addKeywordForm() {

  /**
   * 이 부분에는 추가될 부분의 div 이름을 넣으시면 됩니당
   */  
   var addedFormDiv = document.getElementById("addedKeyword");

   /**
     * str로 선언한 부분에 원하는 내용에 대해서 넣어주시면 됩니다.
    */ 
   var str = '<input type="text" id="image_keyword'+count+'" name="image_keyword'+count+'" value="" maxlength="100" size="100"/>'  + 
  '<a onClick="delKeywordForm('+count+')"/><img src="${IMG}/menu/minus.gif" title="Form 제거"></a>';
  
	if (count <= 5) {
  var addedDiv = document.createElement("div"); // 폼 생성
   addedDiv.setAttribute("id", "keyword_Frm"+count);
   addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
   addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입

	count++;
	} else {
		alert("Keyword는 5개까지 입력하실 수 있습니다.");
	}
}
/**
* Keyword Form을 삭제를 위한 Javascript
* @author HyeYoungOh
*/
function delKeywordForm(thisCount){

  /**
   * 이 부분에는 추가될 부분의 div 이름을 넣으시면 됩니당
   */   
   var addedFormDiv = document.getElementById("addedKeyword");

   if(count > 1){
       var thisDiv = document.getElementById("keyword_Frm"+thisCount);
        // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
       addedFormDiv.removeChild(thisDiv); // 폼 삭제 
   }else{
       document.addedFormDiv.reset(); // 폼 내용 삭제
   }

   count --;
}
</script>
</head>
<body>
<input type="text" id="image_keyword1" name="image_keyword1" value="" maxlength="100" size="100"/>
<a onClick="addKeywordForm()"><img style="vertical-align:middle;" src="${IMG}/menu/plus.gif" title="keyword 추가" /></a>
<div id="addedKeyword"></div>
</body>
</html>