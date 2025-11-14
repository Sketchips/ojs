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
		ISSN: 2716-3482 (E) 1978-8320 (P)
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

{* v11.5: SUBMISSIONS PAGE - Upload Button (center aligned) *}
<div class="submissions-page-container">
	
	{* Upload Your Article Button - Large centered button *}
	<div class="upload-button-wrapper">
		<a href="{url page="submission" op="wizard"}" class="btn-upload-article">
			<span class="upload-icon">↑</span>
			Upload Your Article
		</a>
	</div>
	
	{* SIDEBAR MENU *}
	<aside class="sidebar-menu sidebar-menu-submissions">
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
	</ul>		{* SINTA Badge *}
		<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
			<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA" style="max-width: 100%; height: auto;">
		</div>
	</aside>
	
</div>

{include file="common/frontend/footer.tpl"}
