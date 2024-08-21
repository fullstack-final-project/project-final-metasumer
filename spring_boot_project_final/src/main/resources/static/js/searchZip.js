 
 $(document).ready(function() {
  	$('#searchZipBtn').on('click', function(){
 		new daum.Postcode({
			oncomplete:function(data){
				let address1 = "";
				
				if(data.userSelectedType == 'R'){
					address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
				} else {
					address1 = data.jibunAddress;				
				}
				document.getElementById('memZipcode').value = data.zonecode;
				document.getElementById('memAddress1').value = address1;
				
				let address2 = document.getElementById('memAddress2');
				address2.value = '';
				address2.focus();
			} 		
 		}).open(); 	
  	});
 });
 