// Floating pill nav: scroll state + mobile dropdown
(() => {
    const wrap = document.querySelector('.nav-wrap');
    const toggle = document.querySelector('[data-toggle]');
    const mobile = document.querySelector('[data-mobile]');

    if (wrap) {
        const onScroll = () => {
            if (window.scrollY > 40) {
                wrap.classList.add('is-scrolled');
            } else {
                wrap.classList.remove('is-scrolled');
            }
        };
        onScroll();
        window.addEventListener('scroll', onScroll, { passive: true });
    }

    if (toggle && mobile) {
        const setOpen = (open) => {
            mobile.hidden = !open;
            toggle.setAttribute('aria-expanded', String(open));
            document.body.style.overflow = open ? 'hidden' : '';
        };

        toggle.addEventListener('click', (e) => {
            e.stopPropagation();
            setOpen(mobile.hidden);
        });

        document.addEventListener('click', (e) => {
            if (mobile.hidden) return;
            if (!mobile.contains(e.target) && !toggle.contains(e.target)) {
                setOpen(false);
            }
        });

        mobile.querySelectorAll('a').forEach((link) => {
            link.addEventListener('click', () => setOpen(false));
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && !mobile.hidden) setOpen(false);
        });
    }
})();

// Reveal on scroll
(() => {
    if (!('IntersectionObserver' in window)) {
        document.querySelectorAll('.reveal').forEach((el) => el.classList.add('is-visible'));
        return;
    }
    const io = new IntersectionObserver(
        (entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('is-visible');
                    io.unobserve(entry.target);
                }
            });
        },
        { threshold: 0.15, rootMargin: '0px 0px -60px 0px' }
    );
    document.querySelectorAll('.reveal').forEach((el) => io.observe(el));
})();

// Smooth scroll for in-page anchors
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href === '#' || href === '#main-content') return;
        const target = document.querySelector(href);
        if (target) {
            e.preventDefault();
            target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
    });
});
