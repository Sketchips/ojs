{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
<div class="issue-summary-card">

	{* Retrieve separate entries for $issueTitle and $issueSeries *}
	{assign var=issueTitle value=$issue->getLocalizedTitle()}
	{assign var=issueSeries value=$issue->getIssueSeries()}
	{assign var=issueDescription value=$issue->getLocalizedDescription()}

	<div class="card issue-card">
		<div class="row no-gutters">
			{* Show cover image *}
			{if $issue->getLocalizedCoverImage()}
				<div class="col-md-3 issue-cover-col">
					<a class="issue-cover-link" href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
						<img class="issue-cover-image" src="{$issue->getLocalizedCoverImageUrl()|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:''}">
					</a>
				</div>
				<div class="col-md-9">
			{else}
				<div class="col-md-12">
			{/if}
				<a class="issue-info-link" href="{url|escape op="view" path=$issue->getBestIssueId($currentJournal)}">
					<div class="card-body issue-info">
						<h3 class="issue-title">
							{if $issueTitle}
								{$issueTitle|escape}
							{else}
								{$issueSeries|escape}
							{/if}
						</h3>
						{if $issueTitle}
							<p class="issue-series">
								{$issueSeries|escape}
							</p>
						{/if}
						{if $issueDescription}
							<div class="issue-description">
								{$issueDescription|strip_unsafe_html|nl2br}
							</div>
						{/if}
					</div>
				</a>
			</div>
		</div>
	</div>
</div><!-- .issue-summary-card -->
