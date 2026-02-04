{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Contact page with modern design - no sidebar, home page style.
 *
 *}
{assign var="pageTitleTranslated" value="Contact"}
{include file="frontend/components/header.tpl"}

{* Hero Section - SAME AS HOME/ABOUT (with logo in hero) *}
<section class="homepage-hero">
	
	{* Logo + BRIDA text di pojok kiri atas hero *}
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
	
	{* ISSN di pojok kanan atas hero *}
	<div class="hero-issn">
		ISSN: 2716-3482 (E) 1978-8320 (P)
	</div>
	
	<div class="hero-content">
		<h1>Jurnal Riptek</h1>
		<p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
	</div>
	<div class="hero-image">
		{if $homepageImage}
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
		{else}
			<img src="https://ojsimg.netlify.app/semarang-city-hero.png" alt="Semarang City">
		{/if}
	</div>
</section>

{* Contact Content - Full width like home, no sidebar *}
<div class="content-wrapper">
	<div class="main-content-area" style="margin-left: 0; max-width: 100%; padding: 40px 60px;">
		
		{* Mailing Address *}
		{if $mailingAddress}
			<div class="contact-section" style="margin-bottom: 40px;">
				<h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
					Contact
				</h2>
				<div class="contact-section-content address" style="line-height: 1.8; font-size: 16px;">
					{$mailingAddress|nl2br|strip_unsafe_html}
				</div>
			</div>
		{/if}

		{* Primary Contact *}
		{if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
			<div class="contact-section" style="margin-bottom: 40px;">
				<h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
					Principal Contact
				</h2>
				<div class="contact-section-content primary-contact" style="line-height: 1.8;">
					{if $contactName}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Name:</strong> {$contactName|escape}
						</div>
					{/if}

					{if $contactTitle}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Title:</strong> {$contactTitle|escape}
						</div>
					{/if}

					{if $contactAffiliation}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Affiliation:</strong> {$contactAffiliation|strip_unsafe_html}
						</div>
					{/if}

					{if $contactPhone}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Phone:</strong> <a href="tel:{$contactPhone|escape}">{$contactPhone|escape}</a>
						</div>
					{/if}

					{if $contactEmail}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Email:</strong> <a href="mailto:{$contactEmail|escape}">{$contactEmail|escape}</a>
						</div>
					{/if}
				</div>
			</div>
		{/if}

		{* Technical/Support Contact *}
		{if $supportName || $supportPhone || $supportEmail}
			<div class="contact-section" style="margin-bottom: 40px;">
				<h2 style="color: #2ecc71; font-size: 24px; font-weight: 600; margin-bottom: 20px;">
					Support Contact
				</h2>
				<div class="contact-section-content support-contact" style="line-height: 1.8;">
					{if $supportName}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Name:</strong> {$supportName|escape}
						</div>
					{/if}

					{if $supportPhone}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Phone:</strong> <a href="tel:{$supportPhone|escape}">{$supportPhone|escape}</a>
						</div>
					{/if}

					{if $supportEmail}
						<div class="contact-item" style="margin-bottom: 10px;">
							<strong>Email:</strong> <a href="mailto:{$supportEmail|escape}">{$supportEmail|escape}</a>
						</div>
					{/if}
				</div>
			</div>
		{/if}
		
	</div>
</div><!-- .content-wrapper -->

{include file="common/frontend/footer.tpl"}
