{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Editorial Team page
 *}
{assign var="pageTitleTranslated" value="Editorial Team"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">
	
	{* Sidebar Menu *}
	{include file="frontend/components/aboutSidebar.tpl" activePage="editorialTeam"}

	{* Main Content Area *}
	<div class="main-content-area">
		
		<section class="info-section editorial-team-section">
			<h2 class="section-title">Editorial Team</h2>
			<div class="section-content">
				{if $currentJournal->getLocalizedData('editorialTeam')}
					{$currentJournal->getLocalizedData('editorialTeam')}
				{else}
					<p>No editorial team information has been configured.</p>
				{/if}
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
