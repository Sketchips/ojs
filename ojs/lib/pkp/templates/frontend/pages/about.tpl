{**
 * templates/frontend/pages/about.tpl - MODIFIED v2.0
 * Added hero section and sidebar like homepage
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view information about a journal.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

<!-- Homepage Hero Section - Same as home page -->
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
			<!-- Default Semarang City illustration -->
			<img src="https://ojsimg.netlify.app/semarang-city-hero.png" alt="Semarang City">
		{/if}
	</div>
</section>

<div id="main-content" class="page page_about">

	{call_hook name="Templates::About::journal"}
	
	<!-- Content Wrapper with Sidebar - Same as homepage -->
	<div class="content-wrapper">
		
		<!-- Sidebar with Green Buttons -->
		<aside class="sidebar-menu">
			<ul class="sidebar-menu-list">
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="editorialTeam"}" class="sidebar-menu-link">
						Editorial Team
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="submissions"}" class="sidebar-menu-link">
						Peer-Review Process
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about"}" class="sidebar-menu-link active">
						Focus and Scope
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="editorialPolicies"}" class="sidebar-menu-link">
						Section Policies
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="submissions"}" class="sidebar-menu-link">
						Author Guidelines
					</a>
				</li>
			</ul>
			
			<!-- SINTA Badge -->
			<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
				<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA - Science and Technology Index" style="max-width: 100%; height: auto;">
			</div>
		</aside>
		
		<!-- Main Content Area -->
		<main class="main-content-area">

			{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutContext"}

			{* Page Title *}
			<div class="page-header">
				<h1>{translate key="about.aboutContext"}</h1>
			</div>
			{* /Page Title *}

			{$currentContext->getLocalizedData('about')}
			
		</main><!-- .main-content-area -->
	</div><!-- .content-wrapper -->
	
</div><!-- .page -->

{include file="common/frontend/footer.tpl"}
