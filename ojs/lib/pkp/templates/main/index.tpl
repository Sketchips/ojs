{**
 * templates/dashboard/index.tpl
 * Halaman dashboard admin
 *}
{extends file="layouts/backend.tpl"}

{block name="page"}
<div class="custom-dashboard-container">
    <h1 class="dashboard-title">Dashboard</h1>

    <div class="stats-row">
        <div class="stat-card stat-published">
            <div class="stat-icon"><span class="fa fa-check-circle"></span></div>
            <div class="stat-content">
                <span class="stat-count">{$stats.publishedArticles|default:0}</span>
                <span class="stat-label">Published Articles</span>
            </div>
        </div>

        <div class="stat-card stat-queue">
            <div class="stat-icon"><span class="fa fa-file-text"></span></div>
            <div class="stat-content">
                <span class="stat-count">{$stats.myQueue|default:0}</span>
                <span class="stat-label">My Queue</span>
            </div>
        </div>

        <div class="stat-card stat-archived">
            <div class="stat-icon"><span class="fa fa-download"></span></div>
            <div class="stat-content">
                <span class="stat-count">{$stats.archivedArticles|default:0}</span>
                <span class="stat-label">Archived Articles</span>
            </div>
        </div>
    </div>

    <h2 class="section-title">Submitted Articles</h2>
    <div class="latest-submissions-table">
        <table class="pkp_table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$latestSubmissions item=submission}
                    <tr>
                        <td>
                            {$submission.title}
                        </td>
                        <td>
                            {$submission.author}
                        </td>
                        <td>
                            <span class="status-tag status-{$submission.status|lower|replace:' ' : '-'}">
                                {$submission.status}
                            </span>
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="3">Tidak ada data submission terbaru.</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>
{/block}

{block name="styles"}
<link rel="stylesheet" href="styles/build.css">
{/block}
