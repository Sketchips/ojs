{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}
{capture assign="pageTitle"}
	{if $prevPage}
		{translate key="archive.archivesPageNumber" pageNumber=$prevPage+1}
	{else}
		{translate key="archive.archives"}
	{/if}
{/capture}
{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<div id="main-content" class="page page_issue_archive">

	<div class="row archive-layout">
		{* Left Sidebar Navigation *}
		<div class="col-md-3 archive-sidebar">
			<div class="sidebar-nav-wrapper">
				<div class="sidebar-nav-item">
					<a href="{url page="about" op="editorialTeam" router=\PKP\core\PKPApplication::ROUTE_PAGE}" class="btn btn-success btn-block">
						Editorial Team
					</a>
				</div>
				<div class="sidebar-nav-item">
					<a href="{url page="about" op="peerReview" router=\PKP\core\PKPApplication::ROUTE_PAGE}" class="btn btn-success btn-block">
						Peer-Review Process
					</a>
				</div>
				<div class="sidebar-nav-item">
					<a href="{url page="about" op="focusAndScope" router=\PKP\core\PKPApplication::ROUTE_PAGE}" class="btn btn-success btn-block">
						Focus and Scope
					</a>
				</div>
				<div class="sidebar-nav-item">
					<a href="{url page="about" op="sectionPolicies" router=\PKP\core\PKPApplication::ROUTE_PAGE}" class="btn btn-success btn-block">
						Section Policies
					</a>
				</div>
				<div class="sidebar-nav-item">
					<a href="{url page="about" op="authorGuidelines" router=\PKP\core\PKPApplication::ROUTE_PAGE}" class="btn btn-success btn-block">
						Author Guidelines
					</a>
			</div>

			{* Separator Line *}
			<hr style="margin: 20px 0; border: 0; border-top: 1px solid #e0e0e0;">

			{* INDEX BY Section *}
			<div class="sidebar-indexby" style="text-align: center;">
				<h4 class="index-title" style="margin: 0 0 15px 0; font-size: 14px; font-weight: 600; color: #555;">INDEX BY</h4>
				<div style="padding: 0 20px 20px 20px;">
					<img src="{$publicFilesDir}/sinta-logo.png" onerror="this.onerror=null; this.src='https://sinta.kemdikbud.go.id/assets/img/site/logo.png';" alt="SINTA" class="img-responsive index-logo" style="transition: transform 0.3s ease, filter 0.3s ease; cursor: default;" onmouseover="this.style.transform='scale(1.05)'; this.style.filter='brightness(1.1)';" onmouseout="this.style.transform='scale(1)'; this.style.filter='brightness(1)';">
				</div>
			</div>
			</div>
		</div>

		{* Right Content Area *}
		<div class="col-md-9 archive-content">
			<div class="archive-header">
				<h2 class="page-title">Archives</h2>
				<p class="archive-breadcrumb">Table of Contents</p>
			</div>

			{* No issues have been published *}
			{if empty($issues)}
				<div class="alert alert-info" role="alert">
					{translate key="current.noCurrentIssueDesc"}
				</div>
			{else}

				{* Group issues by year *}
				{assign var="currentYear" value=""}
				{foreach from=$issues item="issue"}
					{assign var="issueYear" value=$issue->getYear()}
					{if $issueYear != $currentYear}
						{if $currentYear != ""}
							</div> {* Close previous year group *}
						{/if}
						{assign var="currentYear" value=$issueYear}
						<div class="archive-year-group">
							<h3 class="year-heading">{$issueYear}</h3>
							<div class="issues-list">
					{/if}
					
					{include file="frontend/objects/issue_summary.tpl"}
					
				{/foreach}
				{if $currentYear != ""}
					</div></div> {* Close last year group *}
				{/if}

				{* Pagination *}
				{if $prevPage > 1}
					{capture assign=prevUrl}{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive" path=$prevPage}{/capture}
				{elseif $prevPage === 1}
					{capture assign=prevUrl}{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}{/capture}
				{/if}
				{if $nextPage}
					{capture assign=nextUrl}{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive" path=$nextPage}{/capture}
				{/if}
				{include
					file="frontend/components/pagination.tpl"
					prevUrl=$prevUrl
					nextUrl=$nextUrl
					showingStart=$showingStart
					showingEnd=$showingEnd
					total=$total
				}
			{/if}
		</div>
	</div>
</div>

{include file="common/frontend/footer.tpl"}
