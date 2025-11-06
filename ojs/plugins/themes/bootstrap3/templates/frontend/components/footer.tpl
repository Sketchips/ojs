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

	<footer class="footer" role="contentinfo">

		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="footer-content">
						<h3 class="footer-title">REDAKSI JURNAL RIPTEK</h3>
						<div class="footer-info">
							<p><strong>Badan Riset dan Inovasi Daerah (BRIDA) Kota Semarang</strong></p>
							<p>Jl. Pemuda No.175, Sekayu, Kec. Semarang Tengah,</p>
							<p>Kota Semarang, Jawa Tengah 50132</p>
							<p>Email: <a href="mailto:riptek.brida@semarangkota.go.id">riptek.brida@semarangkota.go.id</a></p>
							<p>Web: <a href="https://www.riptek.semarangkota.go.id" target="_blank">https://www.riptek.semarangkota.go.id</a></p>
							<p>Telp: (024) 3545532</p>
						</div>
					</div>
				</div>
			</div> <!-- .row -->
		</div><!-- .container -->
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
