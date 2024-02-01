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
});
 
