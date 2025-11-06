<?php
/* Smarty version 4.3.1, created on 2025-11-05 04:30:13
  from 'app:frontendpagesabout.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.1',
  'unifunc' => 'content_690ad2d579b429_13102179',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cb59ba72e0e986feec9a52ef595eb9a41c15df09' => 
    array (
      0 => 'app:frontendpagesabout.tpl',
      1 => 1762309266,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:common/frontend/footer.tpl' => 1,
  ),
),false)) {
function content_690ad2d579b429_13102179 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitle'=>"about.aboutContext"), 0, false);
?>

<div class="homepage-hero">
	<div class="hero-content">
		<h1>Jurnal Riptek</h1>
		<p class="subtitle">Badan Riset dan Inovasi Daerah Kota Semarang</p>
	</div>
	<div class="hero-image">
		<img src="<?php echo $_smarty_tpl->tpl_vars['publicFilesDir']->value;?>
/semarang-city.png" alt="Semarang City" onerror="this.style.display='none'">
	</div>
</div>

<div class="content-wrapper">
	
		<aside class="sidebar-menu">
		<ul class="sidebar-menu-list">
			<li class="sidebar-menu-item">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"about",'op'=>"editorialTeam"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">Editorial Team</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"about",'op'=>"editorialPolicies"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">Peer-Review Process</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"about",'op'=>"submissions"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">Focus And Scope</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"about",'op'=>"submissions"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">Section Policies</a>
			</li>
			<li class="sidebar-menu-item">
				<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"about",'op'=>"submissions"),$_smarty_tpl ) );?>
" class="sidebar-menu-link">Author Guidelines</a>
			</li>
		</ul>
		
				<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
			<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA - Science and Technology Index" style="max-width: 100%; height: auto;">
		</div>
	</aside>

		<div id="main-content" class="page page_about main-content-area">
		
				<div class="about-content-wrapper">
			<?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedData('about');?>

		</div>
		
	</div><!-- .page -->

</div><!-- .content-wrapper -->

<?php $_smarty_tpl->_subTemplateRender("app:common/frontend/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
