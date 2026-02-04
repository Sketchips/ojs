{**
 * templates/frontend/pages/about.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the About page - About Journal only
 *}
{assign var="pageTitleTranslated" value="About"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">
	
	{* Sidebar Menu - NO active page for main about *}
	{include file="frontend/components/aboutSidebar.tpl" activePage=""}

	{* Main Content Area *}
	<div class="main-content-area">
		
		<section class="info-section about-section">
			<h2 class="section-title">About Journal</h2>
			<div class="section-content">
				{if $currentJournal->getLocalizedData('about')}
					{$currentJournal->getLocalizedData('about')}
				{else}
					<p>No information about this journal has been configured.</p>
				{/if}
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
