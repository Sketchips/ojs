{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Announcements page
 *}
{assign var="pageTitleTranslated" value="Announcements"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">

	{* Sidebar Menu *}
	<aside class="sidebar-menu">
		{include file="frontend/components/sidebar.tpl"}
	</aside>

	{* Main Content *}
	<div class="main-content-area">

		<section class="info-section announcements-section">
			<h2 class="section-title">Announcements</h2>
			<div class="section-content">
				{if $announcementsEnabled}
					{if $announcements && $announcements|@count}
						{include file="frontend/components/announcements.tpl"}
					{else}
						<p>No announcements have been published.</p>
					{/if}
				{else}
					<div class="alert alert-info">
						<p><strong>Note:</strong> Announcements are currently disabled for this journal.</p>
						<p>Check back later for updates and important announcements from this journal.</p>
					</div>
				{/if}
			</div>
		</section>

	</div>

</div><!-- .content-wrapper -->{include file="common/frontend/footer.tpl"}
