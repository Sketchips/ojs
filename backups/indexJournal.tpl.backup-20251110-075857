{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<!-- Homepage Hero Section (1440px x 544px, positioned at top: 71px) -->
<section class="homepage-hero">
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

<div id="main-content" class="page_index_journal">

	{call_hook name="Templates::Index::journal"}
	
	<!-- Content Wrapper with Sidebar -->
	<div class="content-wrapper">
		
		<!-- Sidebar with Green Buttons (320px x 62px each) -->
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
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about"}" class="sidebar-menu-link">
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
			
			<!-- SINTA Badge - Moved below Author Guidelines -->
			<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
				<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA - Science and Technology Index" style="max-width: 100%; height: auto;">
			</div>
		</aside>
		
		<!-- Main Content Area -->
		<main class="main-content-area">

	{if $journalDescription}
		<div class="journal-description">
			<h2>JURNAL RIPTEK</h2>
			{$journalDescription}
		</div>
	{/if}
	
	<!-- Focus and Scope -->
	<section class="info-section">
		<h3>Focus and Scope</h3>
		<p>Riptek covers a topic related to spatial planning & development, community empowerment and participation, tourism planning and management, economic development, environmental planning and management, and disaster management.</p>
	</section>
	
	<!-- Publication Info -->
	<section class="info-section">
		<h3>Edited and Published By</h3>
		<p>The Government of Semarang City</p>
	</section>
	
	<section class="info-section">
		<h3>Bibliographic Information</h3>
		<p>E-ISSN 2716-3482 P-ISSN 1978-8320</p>
	</section>
	
	<section class="info-section">
		<h3>Publishing Frequency</h3>
		<p>Riptek publishes articles biannually in June and November. All papers are published as soon as they have been accepted.</p>
	</section>
	
	<section class="info-section">
		<h3>Abstracting/Indexing</h3>
		<p>Get an overview of abstracting/indexing information.</p>
	</section>

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|count}
		<section class="cmp_announcements media">
			<header class="page-header">
				<h2>
					{translate key="announcement.announcements"}
				</h2>
			</header>
			<div class="media-list">
				{foreach name=announcements from=$announcements item=announcement}
					{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
						{break}
					{/if}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
				{/foreach}
			</div>
		</section>
	{/if}


	{* Latest issue - HIDDEN ON HOMEPAGE *}
	{* 
	{if $issue}
		<section class="current_issue">
			<header class="page-header">
				<h2>
					{translate key="journal.currentIssue"}
				</h2>
			</header>
			<p class="current_issue_title lead">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</p>
			{include file="frontend/objects/issue_toc.tpl"}
			<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary read-more">
				{translate key="journal.viewAllIssues"}
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</section>
	{/if}
	*}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<section class="additional_content">
			{$additionalHomeContent}
		</section>
	{/if}
	
		</main><!-- .main-content-area -->
		
	</div><!-- .content-wrapper -->

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
