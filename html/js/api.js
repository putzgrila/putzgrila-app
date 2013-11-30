var Storage = 
{
	put : function(key, value)
	{
		localStorage.setItem(key, value);
	},

	get : function(key)
	{
		localStorage.getItem(key);
	}
};

var NativeView = 
{
	openFacebookLogin: function()
	{
		$.ajax({
			type: "GET", 
			cache: false, 
			url: "tbk://openFacebookLogin"
		});
	},
};

var HTMLView =
{
	openActivity: function()
	{
		location.href = "atividade.html";
	}
};