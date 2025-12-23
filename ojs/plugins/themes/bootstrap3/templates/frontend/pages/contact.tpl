{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Contact page with modern design - no sidebar, home page style.
 *
 *}
{if !$pageTitleTranslated}
	{assign var="pageTitleTranslated" value="Contact"}
{/if}
{include file="frontend/components/header.tpl"}

{* Hero Section - SAME AS HOME/ABOUT (with logo in hero) *}
<section class="homepage-hero">
	
	{* Logo + BRIDA text di pojok kiri atas hero *}
	<div class="hero-logo-wrapper">
		<div class="hero-logo">
			{if $displayPageHeaderLogo}
				<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="Logo Jurnal Riptek">
			{else}
				<img src="{$baseUrl}/templates/images/structure/logo.png" alt="Logo Jurnal Riptek">
			{/if}
		</div>
		<div class="hero-brida-text">
			Badan Riset dan Inovasi Daerah Kota Semarang Pemerintah Kota Semarang
		</div>
	</div>
	
	{* ISSN di pojok kanan atas hero *}
	<div class="hero-issn">
		{assign var="onlineIssn" value=$currentJournal->getData('onlineIssn')}
		{assign var="printIssn" value=$currentJournal->getData('printIssn')}
		{if $onlineIssn || $printIssn}
			ISSN:
			{if $onlineIssn}{$onlineIssn|escape} (E){/if}
			{if $printIssn}{if $onlineIssn} {/if}{$printIssn|escape} (P){/if}
		{/if}
	</div>
	
	<div class="hero-content">
		<h1>Jurnal Riptek</h1>
		<p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
	</div>
	<div class="hero-image">
		{if $homepageImage}
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
		{else}
			<img src="https://ojsimg.netlify.app/semarang-city-hero.png" alt="Semarang City">
		{/if}
	</div>
</section>

{* Contact Content - Full width like home, no sidebar *}
<div class="content-wrapper">
	<div class="main-content-area" style="margin-left: 0; max-width: 100%; padding: 40px 60px;">
		
		<div style="font-family: Arial, sans-serif; color: #222;">
			<h2 style="color: #009245; font-size: 28px; font-weight: bold; margin-bottom: 10px;">Contact</h2>
			<p style="margin: 0; font-size: 15px; line-height: 1.6;">
				<strong>Badan Riset dan Inovasi Daerah Kota Semarang</strong><br>
				Jl. Pemuda No. 175 Semarang<br>
				Telp. (024) 3584037 Fax. (024) 3584038<br>
				E-mail: <a style="color: #009245;" href="mailto:riptek@semarangkota.go.id">riptek@semarangkota.go.id</a>
			</p>
			
			<h3 style="color: #009245; margin-top: 25px; font-size: 20px;">Principal Contact</h3>
			<p style="margin: 0; font-size: 15px;">
				Wahyudi, S.STP, MM<br>
				Email: <a style="color: #009245;" href="mailto:brida@semarangkota.go.id">brida@semarangkota.go.id</a>
			</p>
			
			<h3 style="color: #009245; margin-top: 20px; font-size: 20px;">Support Contact</h3>
			<p style="margin: 0; font-size: 15px;">
				Nanik Setyowati<br>
				Email: <a style="color: #009245;" href="mailto:brida@semarangkota.go.id">brida@semarangkota.go.id</a>
			</p>
		</div>
		
	</div>
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
