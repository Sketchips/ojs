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
</div>
