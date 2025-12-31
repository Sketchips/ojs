/**
 * ============================================================================
 * MODERN OJS THEME - ENHANCED INTERACTIONS
 * ============================================================================
 * JavaScript untuk menambah interaktivitas pada theme modern
 * - Smooth scroll animations
 * - Header scroll effects
 * - Carousel enhancements
 * - Search bar animations
 * - Loading animations
 * ============================================================================
 */

(function($) {
    'use strict';
    
    // ========================================================================
    // 1. HEADER SCROLL EFFECTS
    // ========================================================================
    
    /**
     * Add 'scrolled' class to navbar when scrolling down
     * This triggers the compact header style
     */
    function handleHeaderScroll() {
        const $navbar = $('.navbar, header.navbar');
        const scrollThreshold = 50;
        
        $(window).on('scroll', function() {
            if ($(this).scrollTop() > scrollThreshold) {
                $navbar.addClass('scrolled');
            } else {
                $navbar.removeClass('scrolled');
            }
        });
    }
    
    
    // ========================================================================
    // 2. SMOOTH SCROLL FOR ANCHOR LINKS
    // ========================================================================
    
    /**
     * Smooth scroll to anchor links with offset for fixed header
     */
    function initSmoothScroll() {
        $('a[href^="#"]').on('click', function(event) {
            const target = $(this.getAttribute('href'));
            
            if (target.length) {
                event.preventDefault();
                
                $('html, body').stop().animate({
                    scrollTop: target.offset().top - 80 // Offset for fixed header
                }, 1000, 'easeInOutCubic');
            }
        });
    }
    
    
    // ========================================================================
    // 3. SEARCH BAR ENHANCEMENTS
    // ========================================================================
    
    /**
     * Enhanced search bar with animations and interactions
     */
    function enhanceSearchBar() {
        const $searchInput = $('.navbar-form input[type="search"], .search_form input');
        const $searchForm = $('.navbar-form, .search_form');
        
        // Focus animation
        $searchInput.on('focus', function() {
            $(this).parent().addClass('search-active');
            
            // Add pulsing animation to search button
            $(this).siblings('button').addClass('pulse');
        });
        
        // Blur animation
        $searchInput.on('blur', function() {
            if ($(this).val() === '') {
                $(this).parent().removeClass('search-active');
                $(this).siblings('button').removeClass('pulse');
            }
        });
        
        // Real-time search suggestion (placeholder for future enhancement)
        $searchInput.on('input', function() {
            const query = $(this).val();
            
            if (query.length >= 3) {
                // Trigger search suggestions
                // console.log('Search query:', query);
                // You can implement AJAX search here
            }
        });
    }
    
    
    // ========================================================================
    // 4. CAROUSEL ENHANCEMENTS
    // ========================================================================
    
    /**
     * Enhanced carousel with additional features
     */
    function enhanceCarousel() {
        const $carousel = $('.carousel');
        
        if ($carousel.length) {
            // Initialize carousel with custom settings
            $carousel.carousel({
                interval: 5000,      // Auto-slide every 5 seconds
                pause: 'hover',      // Pause on hover
                wrap: true,          // Enable looping
                keyboard: true       // Enable keyboard navigation
            });
            
            // Add swipe support for mobile (if touch events available)
            if ('ontouchstart' in window) {
                enableCarouselSwipe($carousel);
            }
            
            // Pause carousel when user is inactive
            let userInactive = false;
            let inactivityTimer;
            
            $(document).on('mousemove keypress scroll', function() {
                clearTimeout(inactivityTimer);
                userInactive = false;
                $carousel.carousel('cycle');
                
                inactivityTimer = setTimeout(function() {
                    userInactive = true;
                    $carousel.carousel('pause');
                }, 60000); // Pause after 1 minute of inactivity
            });
        }
    }
    
    /**
     * Enable swipe gestures for carousel on touch devices
     */
    function enableCarouselSwipe($carousel) {
        let touchStartX = 0;
        let touchEndX = 0;
        
        $carousel.on('touchstart', function(e) {
            touchStartX = e.changedTouches[0].screenX;
        });
        
        $carousel.on('touchend', function(e) {
            touchEndX = e.changedTouches[0].screenX;
            handleSwipe();
        });
        
        function handleSwipe() {
            const swipeThreshold = 50;
            
            if (touchEndX < touchStartX - swipeThreshold) {
                // Swipe left - next slide
                $carousel.carousel('next');
            }
            
            if (touchEndX > touchStartX + swipeThreshold) {
                // Swipe right - previous slide
                $carousel.carousel('prev');
            }
        }
    }
    
    
    // ========================================================================
    // 5. ARTICLE CARDS ANIMATIONS
    // ========================================================================
    
    /**
     * Animate article cards on scroll (fade in)
     */
    function animateArticleCards() {
        const $articles = $('.article, .article-summary');
        
        if ($articles.length) {
            // Add initial state
            $articles.css({
                opacity: 0,
                transform: 'translateY(30px)'
            });
            
            // Animate on scroll
            $(window).on('scroll', function() {
                $articles.each(function() {
                    const $article = $(this);
                    const articleTop = $article.offset().top;
                    const scrollBottom = $(window).scrollTop() + $(window).height();
                    
                    if (scrollBottom > articleTop + 100) {
                        $article.css({
                            opacity: 1,
                            transform: 'translateY(0)',
                            transition: 'all 0.6s ease-out'
                        });
                    }
                });
            }).trigger('scroll'); // Trigger on load
        }
    }
    
    
    // ========================================================================
    // 6. MOBILE MENU ENHANCEMENTS
    // ========================================================================
    
    /**
     * Enhanced mobile navigation menu with backdrop
     */
    function enhanceMobileMenu() {
        const $navToggle = $('.navbar-toggle');
        const $navMenu = $('#nav-menu');
        const $body = $('body');
        
        // Create backdrop element if it doesn't exist
        if ($('.nav-backdrop').length === 0) {
            $body.append('<div class="nav-backdrop"></div>');
        }
        const $backdrop = $('.nav-backdrop');
        
        // Toggle menu and backdrop
        $navToggle.on('click', function(e) {
            e.stopPropagation();
            const isOpen = $navMenu.hasClass('in') || $navMenu.hasClass('show');
            
            if (isOpen) {
                closeMenu();
            } else {
                openMenu();
            }
            
            $(this).toggleClass('active');
        });
        
        // Close menu when clicking backdrop
        $backdrop.on('click', function() {
            closeMenu();
            $navToggle.removeClass('active');
        });
        
        // Close menu when clicking outside
        $(document).on('click', function(e) {
            if (!$(e.target).closest('.navbar').length && 
                !$(e.target).closest('#nav-menu').length) {
                if ($navMenu.hasClass('in') || $navMenu.hasClass('show')) {
                    closeMenu();
                    $navToggle.removeClass('active');
                }
            }
        });
        
        // Close menu when clicking on a link
        $navMenu.find('a').on('click', function() {
            if ($(window).width() < 768) {
                closeMenu();
                $navToggle.removeClass('active');
            }
        });
        
        // Helper functions
        function openMenu() {
            $navMenu.addClass('in show');
            $backdrop.addClass('show');
            $body.addClass('menu-open');
        }
        
        function closeMenu() {
            $navMenu.removeClass('in show');
            $backdrop.removeClass('show');
            $body.removeClass('menu-open');
        }
    }
    
    
    // ========================================================================
    // 6B. MOBILE SIDEBAR NAVIGATION FIX (v10.4)
    // ========================================================================
    
    /**
     * Fix mobile sidebar: make navbar-toggle clickable when sidebar is open
     * Add backdrop and click-outside-to-close functionality
     * v10.4: Navbar-toggle moves with sidebar animation
     */
    function enhanceMobileSidebar() {
        const $navToggle = $('.navbar-toggle');
        const $sidebar = $('.sidebar-menu');
        const $body = $('body');
        
        // Only run on mobile
        if ($(window).width() >= 768) {
            return;
        }
        
        // Create sidebar backdrop if it doesn't exist
        if ($('.sidebar-backdrop').length === 0) {
            $body.append('<div class="sidebar-backdrop"></div>');
        }
        const $sidebarBackdrop = $('.sidebar-backdrop');
        
        // Track sidebar state
        let sidebarOpen = false;
        
        // Toggle sidebar when navbar-toggle is clicked
        $navToggle.on('click', function(e) {
            e.stopPropagation();
            e.preventDefault();
            
            sidebarOpen = !sidebarOpen;
            
            if (sidebarOpen) {
                openSidebar();
            } else {
                closeSidebar();
            }
        });
        
        // Close sidebar when clicking backdrop
        $sidebarBackdrop.on('click', function() {
            closeSidebar();
        });
        
        // Close sidebar when clicking outside
        $(document).on('click', function(e) {
            if (sidebarOpen && 
                !$(e.target).closest('.sidebar-menu').length && 
                !$(e.target).closest('.navbar-toggle').length) {
                closeSidebar();
            }
        });
        
        // Close sidebar when clicking a link inside
        $sidebar.find('a').on('click', function() {
            if (sidebarOpen) {
                closeSidebar();
            }
        });
        
        // Helper functions
        function openSidebar() {
            sidebarOpen = true;
            $sidebar.addClass('sidebar-open');
            $sidebarBackdrop.addClass('show');
            $body.addClass('sidebar-menu-open');
            $navToggle.addClass('active');
            
            // Animate toggle button to the right
            $navToggle.css({
                'left': '295px',           // 280px sidebar + 15px gap
                'transition': 'left 0.3s ease'
            });
        }
        
        function closeSidebar() {
            sidebarOpen = false;
            $sidebar.removeClass('sidebar-open');
            $sidebarBackdrop.removeClass('show');
            $body.removeClass('sidebar-menu-open');
            $navToggle.removeClass('active');
            
            // Animate toggle button back to left
            $navToggle.css({
                'left': '15px',
                'transition': 'left 0.3s ease'
            });
        }
        
        // Re-initialize on window resize
        $(window).on('resize', function() {
            if ($(window).width() >= 768) {
                closeSidebar();
            }
        });
    }
    
    
    // ========================================================================
    // 7. LOADING ANIMATIONS
    // ========================================================================
    
    /**
     * Show loading animation on page load
     */
    function initLoadingAnimation() {
        // Add loading class to body
        $('body').addClass('loading');
        
        // Remove loading class when page is fully loaded
        $(window).on('load', function() {
            setTimeout(function() {
                $('body').removeClass('loading').addClass('loaded');
            }, 500);
        });
    }
    
    
    // ========================================================================
    // 8. TOOLTIP & POPOVER INITIALIZATION
    // ========================================================================
    
    /**
     * Initialize Bootstrap tooltips and popovers
     */
    function initTooltipsPopovers() {
        // Initialize tooltips
        $('[data-toggle="tooltip"]').tooltip({
            container: 'body',
            animation: true,
            delay: { show: 300, hide: 100 }
        });
        
        // Initialize popovers
        $('[data-toggle="popover"]').popover({
            container: 'body',
            animation: true,
            trigger: 'hover'
        });
    }
    
    
    // ========================================================================
    // 9. IMAGE LAZY LOADING
    // ========================================================================
    
    /**
     * Lazy load images for better performance
     */
    function initLazyLoading() {
        const $lazyImages = $('img[data-src]');
        
        if ($lazyImages.length) {
            $(window).on('scroll', function() {
                $lazyImages.each(function() {
                    const $img = $(this);
                    const imgTop = $img.offset().top;
                    const scrollBottom = $(window).scrollTop() + $(window).height();
                    
                    if (scrollBottom > imgTop) {
                        const src = $img.attr('data-src');
                        $img.attr('src', src).removeAttr('data-src');
                    }
                });
            }).trigger('scroll');
        }
    }
    
    
    // ========================================================================
    // 10. BACK TO TOP BUTTON
    // ========================================================================
    
    /**
     * Add and handle back to top button
     */
    function initBackToTop() {
        // Create back to top button
        const $backToTop = $('<button>', {
            id: 'backToTop',
            class: 'btn btn-primary',
            html: '<span class="glyphicon glyphicon-chevron-up"></span>',
            css: {
                position: 'fixed',
                bottom: '30px',
                right: '30px',
                width: '50px',
                height: '50px',
                borderRadius: '50%',
                display: 'none',
                zIndex: 9999,
                boxShadow: '0 4px 12px rgba(0,0,0,0.2)',
                transition: 'all 0.3s ease'
            }
        });
        
        // Append to body
        $('body').append($backToTop);
        
        // Show/hide on scroll
        $(window).on('scroll', function() {
            if ($(this).scrollTop() > 300) {
                $backToTop.fadeIn();
            } else {
                $backToTop.fadeOut();
            }
        });
        
        // Scroll to top on click
        $backToTop.on('click', function() {
            $('html, body').animate({
                scrollTop: 0
            }, 800, 'easeInOutCubic');
        });
    }
    
    
    // ========================================================================
    // 11. FORM VALIDATION ENHANCEMENTS
    // ========================================================================
    
    /**
     * Enhanced form validation with visual feedback
     */
    function enhanceFormValidation() {
        $('form').on('submit', function(e) {
            const $form = $(this);
            const $requiredFields = $form.find('[required]');
            let isValid = true;
            
            $requiredFields.each(function() {
                const $field = $(this);
                
                if (!$field.val()) {
                    isValid = false;
                    $field.addClass('error').parent().addClass('has-error');
                } else {
                    $field.removeClass('error').parent().removeClass('has-error');
                }
            });
            
            if (!isValid) {
                e.preventDefault();
                
                // Scroll to first error
                const $firstError = $form.find('.error').first();
                if ($firstError.length) {
                    $('html, body').animate({
                        scrollTop: $firstError.offset().top - 100
                    }, 500);
                }
            }
        });
    }
    
    
    // ========================================================================
    // 12. KEYBOARD SHORTCUTS
    // ========================================================================
    
    /**
     * Add useful keyboard shortcuts
     */
    function initKeyboardShortcuts() {
        $(document).on('keydown', function(e) {
            // Ctrl/Cmd + K - Focus search
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
                e.preventDefault();
                $('.navbar-form input, .search_form input').focus();
            }
            
            // Escape - Close modals/menus
            if (e.key === 'Escape') {
                $('.navbar-collapse').collapse('hide');
                $('.modal').modal('hide');
            }
        });
    }
    
    
    // ========================================================================
    // 13. PERFORMANCE MONITORING
    // ========================================================================
    
    /**
     * Monitor and log performance metrics
     */
    function monitorPerformance() {
        if (window.performance && window.performance.timing) {
            $(window).on('load', function() {
                setTimeout(function() {
                    const perfData = window.performance.timing;
                    const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
                    const connectTime = perfData.responseEnd - perfData.requestStart;
                    const renderTime = perfData.domComplete - perfData.domLoading;
                    
                    console.log('⚡ Performance Metrics:');
                    console.log('Page Load Time:', pageLoadTime + 'ms');
                    console.log('Connect Time:', connectTime + 'ms');
                    console.log('Render Time:', renderTime + 'ms');
                }, 0);
            });
        }
    }
    
    
    // ========================================================================
    // INITIALIZATION
    // ========================================================================
    
    /**
     * Initialize all enhancements when document is ready
     */
    $(document).ready(function() {
        console.log('🎨 Modern OJS Theme - Initializing...');
        
        // Initialize all features
        handleHeaderScroll();
        initSmoothScroll();
        enhanceSearchBar();
        enhanceCarousel();
        animateArticleCards();
        enhanceMobileMenu();
        enhanceMobileSidebar();           // NEW: Fix mobile sidebar bug
        initLoadingAnimation();
        initTooltipsPopovers();
        initLazyLoading();
        initBackToTop();
        enhanceFormValidation();
        initKeyboardShortcuts();
        
        // Performance monitoring (optional - comment out in production)
        // monitorPerformance();
        
        console.log('✅ Modern OJS Theme - Ready!');
    });
    
    
    // ========================================================================
    // CUSTOM EASING FUNCTIONS
    // ========================================================================
    
    /**
     * Add custom easing for smooth animations
     */
    $.extend($.easing, {
        easeInOutCubic: function(x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t + 2) + b;
        }
    });
    
})(jQuery);


// ============================================================================
// VANILLA JS ENHANCEMENTS (No jQuery dependency)
// ============================================================================

/**
 * Add viewport height CSS variable for mobile browsers
 * This fixes the 100vh issue on mobile browsers
 */
function setVhVariable() {
    const vh = window.innerHeight * 0.01;
    document.documentElement.style.setProperty('--vh', `${vh}px`);
}

// Set on load and resize
window.addEventListener('load', setVhVariable);
window.addEventListener('resize', setVhVariable);


/**
 * Detect touch device and add class to body
 */
if ('ontouchstart' in window) {
    document.body.classList.add('touch-device');
} else {
    document.body.classList.add('no-touch');
}


/**
 * Prevent carousel from auto-sliding when user is viewing content
 */
document.addEventListener('visibilitychange', function() {
    const carousel = document.querySelector('.carousel');
    
    if (carousel) {
        if (document.hidden) {
            // Page is hidden - pause carousel
            $(carousel).carousel('pause');
        } else {
            // Page is visible - resume carousel
            $(carousel).carousel('cycle');
        }
    }
});


/**
 * Log theme info to console
 */
console.log(`
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║           🎨 MODERN OJS THEME - v1.0.0                        ║
║                                                               ║
║   Features:                                                   ║
║   ✓ Responsive Design                                        ║
║   ✓ Modern Gradient Colors                                   ║
║   ✓ Smooth Animations                                        ║
║   ✓ Enhanced Carousel                                        ║
║   ✓ Smart Search Bar                                         ║
║   ✓ Touch Support                                            ║
║   ✓ Keyboard Shortcuts                                       ║
║                                                               ║
║   Keyboard Shortcuts:                                         ║
║   • Ctrl/Cmd + K  →  Focus Search                            ║
║   • Escape        →  Close Menus                             ║
║   • Arrow Keys    →  Navigate Carousel                       ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
`);
