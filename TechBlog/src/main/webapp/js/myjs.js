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
		console.log("respponse dsuccc");
		let form = new FormData(this);
		
		$.ajax({
			
			url:"newPost",
		   type:'POST',
		   data:form,
		success: function(data){
			console.log("respponse dsuccc");
			
		},
		  error:function(error){},
	processData:false,
	contentType:false
			
		});
		
		
		
	});
	
	
	
	
	
	
});
 
