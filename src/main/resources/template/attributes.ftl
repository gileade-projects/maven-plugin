
<#list attributes as attribute>
	<#if "${attribute.type}" == "GumgaAddress">
    @Columns(columns = {
    @Column(name = "${attribute.name}_zip_code"),
    @Column(name = "${attribute.name}_premisse_type"),
    @Column(name = "${attribute.name}_premisse"),
    @Column(name = "${attribute.name}_number"),
    @Column(name = "${attribute.name}_information"),
    @Column(name = "${attribute.name}_neighbourhood"),
    @Column(name = "${attribute.name}_localization"),
    @Column(name = "${attribute.name}_state"),
    @Column(name = "${attribute.name}_country"),
    @Column(name = "${attribute.name}_latitude"),
    @Column(name = "${attribute.name}_longitude"),
    @Column(name = "${attribute.name}_formal_code"),
    @Column(name = "${attribute.name}_state_code")
    })
	</#if>
	<#if "${attribute.type}" == "GumgaFile" || "${attribute.type}" == "GumgaImage">
    @Columns(columns = {
    @Column(name = "${attribute.name}_name"),
    @Column(name = "${attribute.name}_size"),
    @Column(name = "${attribute.name}_type"),
    @Column(name = "${attribute.name}_bytes",length = 50*1024*1024)
    })
	</#if>
	<#if "${attribute.type}" == "GumgaGeoLocation">
    @Columns(columns = {
    @Column(name = "${attribute.name}_latitude"),
    @Column(name = "${attribute.name}_longitude")
    })
	</#if>
	<#if "${attribute.type}" == "GumgaTime">
    @Columns(columns = {
    @Column(name = "${attribute.name}_hour"),
    @Column(name = "${attribute.name}_minute"),
    @Column(name = "${attribute.name}_second")
    })
	</#if>
	<#if "${attribute.required?c}" == "true">
    @NotNull
	</#if>
	<#if "${attribute.oneToMany?c}" == "true">
    @OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)
	</#if>
	<#if "${attribute.oneToOne?c}" == "true">
    @OneToOne
	</#if>
	<#if "${attribute.manyToOne?c}" == "true">
    @ManyToOne
	</#if>
	<#if "${attribute.manyToMany?c}" == "true">
    @ManyToMany
	</#if>
	<#if "${attribute.enumString?c}" == "true">
    @Enumerated(EnumType.STRING)
	</#if>
	<#if "${attribute.enumOrdinal?c}" == "true">
    @Enumerated(EnumType.ORDINAL)
	</#if>
	<#if "${attribute.type}" != "GumgaAddress" &&
	"${attribute.type}" != "GumgaFile" &&
	"${attribute.type}" != "GumgaImage" &&
	"${attribute.type}" != "GumgaGeoLocation" &&
	"${attribute.type}" != "GumgaTime" &&
	"${attribute.oneToMany?c}" != "true" &&
	"${attribute.oneToOne?c}" != "true" &&
	"${attribute.manyToOne?c}" != "true" &&
	"${attribute.manyToMany?c}" != "true">
    @Column(name = "${attribute.name}")
	</#if>
	private ${attribute.type} ${attribute.name};
</#list>