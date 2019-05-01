 var jumin = document.getElementById("jumin");
 var jumin2 = document.getElementById("jumin2");

 var arrNum1 = new Array(); 
 var arrNum2 = new Array(); 

function call() {
       var re = /^[a-zA-Z0-9]{4,12}$/ 
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      

       var id = document.getElementById("id");
       var pw = document.getElementById("pw");
       var email = document.getElementById("email");
       

       // ------------ 이메일 까지 -----------

       if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }

       if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }

       if(acount.pw.value != acount.checkpw.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           acount.checkpw.value = "";
           acount.checkpw.focus();
           return false;
       }

       if(email.value=="") {
           alert("이메일을 입력해 주세요");
           email.focus();
           return false;
       }

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }

       if(acount.name.value=="") {
           alert("이름을 입력해 주세요");
           acount.name.focus();
           return false;
       }

       // -------------- 주민번호 -------------

       for (var i=0; i<jumin.value.length; i++) {
           arrNum1[i] = jumin.value.charAt(i);
       } 

       for (var i=0; i<jumin2.value.length; i++) {
           arrNum2[i] = jumin2.value.charAt(i);
       } 

       var tempSum=0;

       for (var i=0; i<jumin.value.length; i++) {
           tempSum += arrNum1[i] * (2+i);
       } 

       for (var i=0; i<jumin2.value.length-1; i++) {
           if(i>=2) {
               tempSum += arrNum2[i] * i;
           }
           else {
               tempSum += arrNum2[i] * (8+i);
           }
       } 

       if((11-(tempSum%11))%10!=arrNum2[6]) {
           alert("올바른 주민번호가 아닙니다.");
           jumin.value = "";
           jumin2.value = "";
           jumin.focus();
           return false;
       }
      // ------------ 생일 자동 등록 -----------
          
       // 관심분야, 자기소개 미입력시 하라는 메시지 출력
       if(acount.inter[0].checked==false &&
           acount.inter[1].checked==false &&
           acount.inter[2].checked==false &&
           acount.inter[3].checked==false &&
           acount.inter[4].checked==false) {
           alert("관심분야를 골라주세요");
           return false;
       }

       if(acount.intro.value=="") {
           alert("자기소개를 적어주세요");
           acount.intro.focus();
           return false;
       }
       
       alert("회원가입이 완료되었습니다.");
   }

   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       
   }
   
   function birth(){
	   
	   if(arrNum2[0]==1 || arrNum2[0]==2) {
           var y = parseInt(jumin.value.substring(0,2));
           var m = parseInt(jumin.value.substring(2,4));
           var d = parseInt(jumin.value.substring(4,6));
           acount.year.value = 1900 + y;
           acount.month.value = m;
           acount.day.value = d;
       }
       else if(arrNum2[0]==3 || arrNum2[0]==4) {
           var y = parseInt(jumin.value.substring(0,2));
           var m = parseInt(jumin.value.substring(2,4));
           var d = parseInt(jumin.value.substring(4,6));
           acount.year.value == 2000 + y;
           acount.month.value = m;
           acount.day.value = d;
       }
   }
   