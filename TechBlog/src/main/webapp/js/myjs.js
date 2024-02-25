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
 
 function getAllPost(catId,temp){
	 $('#loader').show();
	 $('#post-container').hide();
	 
	 $('.c-link').removeClass("active");
	 
	 	$.ajax({
		url:"load_post.jsp",
	   data:{cid: catId},
	success:function(data){
		console.log(data);
		$('#loader').hide();
		$('#post-container').show();
	    $('#post-container').html(data);
	    $(temp).addClass("active");
		
	}
		
	});
 }
 
$().ready(function(){ 
 /* loading post */
 let ref = $('.c-link')[0];	
getAllPost(0,ref);
});

	
	
function doLike(pid,uid){
		console.log(pid,uid)
		const obj = {
			pid : pid,
			uid : uid,
	   operation: 'like'
		}
		
$.ajax({
		url:"Like",
		type:"POST",
	    data:obj,
	 success:function(data){
		console.log(data);
		if(data.trim() === 'true'){
			let c = $('.like-count').html();
			c++;
			$('.like-count').html(c);
		}
	},
	error:function(error){
		console.log(error)
	}
		
	});
}