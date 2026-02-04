{**
 * templates/frontend/pages/userRegisterComplete.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief A landing page displayed to users upon successful registration
 *}
{include file="frontend/components/header.tpl"}

<div class="page page_register_complete">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
	
	{* Success Card Container *}
	<div class="registration-success-container">
		
		{* Success Icon *}
		<div class="success-icon-wrapper">
			<svg class="success-icon" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
				<path d="M8 12L11 15L16 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
			</svg>
		</div>
		
		{* Success Title *}
		<h1 class="success-title">
			{translate key=$pageTitle}
		</h1>
		
		{* Success Message *}
		<div class="success-message">
			<p>
				{translate key="user.login.registrationComplete.instructions"}
			</p>
		</div>
		
		{* Action Cards *}
		<div class="action-cards-container">
			<h2 class="action-cards-title">What would you like to do next?</h2>
			
			<ul class="registration_complete_actions">
			{if array_intersect(array(\PKP\security\Role::ROLE_ID_MANAGER, \PKP\security\Role::ROLE_ID_SUB_EDITOR, \PKP\security\Role::ROLE_ID_ASSISTANT, \PKP\security\Role::ROLE_ID_REVIEWER), (array)$userRoles)}
				<li class="action-card view_submissions">
					<a href="{url page="main"}" class="action-card-link">
						<div class="action-card-icon">
							<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M9 12H15M9 16H15M17 21H7C5.89543 21 5 20.1046 5 19V5C5 3.89543 5.89543 3 7 3H12.5858C12.851 3 13.1054 3.10536 13.2929 3.29289L18.7071 8.70711C18.8946 8.89464 19 9.149 19 9.41421V19C19 20.1046 18.1046 21 17 21Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
						</div>
						<div class="action-card-content">
							<h3 class="action-card-title">{translate key="user.login.registrationComplete.manageSubmissions"}</h3>
							<p class="action-card-description">View and manage your submissions</p>
						</div>
						<div class="action-card-arrow">→</div>
					</a>
				</li>
			{/if}
			{if $currentContext}
				<li class="action-card new_submission">
					<a href="{url page="submission"}" class="action-card-link">
						<div class="action-card-icon">
							<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M12 5V19M5 12H19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
								<circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
							</svg>
						</div>
						<div class="action-card-content">
							<h3 class="action-card-title">{translate key="user.login.registrationComplete.newSubmission"}</h3>
							<p class="action-card-description">Start a new article submission</p>
						</div>
						<div class="action-card-arrow">→</div>
					</a>
				</li>
			{/if}
				<li class="action-card edit_profile">
					<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="user" op="profile"}" class="action-card-link">
						<div class="action-card-icon">
							<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<circle cx="12" cy="8" r="4" stroke="currentColor" stroke-width="2"/>
								<path d="M5 20C5 16.134 8.13401 13 12 13C15.866 13 19 16.134 19 20" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
							</svg>
						</div>
						<div class="action-card-content">
							<h3 class="action-card-title">{translate key="user.editMyProfile"}</h3>
							<p class="action-card-description">Update your profile information</p>
						</div>
						<div class="action-card-arrow">→</div>
					</a>
				</li>
				<li class="action-card browse">
					<a href="{url page="index"}" class="action-card-link">
						<div class="action-card-icon">
							<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M3 12L5 10M5 10L12 3L19 10M5 10V20C5 20.5523 5.44772 21 6 21H9M19 10L21 12M19 10V20C19 20.5523 18.5523 21 18 21H15M9 21C9.55228 21 10 20.5523 10 20V16C10 15.4477 10.4477 15 11 15H13C13.5523 15 14 15.4477 14 16V20C14 20.5523 14.4477 21 15 21M9 21H15" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
							</svg>
						</div>
						<div class="action-card-content">
							<h3 class="action-card-title">{translate key="user.login.registrationComplete.continueBrowsing"}</h3>
							<p class="action-card-description">Explore articles and publications</p>
						</div>
						<div class="action-card-arrow">→</div>
					</a>
				</li>
			</ul>
		</div>
		
	</div>
	
</div>

<style>
/* Registration Success Page Styling */
.registration-success-container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 40px 60px;
	background: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	text-align: center;
}

/* Success Icon */
.success-icon-wrapper {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}

.success-icon {
	width: 80px;
	height: 80px;
	color: #27ae60;
	animation: successPop 0.6s ease-out;
}

@keyframes successPop {
	0% {
		transform: scale(0);
		opacity: 0;
	}
	50% {
		transform: scale(1.1);
	}
	100% {
		transform: scale(1);
		opacity: 1;
	}
}

/* Success Title */
.success-title {
	font-size: 32px;
	font-weight: 700;
	color: #1a1a1a;
	margin-bottom: 20px;
	line-height: 1.3;
}

/* Success Message */
.success-message {
	margin-bottom: 40px;
}

.success-message p {
	font-size: 16px;
	line-height: 1.6;
	color: #555;
	margin: 0;
}

/* Action Cards Container */
.action-cards-container {
	margin-top: 50px;
}

.action-cards-title {
	font-size: 20px;
	font-weight: 600;
	color: #333;
	margin-bottom: 30px;
	text-align: center;
}

/* Action Cards List */
.registration_complete_actions {
	list-style: none;
	padding: 0;
	margin: 0;
	display: grid;
	gap: 20px;
}

.action-card {
	display: block;
	transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.action-card-link {
	display: flex;
	align-items: center;
	gap: 20px;
	padding: 20px;
	background: #f8f9fa;
	border: 2px solid #e9ecef;
	border-radius: 8px;
	text-decoration: none;
	transition: all 0.3s ease;
	position: relative;
	overflow: hidden;
}

.action-card-link::before {
	content: '';
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	width: 4px;
	background: #27ae60;
	transform: scaleY(0);
	transition: transform 0.3s ease;
}

.action-card-link:hover {
	border-color: #27ae60;
	background: #ffffff;
	box-shadow: 0 6px 20px rgba(39, 174, 96, 0.15);
	transform: translateX(5px);
}

.action-card-link:hover::before {
	transform: scaleY(1);
}

/* Action Card Icon */
.action-card-icon {
	flex: 0 0 50px;
	width: 50px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #e8f5e9;
	border-radius: 8px;
	transition: all 0.3s ease;
}

.action-card-icon svg {
	width: 28px;
	height: 28px;
	color: #27ae60;
}

.action-card-link:hover .action-card-icon {
	background: #27ae60;
	transform: scale(1.1);
}

.action-card-link:hover .action-card-icon svg {
	color: #ffffff;
}

/* Action Card Content */
.action-card-content {
	flex: 1;
	text-align: left;
}

.action-card-title {
	font-size: 16px;
	font-weight: 600;
	color: #1a1a1a;
	margin: 0 0 5px 0;
	line-height: 1.4;
}

.action-card-description {
	font-size: 14px;
	color: #666;
	margin: 0;
	line-height: 1.5;
}

/* Action Card Arrow */
.action-card-arrow {
	flex: 0 0 30px;
	font-size: 24px;
	color: #27ae60;
	transition: transform 0.3s ease;
}

.action-card-link:hover .action-card-arrow {
	transform: translateX(5px);
}

/* Responsive */
@media (max-width: 768px) {
	.registration-success-container {
		margin: 30px 20px;
		padding: 30px 20px;
	}
	
	.success-icon {
		width: 60px;
		height: 60px;
	}
	
	.success-title {
		font-size: 24px;
	}
	
	.action-cards-title {
		font-size: 18px;
	}
	
	.action-card-link {
		padding: 15px;
		gap: 15px;
	}
	
	.action-card-icon {
		flex: 0 0 40px;
		width: 40px;
		height: 40px;
	}
	
	.action-card-icon svg {
		width: 22px;
		height: 22px;
	}
	
	.action-card-title {
		font-size: 15px;
	}
	
	.action-card-description {
		font-size: 13px;
	}
}
</style>

{include file="frontend/components/footer.tpl"}
