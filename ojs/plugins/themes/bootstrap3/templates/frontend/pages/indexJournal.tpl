{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<!-- Homepage Hero Section (1440px x 544px, positioned at top: 71px) -->
<section class="homepage-hero">
	
	{* v11.0: Logo + BRIDA text di pojok kiri atas hero *}
	<div class="hero-logo-wrapper">
		<div class="hero-logo">
			{if $displayPageHeaderLogo}
				<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" alt="Logo Jurnal Riptek">
			{else}
				<img src="{$baseUrl}/templates/images/structure/logo.png" alt="Logo Jurnal Riptek">
			{/if}
		</div>
		<div class="hero-brida-text">
			Badan Riset dan Inovasi Daerah Kota Semarang Pemerintah Kota Semarang
		</div>
	</div>
	
	{* v11.0: ISSN di pojok kanan atas hero *}
	<div class="hero-issn">
		{assign var="onlineIssn" value=$currentJournal->getData('onlineIssn')}
		{assign var="printIssn" value=$currentJournal->getData('printIssn')}
		{if $onlineIssn || $printIssn}
			ISSN:
			{if $onlineIssn}{$onlineIssn|escape} (E){/if}
			{if $printIssn}{if $onlineIssn} {/if}{$printIssn|escape} (P){/if}
		{/if}
	</div>
	
	<div class="hero-content">
		<h1>{$currentJournal->getLocalizedName()|escape}</h1>
		<p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
	</div>
	<div class="hero-image">
		{if $homepageImage}
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
		{else}
			<!-- Default Semarang City illustration -->
			<img src="https://ojsimg.netlify.app/semarang-city-hero.png" alt="Semarang City">
		{/if}
	</div>
</section>

<div id="main-content" class="page_index_journal">

	{call_hook name="Templates::Index::journal"}
	
	<!-- Content Wrapper with Sidebar -->
	<div class="content-wrapper">
		
		<!-- Sidebar with Green Buttons (320px x 62px each) -->
		<aside class="sidebar-menu">
			<ul class="sidebar-menu-list">
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="editorialTeam"}" class="sidebar-menu-link">
						Editorial Team
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="peerReview"}" class="sidebar-menu-link">
						Peer-Review Process
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="focusAndScope"}" class="sidebar-menu-link">
						Focus and Scope
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="sectionPolicies"}" class="sidebar-menu-link">
						Section Policies
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="authorGuidelines"}" class="sidebar-menu-link">
						Author Guidelines
					</a>
				</li>
			</ul>
			
			<!-- Downloadable Files - Auto Layout 2 per Row -->
			{* Collect all downloadable files *}
			{assign var="downloadFiles" value=[]}
			
			{* Downloadable files (up to 6) *}
			{foreach from=[1,2,3,4,5,6] item=i}
				{assign var="fileField" value="downloadFile{$i}"}
				{assign var="nameField" value="downloadFile{$i}Name"}
				{assign var="colorField" value="downloadFile{$i}Color"}
				{assign var="fileData" value=$currentJournal->getData($fileField)}
				{assign var="fileName" value=$currentJournal->getData($nameField)}
				{assign var="fileColor" value=$currentJournal->getData($colorField)|default:"#27AE60"}
				{if $fileData.uploadName && $fileName}
					{$downloadFiles[] = ['name' => $fileName, 'file' => $fileData, 'color' => $fileColor]}
				{/if}
			{/foreach}
			
			{* Display files in 2-column layout *}
			{if $downloadFiles|@count > 0}
			{assign var="totalFiles" value=$downloadFiles|@count}
			{assign var="isOdd" value=$totalFiles%2}
			<div class="sidebar-download-section" style="padding: 20px;">
				<div class="download-files-grid" style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
					{foreach from=$downloadFiles item=downloadFile name=fileLoop}
					{assign var="btnColor" value=$downloadFile.color|escape}
					{assign var="hoverColor" value=$downloadFile.color|escape}
					{assign var="isLast" value=$smarty.foreach.fileLoop.last}
					{assign var="spanFull" value=$isLast && $isOdd}
					<a href="{$publicFilesDir}/{$downloadFile.file.uploadName|escape:"url"}" 
					   target="_blank" 
					   class="download-file-button" 
					   style="background-color: {$btnColor}; color: white; padding: 12px 8px; text-align: center; text-decoration: none; border-radius: 4px; font-weight: 500; font-size: 13px; transition: background-color 0.3s; display: flex; align-items: center; justify-content: center;{if $spanFull} grid-column: span 2;{/if}"
					   onmouseover="this.style.backgroundColor='{$hoverColor}'; this.style.opacity='0.85'" 
					   onmouseout="this.style.backgroundColor='{$btnColor}'; this.style.opacity='1'">
						{$downloadFile.name|escape}
					</a>
					{/foreach}
				</div>
			</div>
			{/if}
			
			<!-- Separator Line -->
<hr style="margin: 20px 0; border: 0; border-top: 1px solid #e0e0e0;">

<!-- INDEX BY -->
<div class="sidebar-index-title" style="text-align: center; margin-bottom: 15px;">
<h4 style="margin: 0; font-size: 14px; font-weight: 600; color: #555;">INDEX BY</h4>
</div>

<!-- SINTA Badge -->
<div class="sidebar-sinta-badge" style="padding: 0 20px 20px 20px; text-align: center;">
<img src="{$publicFilesDir}/sinta-logo.png" onerror="this.onerror=null; this.src='https://sinta.kemdikbud.go.id/assets/img/site/logo.png';" alt="SINTA - Science and Technology Index" style="max-width: 100%; height: auto; transition: transform 0.3s ease, filter 0.3s ease; cursor: default;" onmouseover="this.style.transform='scale(1.05)'; this.style.filter='brightness(1.1)';" onmouseout="this.style.transform='scale(1)'; this.style.filter='brightness(1)';">
</div>
		</aside>
		
		<!-- Main Content Area -->
		<main class="main-content-area">

	{if $journalDescription}
		<div class="journal-description">
			<h2>JURNAL RIPTEK</h2>
			{$journalDescription}
		</div>
	{/if}
	
	<!-- Focus and Scope -->
	<section class="info-section">
		<h3>Focus and Scope</h3>
		<p>Riptek covers a topic related to spatial planning & development, community empowerment and participation, tourism planning and management, economic development, environmental planning and management, and disaster management.</p>
	</section>
	
	<!-- Publication Info -->
	<section class="info-section">
		<h3>Edited and Published By</h3>
		<p>The Government of Semarang City</p>
	</section>
	
	<section class="info-section">
		<h3>Bibliographic Information</h3>
		{assign var="onlineIssn" value=$currentJournal->getData('onlineIssn')}
		{assign var="printIssn" value=$currentJournal->getData('printIssn')}
		{if $onlineIssn || $printIssn}
			<p>
				{if $onlineIssn}E-ISSN {$onlineIssn|escape}{/if}
				{if $printIssn}{if $onlineIssn} {/if}P-ISSN {$printIssn|escape}{/if}
			</p>
		{/if}
	</section>
	
	<section class="info-section">
		<h3>Publishing Frequency</h3>
		<p>Riptek publishes articles biannually in June and November. All papers are published as soon as they have been accepted.</p>
	</section>
	
	<section class="info-section">
		<h3>Abstracting/Indexing</h3>
		<p>Get an overview of abstracting/indexing information.</p>
	</section>

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|count}
		<section class="cmp_announcements media">
			<header class="page-header">
				<h2>
					{translate key="announcement.announcements"}
				</h2>
			</header>
			<div class="media-list">
				{foreach name=announcements from=$announcements item=announcement}
					{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
						{break}
					{/if}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
				{/foreach}
			</div>
		</section>
	{/if}


	{* Latest issue - HIDDEN ON HOMEPAGE *}
	{* 
	{if $issue}
		<section class="current_issue">
			<header class="page-header">
				<h2>
					{translate key="journal.currentIssue"}
				</h2>
			</header>
			<p class="current_issue_title lead">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</p>
			{include file="frontend/objects/issue_toc.tpl"}
			<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary read-more">
				{translate key="journal.viewAllIssues"}
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</section>
	{/if}
	*}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<section class="additional_content">
			{$additionalHomeContent}
		</section>
	{/if}
	
		</main><!-- .main-content-area -->
		
	</div><!-- .content-wrapper -->

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
