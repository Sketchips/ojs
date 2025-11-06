<?php
/* Smarty version 4.3.1, created on 2025-11-05 04:30:19
  from 'app:frontendpagesindexJournal.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_690ad2db072b08_98837000',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'e64e579388e5615e11e939b12134d6ae8679eba6' => 
    array (
      0 => 'app:frontendpagesindexJournal.tpl',
      1 => 1762227636,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/objects/announcement_summary.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_690ad2db072b08_98837000 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.count.php','function'=>'smarty_modifier_count',),));
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitleTranslated'=>$_smarty_tpl->tpl_vars['currentJournal']->value->getLocalizedName()), 0, false);
?>

<!-- Homepage Hero Section (1440px x 544px, positioned at top: 71px) -->
<section class="homepage-hero">
	<div class="hero-content">
		<h1>Jurnal Riptek</h1>
		<p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
	</div>
	<div class="hero-image">
		<?php if ($_smarty_tpl->tpl_vars['homepageImage']->value) {?>
			<img src="<?php echo $_smarty_tpl->tpl_vars['publicFilesDir']->value;?>
/<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['homepageImage']->value['uploadName'],"url" ));?>
" alt="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['homepageImageAltText']->value ));?>
">
		<?php } else { ?>
			<!-- Default Semarang City illustration -->
			<img src="https://ojsimg.netlify.app/semarang-city-hero.png" alt="Semarang City">
		<?php }?>
	</div>
</section>

<div id="main-content" class="page_index_journal">

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Templates::Index::journal"),$_smarty_tpl ) );?>

	
	<!-- Content Wrapper with Sidebar -->
	<div class="content-wrapper">
		
		<!-- Sidebar with Green Buttons (320px x 62px each) -->
		<aside class="sidebar-menu">
			<ul class="sidebar-menu-list">
				<li class="sidebar-menu-item">
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"about",'op'=>"editorialTeam"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">
						Editorial Team
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"about",'op'=>"submissions"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">
						Peer-Review Process
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"about"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">
						Focus and Scope
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"about",'op'=>"editorialPolicies"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">
						Section Policies
					</a>
				</li>
				<li class="sidebar-menu-item">
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>\PKP\core\PKPApplication::ROUTE_PAGE,'page'=>"about",'op'=>"submissions"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">
						Author Guidelines
					</a>
				</li>
			</ul>
			
			<!-- SINTA Badge - Moved below Author Guidelines -->
			<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
				<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA - Science and Technology Index" style="max-width: 100%; height: auto;">
			</div>
		</aside>
		
		<!-- Main Content Area -->
		<main class="main-content-area">

	<?php if ($_smarty_tpl->tpl_vars['journalDescription']->value) {?>
		<div class="journal-description">
			<h2>JURNAL RIPTEK</h2>
			<?php echo $_smarty_tpl->tpl_vars['journalDescription']->value;?>

		</div>
	<?php }?>
	
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
		<p>E-ISSN 2716-3482 P-ISSN 1978-8320</p>
	</section>
	
	<section class="info-section">
		<h3>Publishing Frequency</h3>
		<p>Riptek publishes articles biannually in June and November. All papers are published as soon as they have been accepted.</p>
	</section>
	
	<section class="info-section">
		<h3>Abstracting/Indexing</h3>
		<p>Get an overview of abstracting/indexing information.</p>
	</section>

		<?php if ($_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value && smarty_modifier_count($_smarty_tpl->tpl_vars['announcements']->value)) {?>
		<section class="cmp_announcements media">
			<header class="page-header">
				<h2>
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"announcement.announcements"),$_smarty_tpl ) );?>

				</h2>
			</header>
			<div class="media-list">
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['announcements']->value, 'announcement', false, NULL, 'announcements', array (
  'iteration' => true,
));
$_smarty_tpl->tpl_vars['announcement']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['announcement']->value) {
$_smarty_tpl->tpl_vars['announcement']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']++;
?>
					<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_announcements']->value['iteration'] : null) > $_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value) {?>
						<?php break 1;?>
					<?php }?>
					<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/announcement_summary.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('heading'=>"h3"), 0, true);
?>
				<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</div>
		</section>
	<?php }?>


		
		<?php if ($_smarty_tpl->tpl_vars['additionalHomeContent']->value) {?>
		<section class="additional_content">
			<?php echo $_smarty_tpl->tpl_vars['additionalHomeContent']->value;?>

		</section>
	<?php }?>
	
		</main><!-- .main-content-area -->
		
	</div><!-- .content-wrapper -->

</div><!-- .page -->

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
