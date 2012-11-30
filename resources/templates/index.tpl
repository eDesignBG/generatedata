<!DOCTYPE html>
<html>
<head>
	<title>{$L.title}</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="{$L.meta_description}" />
	<meta name="keywords" content="{$L.meta_keywords}" />
	<link rel="stylesheet" type="text/css" href="resources/themes/{$theme}/compiled/styles.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/smoothness/jquery-ui-1.8.23.custom.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/chosen/chosen.css" />
	<link rel="stylesheet" type="text/css" href="resources/libs/codemirror/lib/codemirror.css" />
	<script src="resources/libs/codemirror/lib/codemirror.js"></script>
	<script src="resources/scripts/libs/jquery.js"></script>
	<script src="resources/scripts/libs/chosen.jquery.min.js"></script>
	<script src="resources/scripts/libs/require.js"></script>
	<script src="resources/scripts/requireConfig.js"></script>
	{$cssIncludes}
	{$codeMirrorIncludes}
</head>
<body>
	<header>
		<nav>
			{if $settings.employUserAccounts == "yes"}<a href="#" id="gdUserAccountLink">Your Account</a> |{/if}
			<a href="http://www.generatedata.com">{$L.website}</a> |
			<a href="http://www.generatedata.com/forums/">{$L.forums}</a> <span class="gdHideNoJS">|</span>
			{language_dropdown nameId="gdSelectLanguage"}
		</nav>
	</header>
	<nav id="gdTabs">
		<span id="gdProcessingIcon"></span>
		<ul>
			<li id="gdTab1" class="gdSelected">{$L.generate}</li>
			{if $settings.employUserAccounts == "yes"}<li id="gdTab2" class="gdHideNoJS">{$L.accounts}</li>{/if}
			<li id="gdTab3" class="gdHideNoJS">{$L.settings}</li>
			<li id="gdTab4" class="gdHideNoJS">{$L.help}</li>
		</ul>
	</nav>
	<section>
		<noscript><p>{$L.no_js}</p></noscript>
		<div id="gdContent" class="gdHideNoJS">
			<ul class="gdTabContent">
				<li id="gdTab1Content">{include file="generate.tab1.tpl"}</li>
				{if $settings.employUserAccounts == "yes"}<li id="gdTab2Content" style="display:none">{include file="generate.tab2.tpl"}</li>{/if}
				<li id="gdTab3Content" style="display:none">{include file="generate.tab3.tpl"}</li>
				<li id="gdTab4Content" style="display:none">{include file="generate.tab4.tpl"}</li>
			</ul>
		</div>
	</section>

	<footer>
		<ul>
			<li><span>{$L.version} {$version} - <a href="https://github.com/benkeen/generatedata" target="_blank">github</a></span></li>
			<li><span><a href="docs/">Developer Doc</a></span></li>
		</ul>
	</footer>

	<script>
	require([
		"manager",
		"generator",
		"accounts",
		"io",
		{$exportTypeJSModules},
		{$dataTypeJSModules},
		"pageinit"
	], function(manager) { manager.start(); });
	</script>

</body>
</html>