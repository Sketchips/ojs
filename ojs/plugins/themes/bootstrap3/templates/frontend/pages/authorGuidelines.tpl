{**
 * templates/frontend/pages/authorGuidelines.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Author Guidelines page with content.
 *
 * @uses $currentJournal Journal The current journal
 *}
{include file="frontend/components/header.tpl" pageTitle="Author Guidelines"}

{* v11.3: HERO SECTION - Same layout as homepage *}
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

{* CONTENT WRAPPER WITH SIDEBAR - Same as homepage *}
<div class="content-wrapper">
	
	{* SIDEBAR MENU - Same as home page *}
	<aside class="sidebar-menu">
		<ul class="sidebar-menu-list">
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="editorialTeam"}" class="sidebar-menu-link">
					Editorial Team
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="editorialPolicies"}" class="sidebar-menu-link">
					Peer-Review Process
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about"}" class="sidebar-menu-link">
					Focus and Scope
				</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="editorialPolicies"}" class="sidebar-menu-link">
					Section Policies
				</a>
			</li>
			<li class="sidebar-menu-item active">
				<a href="{url page="about" op="submissions"}" class="sidebar-menu-link">
					Author Guidelines
				</a>
			</li>
		</ul>
		
		{* SINTA Badge *}
		<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
			<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA" style="max-width: 100%; height: auto;">
		</div>
	</aside>

	{* MAIN CONTENT AREA *}
	<div class="main-content-area">
		
		{* Author Guidelines Content *}
		<section class="info-section author-guidelines-section">
			<h2 class="section-title">Author Guidelines</h2>
			<div class="section-content">
				<p>Authors are invited to make a submission to this journal. All submissions will be assessed by an editor to determine whether they meet the aims and scope of this journal. Those considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p>
				
				<p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study's country.</p>
				
				<p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the study design and research argument are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the paper. When you're satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
