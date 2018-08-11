class Rest{
	
	constructor(url){
		this.url = url;     // api url
		
	}
	
	// getList
	list(params, callback){
		$.get(this.url+'?'+params,callback);
    }
	
	// getOne
	get(id,callback){
		$.get(this.url+'/'+id,callback);
	}
	

	// insert
	create(data,callback){
		$.ajax({
			
			url: this.url,
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: callback
		});
	}
	
	
	// update
	update(data,callback){
		return $.ajax({
			url: this.url,
			type: 'put',
			contentType: 'application/json',
			data: JSON.stringify(data),
			success: callback
		});
	}
	
	// delete
	remove(id, callback){
		return $.ajax({
			url: this.url+'/'+id,
			type: 'delete',
			success: callback
		});
	}
	
}