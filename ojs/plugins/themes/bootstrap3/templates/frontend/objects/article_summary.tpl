{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University Library
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $authorUserGroups Traversible The set of author user groups
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showGalleyLinks bool Show galley links to users without access?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 *}
{assign var=publication value=$article->getCurrentPublication()}
{assign var=articlePath value=$article->getBestId($currentJournal)}
{if (!$section.hideAuthor && $article->getHideAuthor() == \APP\submission\Submission::AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == \APP\submission\Submission::AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

{* Check if article has PDF galley *}
{assign var="hasPDF" value=false}
{assign var="articleGalleys" value=$publication->getData('galleys')}
{if !$articleGalleys}
	{assign var="articleGalleys" value=$article->getGalleys()}
{/if}
{if $articleGalleys|@count > 0}
	{assign var="hasPDF" value=true}
{/if}

<div class="article-summary article-text-only{if $hasPDF} has-pdf{/if}">
	
	<div class="article-content-wrapper">
		<div class="article-text-info">
			<h4 class="article-title">
				<a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$articlePath}{else}{url page="article" op="view" path=$articlePath}{/if}">
					{$article->getLocalizedTitle()|strip_unsafe_html}
				</a>
			</h4>

			{if $showAuthor}
				<div class="article-authors">
					{$article->getCurrentPublication()->getAuthorString($authorUserGroups)|escape}
				</div>
			{/if}

			{* Page numbers for this article *}
			{if $article->getPages()}
				<div class="article-pages">
					{$article->getPages()|escape}
				</div>
			{/if}
		</div><!-- .article-text-info -->
			
		{* Action Buttons *}
		<div class="article-action-buttons">
			{* View Article Button *}
			<a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$articlePath}{else}{url page="article" op="view" path=$articlePath}{/if}" 
			   class="btn btn-sm btn-success">
				<i class="fa fa-file-text-o"></i>
				View Article
			</a>
			
			{* View PDF Button (Preview Mode) - Get galleys from publication *}
			{assign var="articleGalleys" value=$publication->getData('galleys')}
			
			{if !$articleGalleys}
				{* Fallback: Try getting from article directly *}
				{assign var="articleGalleys" value=$article->getGalleys()}
			{/if}
			
			{if $articleGalleys|@count > 0}
				{foreach from=$articleGalleys item=galley name=galleyLoop}
					{if $smarty.foreach.galleyLoop.first}
						{assign var="viewPath" value=$articlePath|to_array:$galley->getBestGalleyId()}
						<a href="{if $journal}{url journal=$journal->getPath() page="article" op="view" path=$viewPath}{else}{url page="article" op="view" path=$viewPath}{/if}" 
						   class="btn btn-sm btn-primary"
						   target="_blank">
							<i class="fa fa-file-pdf-o"></i>
							View PDF
						</a>
						{break}
					{/if}
				{/foreach}
			{/if}
		</div>
	</div>
</div><!-- .article-summary -->
