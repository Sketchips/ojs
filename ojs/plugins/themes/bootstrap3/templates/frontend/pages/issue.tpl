{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $showGalleyLinks bool Show galley links to users without access?
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$issueIdentification}

<div id="main-content" class="page page_issue">

	{* Display a message if no current issue exists *}
	{if !$issue}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}

	{* Display an issue with the Table of Contents *}
	{else}
		<div class="row issue-layout">
			{* Left Sidebar Navigation *}
			<div class="col-md-3 issue-sidebar">
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
			<div class="col-md-9 issue-content">
				<div class="issue-header">
					<h2 class="page-title">Current Issues</h2>
					<h3 class="issue-identification">{$issueIdentification|escape}</h3>
					<p class="issue-doi">
						<strong>DOI:</strong> 
						<a href="{url|escape op="view" page="issue" path=$issue->getBestIssueId()}" class="issue-doi-link">
							{url|escape op="view" page="issue" path=$issue->getBestIssueId()}
						</a>
					</p>
					<p class="issue-toc-link">
						<a href="#articles" class="toc-link">Table of Contents</a>
					</p>
				</div>
				
				{include file="frontend/objects/issue_toc.tpl"}
			</div>
		</div>
	{/if}

</div>

{include file="common/frontend/footer.tpl"}
