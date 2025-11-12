{**
 * templates/frontend/pages/sectionPolicies.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Section Policies page
 *}
{assign var="pageTitleTranslated" value="Section Policies"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">
	
	{* Sidebar Menu *}
	{include file="frontend/components/aboutSidebar.tpl" activePage="sectionPolicies"}

	{* Main Content Area *}
	<div class="main-content-area">
		
		<section class="info-section section-policies-section">
			<h2 class="section-title">Section Policies</h2>
			<div class="section-content">
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesunt non ipsum facilisis, tincidunt ex eu, iaculis ex turpis. Sed ac lacus ligula posuere lacus posuere, lacus posuere maximus. Integer dictum rhoncus lectus eget dignissim. Nulla luctus neque ut interdum lacinia. Etiam quis elementum nisl. Praesent ac ante viverra, posuere diam ac, dictum enim. Vestibulum ultricies metus lacus, vel varius ligula dignissim sed. Ut eu ligula sagittis elit ac purus vel.</p>
				
				<h3>Open Access Policy</h3>
				<p>This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.</p>
				
				<h3>Copyright and Licensing</h3>
				<p>Authors who publish with this journal agree to the following terms:</p>
				<ul>
					<li>Authors retain copyright and grant the journal right of first publication</li>
					<li>Articles are licensed under a Creative Commons Attribution License</li>
					<li>Authors are permitted to post their work online</li>
				</ul>
				
				<h3>Publication Ethics</h3>
				<p>The journal follows the Committee on Publication Ethics (COPE) guidelines for ethical conduct in scholarly publishing.</p>
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
