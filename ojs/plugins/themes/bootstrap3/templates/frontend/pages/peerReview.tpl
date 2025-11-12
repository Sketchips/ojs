{**
 * templates/frontend/pages/peerReview.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the Peer-Review Process page
 *}
{assign var="pageTitleTranslated" value="Peer-Review Process"}
{include file="frontend/components/header.tpl"}

{* Hero Section *}
{include file="frontend/components/aboutHero.tpl"}

{* Content Wrapper with Sidebar *}
<div class="content-wrapper">
	
	{* Sidebar Menu *}
	{include file="frontend/components/aboutSidebar.tpl" activePage="peerReview"}

	{* Main Content Area *}
	<div class="main-content-area">
		
		<section class="info-section peer-review-section">
			<h2 class="section-title">Peer-Review Process</h2>
			<div class="section-content">
				{if $reviewPolicy}
					{$reviewPolicy}
				{else}
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non ipsum facilisis, tincidunt ex eu, iaculis ex turpis. Sed ac lacus ligula posuere lacus posuere, lacus posuere maximus. Integer dictum rhoncus lectus eget dignissim. Nulla luctus neque ut interdum lacinia. Etiam quis elementum nisl. Praesent ac ante viverra, posuere diam ac,dictum enim. Vestibulum ultricies metus lacus, vel varius ligula digissim sed. Ut eu ligula sagittis elit ac purus vel.</p>
					
					<h3>Review Process</h3>
					<p>All manuscripts submitted to this journal are subject to peer review. The review process follows these steps:</p>
					<ol>
						<li>Initial editorial screening for suitability and quality</li>
						<li>Double-blind peer review by at least two independent reviewers</li>
						<li>Editorial decision based on reviewers' recommendations</li>
						<li>Author revision (if required)</li>
						<li>Final editorial approval</li>
					</ol>
					
					<h3>Review Criteria</h3>
					<p>Reviewers are asked to evaluate manuscripts based on:</p>
					<ul>
						<li>Originality and significance of the research</li>
						<li>Methodological rigor and appropriateness</li>
						<li>Clarity of presentation and writing quality</li>
						<li>Relevance to the journal's scope</li>
						<li>Proper citation of related work</li>
					</ul>
				{/if}
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
