{**
 * templates/frontend/pages/about.tpl
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

{* HERO IMAGE - Same as home page *}
<div class="homepage-hero">
	<div class="hero-content">
		<h1>Jurnal Riptek</h1>
		<p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
	</div>
	<div class="hero-image">
		<img src="{$publicFilesDir}/semarang-city.png" alt="Semarang City" onerror="this.style.display='none'">
	</div>
</div>

{* CONTENT WRAPPER WITH SIDEBAR *}
<div class="content-wrapper">
	
	{* SIDEBAR MENU - Same as home page *}
	<aside class="sidebar-menu">
		<ul class="sidebar-menu-list">
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="editorialTeam"}" class="sidebar-menu-link">Editorial Team</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="editorialPolicies"}" class="sidebar-menu-link">Peer-Review Process</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="submissions"}" class="sidebar-menu-link">Focus And Scope</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="submissions"}" class="sidebar-menu-link">Section Policies</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="{url page="about" op="submissions"}" class="sidebar-menu-link">Author Guidelines</a>
			</li>
		</ul>
		
		{* v10.10: SINTA Badge - Same as home page *}
		<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
			<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA - Science and Technology Index" style="max-width: 100%; height: auto;">
		</div>
	</aside>

	{* MAIN CONTENT AREA - NO BREADCRUMBS, NO DUPLICATE TITLE *}
	<div id="main-content" class="page page_about main-content-area">
		
		{* Direct content - no grid, no columns, just pure content *}
		<div class="about-content-wrapper">
			{$currentContext->getLocalizedData('about')}
		</div>
		
	</div><!-- .page -->

</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
