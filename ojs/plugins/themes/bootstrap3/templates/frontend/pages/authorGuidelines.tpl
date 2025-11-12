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
				<p>Authors are invited to make a submission to this journal. All submissions will be assessed by an editor to determine whether they meet the aims and scope of this journal. Those considered to be a good fit will be sent for peer review before determining whether they will be accepted or rejected.</p>
				
				<p>Before making a submission, authors are responsible for obtaining permission to publish any material included with the submission, such as photos, documents and datasets. All authors identified on the submission must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study's country.</p>
				
				<p>An editor may desk reject a submission if it does not meet minimum standards of quality. Before submitting, please ensure that the study design and research argument are structured and articulated properly. The title should be concise and the abstract should be able to stand on its own. This will increase the likelihood of reviewers agreeing to review the paper. When you're satisfied that your submission meets this standard, please follow the checklist below to prepare your submission.</p>
			</div>
		</section>

	</div>
	
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
