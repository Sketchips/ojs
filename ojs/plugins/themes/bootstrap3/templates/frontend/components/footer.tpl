{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2024 Simon Fraser University
 * Copyright (c) 2003-2024 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</main>

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-8 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				{$sidebarCode}
			</aside><!-- pkp_sidebar.left -->
		{/if}
	{/if}
	</div><!-- pkp_structure_content -->

	<footer class="footer footer-riptek" role="contentinfo">
		<div class="footer-overlay"></div>
		<img class="footer-landmark" src="{$baseUrl}/plugins/themes/bootstrap3/styles/fonts/Semarang.png" alt="landmark illustration" aria-hidden="true" role="presentation" />
		<div class="container-fluid footer-container">
			<div class="footer-content">
				<h3 class="footer-title">REDAKSI JURNAL RIPTEK</h3>
				<div class="footer-info">
					<p class="footer-org"><strong>Badan Riset dan Inovasi Daerah (BRIDA) Kota Semarang</strong></p>
					<div class="footer-details">
						<p class="footer-address">
							<i class="fa fa-map-marker"></i> 
							Gedung Pandanaran Lantai I<br>
							Jl. Pemuda No.175, Sekayu, Kec. Semarang Tengah, Kota<br>
							Semarang, Jawa Tengah 50132
						</p>
						<p class="footer-contact">
							<i class="fa fa-envelope"></i> 
							<a href="mailto:riptek@semarangkota.go.id">riptek@semarangkota.go.id</a>
						</p>
						<p class="footer-contact">
							<i class="fa fa-globe"></i> 
							<a href="https://www.riptek.semarangkota.go.id" target="_blank" rel="noopener">http riptek smg</a>
						</p>
						<p class="footer-contact">
							<i class="fa fa-phone"></i> 
							Telp. (024) 3584037
						</p>
						<p class="footer-contact">
							<i class="fa fa-fax"></i> 
							Fax. (024) 3584038
						</p>
					</div>
				</div>
			</div>
		</div><!-- .container-fluid -->
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
