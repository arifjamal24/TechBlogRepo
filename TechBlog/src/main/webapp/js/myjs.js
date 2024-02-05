$().ready(function(){
let editStatus = false;	

$('#edit-profile-btn').click(function(){
	/* toggle edit button */	
	if(editStatus === false){
	$('#profile-details').hide();
	$('#profile-edit').show();
	$(this).text("back");
	editStatus = true;
	}
	else{
	$('#profile-details').show();
	$('#profile-edit').hide();
	$(this).text("Edit");
	editStatus = false;
	}
	});
	
	
	/* add new post js */
	$('#add-post-form').on('submit',function(event){
		event.preventDefault();
		console.log("clickrf");
		let form = new FormData(this);
		
		$.ajax({			
			url:'newPost',
		   type:'POST',
		   data:form,
		success: function(data){
			console.log(data);
			if(data.trim() == 'done'){
				swal({
    	    		  icon: "success",
    	    		  title:"saved successfully"	  
    	    		}).then((value) => { window.location = "profile.jsp"});
			}
			else { swal(data); }
			
			
		},
		  error:function(error){ swal(data); },
	processData:false,
	contentType:false
			
		});
		
		
		
	});
	
	
	
	
	
	
});
 
