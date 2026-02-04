{**
 * templates/submission/complete.tpl
 *
 * Copyright (c) 2014-2022 Simon Fraser University
 * Copyright (c) 2003-2022 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * The page shown to the user when they submit their submission.
 *}
{extends file="layouts/backend.tpl"}

{block name="page"}
<style>
/* Modern Minimalist Submission Complete Styling */
.app__page.width--narrow {
    max-width: 700px !important;
    margin: 4rem auto !important;
    padding: 2rem !important;
}

.app__pageHeading--center.app__pageHeading--spacious {
    font-family: 'Poppins', 'Inter', sans-serif !important;
    font-size: 2rem !important;
    font-weight: 700 !important;
    color: #1a1a1a !important;
    margin: 0 0 2.5rem 0 !important;
    padding-bottom: 1.5rem !important;
    border-bottom: 3px solid #0d9488 !important;
    position: relative !important;
}

.app__pageHeading--center.app__pageHeading--spacious::before {
    content: '✓' !important;
    display: block !important;
    width: 60px !important;
    height: 60px !important;
    background: linear-gradient(135deg, #0d9488, #06b6d4) !important;
    color: white !important;
    border-radius: 50% !important;
    line-height: 60px !important;
    text-align: center !important;
    font-size: 2rem !important;
    margin: 0 auto 1.5rem !important;
    box-shadow: 0 4px 15px rgba(13, 148, 136, 0.3) !important;
}

.app__contentPanel {
    background: white !important;
    padding: 2.5rem !important;
    border-radius: 12px !important;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08) !important;
    border: 1px solid #e5e7eb !important;
}

.app__contentPanel p {
    font-family: 'Inter', sans-serif !important;
    font-size: 1rem !important;
    line-height: 1.7 !important;
    color: #4b5563 !important;
    margin-bottom: 1.25rem !important;
}

.app__contentPanel p:first-of-type {
    font-size: 1.1rem !important;
    color: #111827 !important;
    font-weight: 500 !important;
    margin-top: 0 !important;
}

.app__contentPanel p:nth-of-type(2) {
    font-weight: 600 !important;
    color: #1a1a1a !important;
    margin-bottom: 1rem !important;
}

.app__contentPanel ul {
    list-style: none !important;
    padding: 0 !important;
    margin: 1.5rem 0 0 0 !important;
}

.app__contentPanel ul li {
    margin-bottom: 1rem !important;
    padding: 0 !important;
}

.app__contentPanel ul li:last-child {
    margin-bottom: 0 !important;
}

.app__contentPanel ul li a {
    display: inline-flex !important;
    align-items: center !important;
    padding: 1rem 1.75rem !important;
    background: linear-gradient(135deg, #f8fafc, #f1f5f9) !important;
    color: #1a1a1a !important;
    text-decoration: none !important;
    border-radius: 8px !important;
    font-family: 'Inter', sans-serif !important;
    font-size: 0.95rem !important;
    font-weight: 600 !important;
    border: 2px solid #e2e8f0 !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
    width: 100% !important;
    position: relative !important;
    overflow: hidden !important;
}

.app__contentPanel ul li a::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: -100% !important;
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.5), transparent) !important;
    transition: left 0.5s !important;
}

.app__contentPanel ul li a:hover::before {
    left: 100% !important;
}

.app__contentPanel ul li a:hover {
    background: linear-gradient(135deg, #0d9488, #06b6d4) !important;
    color: white !important;
    border-color: #0d9488 !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 20px rgba(13, 148, 136, 0.25) !important;
}

.app__contentPanel ul li:nth-child(1) a::after {
    content: '📄' !important;
    margin-left: auto !important;
    font-size: 1.25rem !important;
    transition: transform 0.3s !important;
}

.app__contentPanel ul li:nth-child(2) a::after {
    content: '➕' !important;
    margin-left: auto !important;
    font-size: 1.25rem !important;
    transition: transform 0.3s !important;
}

.app__contentPanel ul li:nth-child(3) a::after {
    content: '🏠' !important;
    margin-left: auto !important;
    font-size: 1.25rem !important;
    transition: transform 0.3s !important;
}

.app__contentPanel ul li a:hover::after {
    transform: scale(1.2) !important;
}

/* Responsive */
@media (max-width: 768px) {
    .app__page.width--narrow {
        margin: 2rem auto !important;
        padding: 1rem !important;
    }
    
    .app__pageHeading--center.app__pageHeading--spacious {
        font-size: 1.5rem !important;
        margin-bottom: 2rem !important;
    }
    
    .app__pageHeading--center.app__pageHeading--spacious::before {
        width: 50px !important;
        height: 50px !important;
        line-height: 50px !important;
        font-size: 1.75rem !important;
    }
    
    .app__contentPanel {
        padding: 1.5rem !important;
    }
    
    .app__contentPanel ul li a {
        padding: 0.875rem 1.25rem !important;
        font-size: 0.9rem !important;
    }
}
</style>

	<h1 class="app__pageHeading app__pageHeading--center app__pageHeading--spacious">
		{translate key="submission.submit.submissionComplete"}
	</h1>

    <div class="app__contentPanel">
        <p>{translate key="submission.submit.whatNext.description"}</p>
        <p>{translate key="submission.submit.whatNext.forNow"}</p>
        <ul>
            <li><a href={$workflowUrl}>{translate key="submission.submit.whatNext.review"}</a></li>
            <li><a href={url page="submission"}>{translate key="submission.submit.whatNext.create"}</a></li>
            <li><a href={url page="main"}>{translate key="submission.submit.whatNext.return"}</a></li>
        </ul>
    </div>

{/block}
