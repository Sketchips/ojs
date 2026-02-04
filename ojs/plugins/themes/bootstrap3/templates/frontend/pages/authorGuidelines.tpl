{**
 * templates/frontend/pages/authorGuidelines.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Author Guidelines page with content.
 *}
{assign var="pageTitleTranslated" value="Author Guidelines"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">
	
	{* Sidebar Menu *}
	{include file="frontend/components/aboutSidebar.tpl" activePage="authorGuidelines"}

	{* Main Content Area *}
	<div class="main-content-area">
		
		{* Author Guidelines Content *}
		<section class="info-section author-guidelines-section">
			<h2 class="section-title">Author Guidelines</h2>
			<div class="section-content">
				{if $currentJournal->getLocalizedData('authorGuidelines')}
					{$currentJournal->getLocalizedData('authorGuidelines')}
				{else}
					<p>No author guidelines have been configured.</p>
				{/if}
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
