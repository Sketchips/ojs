{**
 * templates/frontend/components/sidebar.tpl
 *
 * Sidebar menu untuk halaman announcement dan about
 * Menggunakan struktur yang sama dengan home page
 *}

<div class="sidebar-menu">
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
</div>
