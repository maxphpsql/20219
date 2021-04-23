$(document).ready(function() 
{
	// 1 - Méthode load	
	$("#button1").click(function() 
	{
		$("#div1").load("contenu.php");
	});

	// 2 - Méthode get
	$("#button2").click(function() 
	{
		$.get("contenu.php", function() 
		{
			$("#div1").html();
		});
		
	});

	// 3 - Méthode low level (ajax)
	$("#button3").click(function() 
	{
		$.ajax({
			url: "contenu.php", 
			success: function(data) 
			{
				$("#div1").html(data);
			},
		});		
	});
	
	// 4 - Méthode Post
	$("#button4").click(function() 
	{		
		$.post({		
			url: "post.php", 
			data: { id:1 },
			success: function(resultat) 
			{
				$("#div1").html(resultat);
			}
		});			
	});
		
	// 5 - Json (fichier)
	$("#button5").click(function() 
	{			
		$.getJSON('liens.json', function(data) 
		{
			 $('#div1').html(data.id+" | "+data.titre+" | "+data.webmaster);            
        });	
	});
		
	$("#button6").click(function() 
	{		
		$.post({
			url: "post_json.php", 
			dataType: "json",
			success: function(resultat) 
			{			
				var contenu = '';
				
				$.each(resultat, function(key, val) 
				{
		             contenu += val.id+" | "+val.titre+" | "+val.webmaster+"<br>";
		        });
		        								
				$("#div1").html(contenu);
			}
		});		
	});		
});