{**
 * templates/frontend/pages/submissions.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Submissions page with Upload button.
 *
 * @uses $currentJournal Journal The current journal
 *}
{assign var="pageTitleTranslated" value="Submissions"}
{include file="frontend/components/header.tpl"}

{* v11.4: HERO SECTION - Same layout as homepage *}
<div class="homepage-hero">
	
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
</div>

{* v11.7: SUBMISSIONS PAGE - Use same structure as authorGuidelines *}
<div class="content-wrapper">
	
	{* SIDEBAR MENU - Left Column *}
	<aside class="sidebar-menu">
		<ul class="sidebar-menu-list">
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="editorialTeam"}" class="sidebar-menu-link">
					Editorial Team
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="peerReview"}" class="sidebar-menu-link">
					Peer-Review Process
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="focusAndScope"}" class="sidebar-menu-link">
					Focus and Scope
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="sectionPolicies"}" class="sidebar-menu-link">
					Section Policies
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="authorGuidelines"}" class="sidebar-menu-link">
					Author Guidelines
				</a>
			</li>
		</ul>
		
		<!-- Separator Line -->
		<hr style="margin: 20px 0; border: 0; border-top: 1px solid #e0e0e0;">
		
		<!-- INDEX BY -->
		<div class="sidebar-index-title" style="text-align: center; margin-bottom: 15px;">
			<h4 style="margin: 0; font-size: 14px; font-weight: 600; color: #555;">INDEX BY</h4>
		</div>
		
		{* SINTA Badge *}
		<div class="sidebar-sinta-badge" style="padding: 0 20px 20px 20px; text-align: center;">
			<img src="{$publicFilesDir}/sinta-logo.png" onerror="this.onerror=null; this.src='https://sinta.kemdikbud.go.id/assets/img/site/logo.png';" alt="SINTA" style="max-width: 100%; height: auto; transition: transform 0.3s ease, filter 0.3s ease; cursor: default;" onmouseover="this.style.transform='scale(1.05)'; this.style.filter='brightness(1.1)';" onmouseout="this.style.transform='scale(1)'; this.style.filter='brightness(1)';">
		</div>
	</aside>
	
	{* MAIN CONTENT - Center Column *}
	<div class="main-content-area">
		
		{* Copyright Notice Section *}
		{if $currentContext->getLocalizedData('copyrightNotice')}
		<section class="info-section copyright-notice-section">
			<h2 class="section-title">
				{translate key="about.copyrightNotice"}
			</h2>
			<div class="section-content">
				{$currentContext->getLocalizedData('copyrightNotice')}
			</div>
		</section>
		{/if}
		
		{* Privacy Statement Section *}
		{if $currentContext->getLocalizedData('privacyStatement')}
		<section class="info-section privacy-statement-section">
			<h2 class="section-title">
				{translate key="about.privacyStatement"}
			</h2>
			<div class="section-content">
				{$currentContext->getLocalizedData('privacyStatement')}
			</div>
		</section>
		{/if}
		
		{* Submissions Content Section *}
		<section class="info-section submissions-info-section">
			<h2 class="section-title">Submit Your Manuscript</h2>
			<div class="section-content">
				<p style="text-align: justify;">
					Welcome to Jurnal Riptek submission system. We invite researchers, academics, and practitioners to contribute their original research articles, reviews, and case studies. Please ensure your manuscript follows our <a href="{url page="about" op="authorGuidelines"}" style="color: #27ae60; font-weight: 600; text-decoration: underline;">Author Guidelines</a> 
					before submission.
				</p>
				<div class="submission-note-box">
					<p style="margin: 0;"><strong>Note:</strong> You need to <a href="{url page="user" op="register"}" style="color: #27ae60; font-weight: 600; text-decoration: underline;">register</a> 
					or <a href="{url page="login"}" style="color: #27ae60; font-weight: 600; text-decoration: underline;">login</a> to submit your article.</p>
				</div>
				
				{* Upload Your Article Button *}
				<div class="upload-button-wrapper">
					<a href="{url page="submission" op="wizard"}" class="btn-upload-article">
						<span class="upload-icon">↑</span>
						Upload Your Article
					</a>
				</div>
			</div>
		</section>
		
	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
