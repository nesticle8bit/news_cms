En el Model de Post agregar
	[DisplayFormat(DataFormatString = "{0:MMMM dd, yyyy}")]
    public System.DateTime Time { get; set; }
	//Este es el contenedor de los Tags del View Create
	public string Tags { get; set; }

En el Model de Configuration:
	[AllowHtml]
    public string Ads_300 { get; set; }
    [AllowHtml]
    public string Ads_970 { get; set; }
    [AllowHtml]
    public string Ads_728 { get; set; }


EntityDataModel
newsSystem_dbEntities