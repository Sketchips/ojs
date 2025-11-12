{**
 * templates/frontend/pages/focusAndScope.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Focus and Scope page
 *}
{assign var="pageTitleTranslated" value="Focus and Scope"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">
	
	{* Sidebar Menu *}
	{include file="frontend/components/aboutSidebar.tpl" activePage="focusAndScope"}

	{* Main Content Area *}
	<div class="main-content-area">
		
		<section class="info-section focus-scope-section">
			<h2 class="section-title">Focus and Scope</h2>
			<div class="section-content">
				{if $focusScopeDesc}
					{$focusScopeDesc}
				{else}
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesunt non ipsum facilisis, tincidunt ex eu, iaculis ex turpis. Sed ac lacus ligula posuere lacus posuere, lacus posuere maximus. Integer dictum rhoncus lectus eget dignissim. Nulla luctus neque ut interdum lacinia. Etiam quis elementum nisl. Praesent ac ante viverra, posuere diam ac, dictum enim. Vestibulum ultricies metus lacus, vel varius ligula dignissim sed. Ut eu ligula sagittis elit ac purus vel.</p>
					
					<h3>Journal Focus</h3>
					<p>Jurnal Riptek focuses on research and innovation in science and technology, particularly those relevant to regional development and public welfare.</p>
					
					<h3>Scope Areas</h3>
					<ul>
						<li>Information Technology and Computer Science</li>
						<li>Engineering and Applied Sciences</li>
						<li>Environmental Science and Sustainability</li>
						<li>Innovation and Technology Management</li>
						<li>Regional Development and Smart Cities</li>
					</ul>
				{/if}
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
