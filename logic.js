$(document).ready(function(){
        var drugPosition = 0;
	  $("#getDetails").click(function(){
		ajaxPatientDetials();  
	  });	  
	  $("#addDrug").click(function(){                   
            $("#totalNumber").val(drugPosition);
                if(checkDrugDetaial() == false){
                   return;
                }
		else{                      
                    var x = '<tr>'+
                    '<td><input type="hidden" value="'+$("#drugId").val()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelDrugId" name="prescriptionDrugRel['+drugPosition+'].presDrugRelDrugId" "/>'+
                    '<input value="'+$("#drugId option:selected").text()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelDrugName" name="prescriptionDrugRel['+drugPosition+'].presDrugRelDrugName" class="form-control"/></td>'+
                    '<td><input value="'+$("#drugDosage").val()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelDosage"  name="prescriptionDrugRel['+drugPosition+'].presDrugRelDosage" class="form-control"/></td>'+
                    '<td><input value="'+$("#drugFrequency").val()+'" id="prescriptionDrugRel'+drugPosition+'.presDrugRelFrequency"  name="prescriptionDrugRel['+drugPosition+'].presDrugRelFrequency" class="form-control"/></td>'+
                    '</tr>';
                    $("#drugDivison_medicines_body").append(x)
                    drugPosition++;	  
                }
              //show the generate prescription   
	  });
          $("#chemistGetPatientDetial").submit(function(){
		return chemistPatientDetialentry();
	  });
          $("#save").click(function(){
              loginValidation();
          });
});


    function ajaxPatientDetials(){
        var arogyaId = $("#patientau360Id").val();
        if(arogyaId == ''){
            $("#patientau360Id").addClass("error_err");
            $("#patientDetailsDiv").addClass("hidden");
        	alert("Patient AUID cannot be blank");
        }
        else{ 
            $("#patientau360Id").removeClass("error_err");
            $("#patientau360Id").addClass("success_suc");
            $("#patientDetailsDiv").removeClass("hidden");
	    $.get("./selectPatient.html?arogyaId="+arogyaId+"&",function(data,status){
	       var patientid = $(data).find('#patient_id').text();
	       if (patientid != ''){
	    	   $("#patientDetailsDiv").html(data);
	       }else{
	    	   alert("Invalid Patient AUID");
	    	   $("#patientDetailsDiv").html('&nbsp;');
	       }
	      
	    });
        }
    }    
   
    function checkDrugDetaial(){
       var flag = true;
       var drugList = $('#drugId').val();
       var drugDosage = $('#drugDosage').val();
       var drugFrequency = $("#drugFrequency").val();
       
       if(drugList == '' && $('#drugId option:selected').text()==="choose"){
           alert("false");
           $('#drugId').addClass("error_err");
           flag = false;
       }
       else{
           $('#drugId').removeClass("error_err");
           $('#drugId').addClass("success_suc");
       }
       
       if(drugDosage == ''  )
       {  
           $('#drugDosage').addClass("error_err");
           flag = false;
       }
       else{
            $('#drugDosage').removeClass("error_err");
           $('#drugDosage').addClass("success_suc");
          
       }
       
        if(drugFrequency == ''){
           
           $('#drugFrequency').addClass("error_err");
           flag = false;
       }
       else{
           $('#drugFrequency').removeClass("error_err");
          $('#drugFrequency').addClass("success_suc");
       }
       
       return flag;
    }
    function chemistPatientDetialentry(){
        var flag=true;
        var patientAuid = $('#au360id').val();
        var upnId = $('#upn').val();
        
       if(patientAuid == '' )
       {  
           $('#au360id').addClass("error_err");
           flag = false;
       }
       else{
            $('#au360id').removeClass("error_err");
           $('#au360id').addClass("success_suc");         
       }
       
       if(upnId == '' )
       {  
           $('#upn').addClass("error_err");
           flag = false;
       }
       else{
            $('#upn').removeClass("error_err");
           $('#upn').addClass("success_suc");         
       }
       
        return flag;
    }
    function loginValidation(){
        var flag = true;
        var auid = $('au360id').val();
        var passwd = $('password').val();
        
        if(auid==''){
            $('au360id').addClass('error_err');
            flag=false;
        }
        else{
            $('au360id').removeClass('error_err');
            $('au360id').addClass('success_suc');
        }
        
        if(passwd==''){
            $('password').addClass('error_err');
            flag = false;
        }
        else{
            $('password').removeClass('error_err');
            $('password').addClass('success_suc');
        }
        return flag;
    }
