{**
 * templates/frontend/components/aboutSidebar.tpl
 *
 * Reusable sidebar for About section pages
 *
 * @param $activePage string The current active page (editorialTeam, peerReview, focusAndScope, sectionPolicies, authorGuidelines)
 *}

<aside class="sidebar-menu">
	<ul class="sidebar-menu-list">
		<li class="sidebar-menu-item {if $activePage == 'editorialTeam'}active{/if}">
			<a href="{url page="about" op="editorialTeam"}" class="sidebar-menu-link">
				Editorial Team
			</a>
		</li>
		<li class="sidebar-menu-item {if $activePage == 'peerReview'}active{/if}">
			<a href="{url page="about" op="peerReview"}" class="sidebar-menu-link">
				Peer-Review Process
			</a>
		</li>
		<li class="sidebar-menu-item {if $activePage == 'focusAndScope'}active{/if}">
			<a href="{url page="about" op="focusAndScope"}" class="sidebar-menu-link">
				Focus and Scope
			</a>
		</li>
		<li class="sidebar-menu-item {if $activePage == 'sectionPolicies'}active{/if}">
			<a href="{url page="about" op="sectionPolicies"}" class="sidebar-menu-link">
				Section Policies
			</a>
		</li>
		<li class="sidebar-menu-item {if $activePage == 'authorGuidelines'}active{/if}">
			<a href="{url page="about" op="authorGuidelines"}" class="sidebar-menu-link">
				Author Guidelines
			</a>
		</li>
	</ul>
	
	{* SINTA Badge *}
	<div class="sidebar-sinta-badge" style="padding: 20px 0; text-align: center;">
		<img src="https://sinta.kemdikbud.go.id/assets/img/site/logo.png" alt="SINTA" style="max-width: 100%; height: auto;">
	</div>
</aside>
