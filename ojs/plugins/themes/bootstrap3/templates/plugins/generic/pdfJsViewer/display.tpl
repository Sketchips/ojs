{**
 * plugins/themes/bootstrap3/templates/plugins/generic/pdfJsViewer/display.tpl
 *
 * Custom PDF viewer template for Bootstrap3 theme
 * Override default pdfJsViewer template with fixed header styling
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>{translate key="article.pageTitle" title=$title|escape}</title>

	{load_header context="frontend" headers=$headers}
	{load_stylesheet context="frontend" stylesheets=$stylesheets}
	{load_script context="frontend" scripts=$scripts}
	
	<style>
		/* PDF Viewer - Responsive & Proportional Layout */
		* {
			box-sizing: border-box;
		}
		
		body {
			margin: 0;
			padding: 0;
			overflow: hidden;
			font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
		}
		
		/* Header - Responsive with proper spacing */
		.header_view {
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			height: 70px;
			background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
			display: flex;
			align-items: center;
			justify-content: space-between;
			padding: 0 clamp(15px, 3vw, 30px);
			z-index: 10000;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
			gap: clamp(10px, 2vw, 20px);
		}

		/* Buttons - Responsive sizing */
		.header_view .return,
		.header_view .download {
			display: inline-flex;
			align-items: center;
			justify-content: center;
			padding: clamp(8px, 1.5vw, 12px) clamp(16px, 2.5vw, 24px);
			background-color: rgba(255, 255, 255, 0.1);
			color: white !important;
			text-decoration: none;
			border-radius: 6px;
			transition: all 0.3s ease;
			font-size: clamp(13px, 1.8vw, 15px);
			font-weight: 500;
			border: 2px solid transparent;
			white-space: nowrap;
			min-width: fit-content;
		}

		.header_view .return:hover,
		.header_view .download:hover {
			background-color: #1abc9c;
			border-color: rgba(255, 255, 255, 0.3);
			transform: translateY(-2px);
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		}

		.header_view .return:active,
		.header_view .download:active {
			transform: translateY(0);
		}

		.header_view .return::before {
			content: "←";
			margin-right: clamp(6px, 1vw, 10px);
			font-size: clamp(16px, 2vw, 20px);
			font-weight: bold;
		}

		.header_view .download .label {
			margin-right: clamp(6px, 1vw, 8px);
		}

		.header_view .download::after {
			content: "↓";
			margin-left: clamp(4px, 0.8vw, 8px);
			font-size: clamp(16px, 2vw, 20px);
			font-weight: bold;
		}

		/* Title - Responsive with proper ellipsis */
		.header_view .title {
			flex: 1;
			text-align: center;
			color: white;
			font-size: clamp(16px, 2.2vw, 20px);
			font-weight: 600;
			margin: 0;
			padding: 0 clamp(10px, 2vw, 20px);
			text-decoration: none;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
			min-width: 0; /* Important for flexbox ellipsis */
			transition: color 0.3s ease;
		}

		.header_view .title:hover {
			color: #1abc9c;
		}

		/* PDF Container - Responsive positioning */
		#pdfCanvasContainer {
			position: fixed;
			top: 70px;
			left: 0;
			right: 0;
			bottom: 0;
			width: 100%;
			height: calc(100vh - 70px);
			overflow: hidden;
			background-color: #525659;
		}

		#pdfCanvasContainer iframe {
			width: 100%;
			height: 100%;
			border: none;
			display: block;
			padding: 0 !important;
			margin: 0 !important;
		}

		/* Notice banner - Responsive */
		.galley_view_notice {
			position: fixed;
			top: 70px;
			left: 0;
			right: 0;
			background: linear-gradient(135deg, #f39c12 0%, #e67e22 100%);
			padding: clamp(10px, 2vw, 15px) clamp(15px, 3vw, 30px);
			z-index: 9999;
			box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
		}

		.galley_view_notice_message {
			color: white;
			text-align: center;
			font-weight: 500;
			font-size: clamp(13px, 1.8vw, 15px);
		}

		.galley_view_with_notice #pdfCanvasContainer {
			top: 115px;
			height: calc(100vh - 115px);
		}

		/* Screen reader only text */
		.pkp_screen_reader {
			position: absolute;
			left: -9999px;
			width: 1px;
			height: 1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			white-space: nowrap;
		}

		/* Mobile Responsive - Portrait */
		@media (max-width: 768px) {
			.header_view {
				height: 60px;
				padding: 0 10px;
				gap: 8px;
			}

			.header_view .return::before,
			.header_view .download .label {
				display: none; /* Hide text on mobile, show icons only */
			}

			.header_view .return,
			.header_view .download {
				padding: 10px 12px;
				min-width: 44px; /* Touch target size */
				min-height: 44px;
			}

			.header_view .title {
				font-size: 14px;
				padding: 0 8px;
			}

			#pdfCanvasContainer {
				top: 60px;
				height: calc(100vh - 60px);
			}

			.galley_view_notice {
				top: 60px;
				padding: 10px;
			}

			.galley_view_with_notice #pdfCanvasContainer {
				top: 105px;
				height: calc(100vh - 105px);
			}
		}

		/* Tablet - Landscape */
		@media (min-width: 769px) and (max-width: 1024px) {
			.header_view {
				height: 65px;
			}

			#pdfCanvasContainer {
				top: 65px;
				height: calc(100vh - 65px);
			}
		}

		/* Large screens - Extra spacing */
		@media (min-width: 1920px) {
			.header_view {
				height: 80px;
				padding: 0 40px;
			}

			#pdfCanvasContainer {
				top: 80px;
				height: calc(100vh - 80px);
			}

			.header_view .title {
				font-size: 22px;
			}
		}

		/* Print styles */
		@media print {
			.header_view {
				display: none;
			}

			#pdfCanvasContainer {
				position: static;
				height: auto;
			}
		}
	</style>
</head>
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

	{* Header wrapper *}
	<header class="header_view">

		<a href="{$parentUrl}" class="return">
			<span class="pkp_screen_reader">
				{if $parent instanceOf Issue}
					{translate key="issue.return"}
				{else}
					{translate key="article.return"}
				{/if}
			</span>
			Return to Article Details
		</a>

		<a href="{$parentUrl}" class="title">
			{$title|escape}
		</a>

		<a href="{$pdfUrl}" class="download" download>
			<span class="label">
				{translate key="common.download"}
			</span>
			<span class="pkp_screen_reader">
				{translate key="common.downloadPdf"}
			</span>
		</a>

	</header>

	<script type="text/javascript">
		// Creating iframe's src in JS instead of Smarty so that EZProxy-using sites can find our domain in $pdfUrl and do their rewrites on it.
		$(document).ready(function() {ldelim}
			var urlBase = "{$pluginUrl}/pdf.js/web/viewer.html?file=";
			var pdfUrl = {$pdfUrl|json_encode:JSON_UNESCAPED_SLASHES};
			$("#pdfCanvasContainer > iframe").attr("src", urlBase + encodeURIComponent(pdfUrl));
		{rdelim});
	</script>

	<div id="pdfCanvasContainer" class="galley_view{if !$isLatestPublication} galley_view_with_notice{/if}">
		{if !$isLatestPublication}
			<div class="galley_view_notice">
				<div class="galley_view_notice_message" role="alert">
					{$datePublished}
				</div>
			</div>
		{/if}
		<iframe src="" width="100%" height="100%" title="{$galleyTitle}" allow="fullscreen" webkitallowfullscreen="webkitallowfullscreen"></iframe>
	</div>
	{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
