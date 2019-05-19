﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.product.db.ProductBean"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table.style_Table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
table.style_Table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function gotolist(){
      var x = document.getElementById("selectcategory").value;
      if(x == "allview"){
         window.location.href = "ProductListAction.po";
      }else{
         window.location.href = "ProductCatelistAction.po?category="+x;   
      }
      
   }
</script>
</head>
<body>

<div id="container">
      <div><jsp:include page="/header.jsp"></jsp:include></div>
<%
   List<ProductBean> beans = (List<ProductBean>)session.getAttribute("productbean");
   List<String> cates = (List<String>)session.getAttribute("productcate");
%>
<br><br><br><br><br><br>
<div>
   <h3>카테고리</h3>
      <select name = "selectcategory" id = "selectcategory" onchange = "selectcategory()" >
         <option disabled selected>Choose the Category</option>
         <option value = "allview">Display all of Product</option>
      <%for(int i =0;i<cates.size();i++){ %>
         <option value="<%=cates.get(i)%>"><%=cates.get(i)%></option>
      <%} %>
      </select>
   <a href = "javascript:gotolist()"><button>확인</button></a>
</div>
<div style="font-size:30pt;font-weight: bold" align="center"><%=request.getParameter("cate") %>&nbsp;상품 목록</div>
<br><br>
<table class="style_Table" border="0" align="center">

   <tr align="center" style=font-size:17pt;>
      <td></td>
      <td>번호</td>
      <td>코드</td>
      <td>상품이름</td>
      <td>가격</td>
      <td>재고</td>
      <td>상품등록일</td>
   </tr>
   <tr> <!--체크박스, 전체선택-->
      <div class="allCheck">
            <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
           <script>
              $("#allCheck").click(function(){
                 var chk = $("#allCheck").prop("checked");
                 if(chk){
                    $(".chBox").prop("checked", true);
                 }else{
                    $(".chBox").prop("checked", false);
                 }
              });
           </script>
        </div>
           
        <div class="delBtn">
           <button type="button" class="selectDelete_btn">선택 삭제</button>
           <script>
              $(".selectDelete_btn").click(function(){
                 var confirm_val = confirm("정말 삭제 하시겠습니까?");
                 
                 if(confirm_val){
                    var checkArr = new Array();
                    
                    $("input[class='chBox']:checked").each(function(){
                       checkArr.push($(this).attr("data-proNum"));
                    });
                    
                    location.href = "ProductDeleteAction.po?code="+checkArr;
                    
                 }
              });
           </script>
            <input type="hidden" id = "code" name = "code" readonly/>
        </div>
   </tr>
   <%int i=1; %>
   <%for(ProductBean bean : beans){ %>
   <tr align="center" style="font-size:15pt" class = "proInfo">
      <td> <!--항목마다 체크박스를 만듬-->
         <div class="checkBox">
               <input type="checkbox" name="chBox" class="chBox" data-proNum="<%=bean.getProduct_code()%>" />
             <script>
              $(".chBox").click(function(){
                 $("#allCheck").prop("checked",false);
              });
           </script>
          </div>
      </td>
      <td><%=i++%></td>
      <td><a href="ProductDetailAction.po?code=<%=bean.getProduct_code()%>">
            <%=bean.getProduct_code() %>
           </a></td>
      <td><%=bean.getProduct_name() %></td>
      <td><%=bean.getProduct_count() %></td>
      <td><%=bean.getProduct_price() %></td>
      <td><%=bean.getProduct_date() %></td>
      <td> <!--물품삭제버튼-->
         <div class= "delete">
            <button type = "button" class = "delete_btn" data-proNum="<%=bean.getProduct_code()%>">삭제</button>   
         </div>
      </td>
   </tr>
   <%} %>
   
</table><br>

<div align="center">
<a href = "ProductAddForm.po"><button  style="font-size:15pt">등록</button></a>
<input type="button" value = "삭제" onclick = "delete" style="font-size:15pt" />
</div>
</div>

</body>


 </html>