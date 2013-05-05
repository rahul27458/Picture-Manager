function textimage(id)
{
    
	 var text=document.getElementsByName('comment_text')[id].value;
	text=text.trim();

	if(text=="" || text==" ")
		{alert("Textbox is empty");
			return false;
		
		}

return true;
}

function textvideo(video_comment_id)
{
	var comment_text=document.getElementsByName('v_comment_text')[video_comment_id].value;
	
	comment_text=comment_text.trim();

	if(comment_text=="" || comment_text==" ")
		{alert("Textbox is empty");
		  return false;
		}
	return true;
}