$(document).ready(function() 
{
	$("#regions").change(function() 
	{	
		var region_id = $(this).val();
				
		
		$.post({
			url: "post_json.php", 
			data: { id: region_id },
			dataType: "json",
			success: function(toto) 
			{			
				var contenu = '';
				
				$.each(toto, function(key, val) 
				{				
		            contenu += "<option value='"+val.dep_id+"'>"+val.dep_id+" - "+val.dep_nom+"</option>\n";
		                  
		        });			
							
				$("#departements").html(contenu);
			},			
		});		
	});		
});