{**
 * templates/dashboard/index.tpl
 * Halaman dashboard admin
 *}
{extends file="layouts/backend.tpl"}

{block name="page"}
<div class="custom-dashboard-container">
    <h1 class="dashboard-title">Dashboard</h1>

    <div class="stats-grid">
        <a href="{url page="main" op="index" params=['filter' => 'review']}" class="stat-card-link">
            <div class="stat-card stat-under-review {if $activeFilter == 'review'}active{/if}">
                <div class="stat-icon">
                    <span class="fa fa-clock-o"></span>
                </div>
                <div class="stat-content">
                    <div class="stat-count">{$stats.underReview|default:0}</div>
                    <div class="stat-label">Under Review</div>
                </div>
            </div>
        </a>

        <a href="{url page="main" op="index" params=['filter' => 'rejected']}" class="stat-card-link">
            <div class="stat-card stat-rejected {if $activeFilter == 'rejected'}active{/if}">
                <div class="stat-icon">
                    <span class="fa fa-times-circle"></span>
                </div>
                <div class="stat-content">
                    <div class="stat-count">{$stats.rejectedArticles|default:0}</div>
                    <div class="stat-label">Rejected Articles</div>
                </div>
            </div>
        </a>

        <a href="{url page="main" op="index" params=['filter' => 'accepted']}" class="stat-card-link">
            <div class="stat-card stat-accepted {if $activeFilter == 'accepted'}active{/if}">
                <div class="stat-icon">
                    <span class="fa fa-check-circle"></span>
                </div>
                <div class="stat-content">
                    <div class="stat-count">{$stats.acceptedArticles|default:0}</div>
                    <div class="stat-label">Accepted Articles</div>
                </div>
            </div>
        </a>

        <a href="{url page="main" op="index" params=['filter' => 'published']}" class="stat-card-link">
            <div class="stat-card stat-published {if $activeFilter == 'published'}active{/if}">
                <div class="stat-icon">
                    <span class="fa fa-newspaper-o"></span>
                </div>
                <div class="stat-content">
                    <div class="stat-count">{$stats.publishedArticles|default:0}</div>
                    <div class="stat-label">Published Articles</div>
                </div>
            </div>
        </a>
    </div>

    <div class="section-header">
        <h2 class="section-title">
            {if $activeFilter == 'review'}
                Submissions Under Review
            {elseif $activeFilter == 'rejected'}
                Rejected Submissions
            {elseif $activeFilter == 'accepted'}
                Accepted Submissions
            {elseif $activeFilter == 'published'}
                Published Submissions
            {else}
                Recent Submissions
            {/if}
        </h2>
    </div>
    <div class="latest-submissions-table">
        <table class="pkp_table">
            <thead>
                <tr>
                    <th>Judul</th>
                    <th>Author</th>
                    <th>Kontributor</th>
                    <th>Tgl Submit</th>
                    <th>Reviewer</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$latestSubmissions item=submission}
                    <tr class="submission-row" data-submission-id="{$submission.id}">
                        <td>
                            <a href="{url page="workflow" op="access" path=$submission.id}" class="submission-link">
                                <div class="submission-title">{$submission.title}</div>
                            </a>
                        </td>
                        <td>
                            <a href="{url page="workflow" op="access" path=$submission.id}" class="submission-link">
                                <div class="author-info">
                                    <span class="author-name">{$submission.author}</span>
                                    {if $submission.authorCount > 1}
                                        <span class="author-count">+{$submission.authorCount - 1}</span>
                                    {/if}
                                </div>
                            </a>
                        </td>
                        <td>
                            <a href="{url page="workflow" op="access" path=$submission.id}" class="submission-link">
                                <div class="contributors-list" title="{$submission.contributors}">
                                    {$submission.contributors|default:'-'}
                                </div>
                            </a>
                        </td>
                        <td>
                            <a href="{url page="workflow" op="access" path=$submission.id}" class="submission-link">
                                <span class="date-display">{$submission.dateSubmitted}</span>
                            </a>
                        </td>
                        <td>
                            <a href="{url page="workflow" op="access" path=$submission.id}" class="submission-link">
                                <span class="reviewer-name">{$submission.reviewer}</span>
                            </a>
                        </td>
                        <td>
                            <a href="{url page="workflow" op="access" path=$submission.id}" class="submission-link">
                                <span class="status-tag status-{$submission.status|lower|replace:' ':'-'}">
                                    {$submission.status}
                                </span>
                            </a>
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="6">Tidak ada data submission terbaru.</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        
        {if $totalPages > 1}
        <div class="pagination-container">
            <div class="pagination-info">
                Showing {$startIndex} to {$endIndex} of {$totalSubmissions} entries
            </div>
            <div class="pagination-controls">
                {if $currentPage > 1}
                    {if $activeFilter}
                        <a href="{url page="main" op="index" params=['filter' => $activeFilter, 'page' => $currentPage-1]}" class="pagination-btn pagination-prev">
                    {else}
                        <a href="{url page="main" op="index" params=['page' => $currentPage-1]}" class="pagination-btn pagination-prev">
                    {/if}
                        <span class="fa fa-chevron-left"></span> Previous
                    </a>
                {/if}
                
                <div class="pagination-pages">
                    {foreach from=$pageNumbers item=pageNum}
                        {if $pageNum == $currentPage}
                            <span class="pagination-page active">{$pageNum}</span>
                        {else}
                            {if $activeFilter}
                                <a href="{url page="main" op="index" params=['filter' => $activeFilter, 'page' => $pageNum]}" class="pagination-page">{$pageNum}</a>
                            {else}
                                <a href="{url page="main" op="index" params=['page' => $pageNum]}" class="pagination-page">{$pageNum}</a>
                            {/if}
                        {/if}
                    {/foreach}
                </div>
                
                {if $currentPage < $totalPages}
                    {if $activeFilter}
                        <a href="{url page="main" op="index" params=['filter' => $activeFilter, 'page' => $currentPage+1]}" class="pagination-btn pagination-next">
                    {else}
                        <a href="{url page="main" op="index" params=['page' => $currentPage+1]}" class="pagination-btn pagination-next">
                    {/if}
                        Next <span class="fa fa-chevron-right"></span>
                    </a>
                {/if}
            </div>
        </div>
        {/if}
    </div>
</div>
{/block}

{block name="styles"}
<link rel="stylesheet" href="styles/build.css">
{/block}
