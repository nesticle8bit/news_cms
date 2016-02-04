En el Model de Post agregar
	[DisplayFormat(DataFormatString = "{0:MMMM dd, yyyy}")]
    public System.DateTime Time { get; set; }
	//Este es el contenedor de los Tags del View Create
	public string Tags { get; set; }

En el Model de Configuration:
	public int Id { get; set; }
    [Required]
    [Display(Name="Website Title")]
    public string WebsiteTitle { get; set; }
    [Required]
    public string Slogan { get; set; }
    [Required]
    public string Url { get; set; }
    [AllowHtml]
    [Display(Name = "Ads 300x250")]
    public string Ads_300 { get; set; }
    [AllowHtml]
    [Display(Name = "Ads 970x90")]
    public string Ads_970 { get; set; }
    [AllowHtml]
    [Display(Name = "Ads 728x90")]
    public string Ads_728 { get; set; }
    [Required]
    public string Email { get; set; }


EntityDataModel
newsSystem_dbEntities