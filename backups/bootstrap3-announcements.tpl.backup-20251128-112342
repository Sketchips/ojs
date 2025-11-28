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

{* Content Wrapper - No sidebar for announcements *}
<div class="content-wrapper">
	
	<div class="main-content-area" style="margin-left: 0; max-width: 100%;">
		
		<section class="info-section announcements-section">
			<h2 class="section-title">Announcements</h2>
			<div class="section-content">
				{if $announcementsEnabled}
					<p>No announcements have been published.</p>
				{else}
					<div class="alert alert-info">
						<p><strong>Note:</strong> Announcements are currently disabled for this journal.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Check back later for updates and important announcements from Jurnal Riptek.</p>
					</div>
				{/if}
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
