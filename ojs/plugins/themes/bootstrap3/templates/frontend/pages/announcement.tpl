{**
 * templates/frontend/pages/announcement.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display single announcement detail page
 *
 * @uses $announcement Announcement The announcement to display
 *}
{assign var="pageTitleTranslated" value=$announcement->getLocalizedTitle()|escape}
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

		<section class="info-section announcement-detail-section">
			{* Display announcement details *}
			{include file="frontend/objects/announcement_full.tpl"}
		</section>

	</div>

</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
