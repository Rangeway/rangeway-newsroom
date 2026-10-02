(() => {
  const menu = document.querySelector('.menu-toggle');
  const panel = document.querySelector('#mobile-menu');
  if (menu && panel) {
    const close = () => { panel.hidden = true; menu.setAttribute('aria-expanded', 'false'); };
    menu.addEventListener('click', () => {
      const open = menu.getAttribute('aria-expanded') === 'true';
      panel.hidden = open;
      menu.setAttribute('aria-expanded', String(!open));
    });
    panel.querySelectorAll('a').forEach(link => link.addEventListener('click', close));
    document.addEventListener('keydown', event => {
      if (event.key === 'Escape' && !panel.hidden) { close(); menu.focus(); }
    });
  }
  document.querySelectorAll('[data-filter]').forEach(button => {
    button.addEventListener('click', () => {
      const grid = button.closest('section');
      grid.querySelectorAll('[data-filter]').forEach(candidate => candidate.setAttribute('aria-pressed', String(candidate === button)));
      grid.querySelectorAll('[data-category]').forEach(item => {
        item.hidden = button.dataset.filter !== 'All' && item.dataset.category !== button.dataset.filter;
      });
    });
  });
  document.querySelectorAll('[data-article-toc]').forEach(aside => {
    const body = aside.parentElement.querySelector('.article__body');
    if (!body) { aside.hidden = true; return; }
    const headings = body.querySelectorAll('h2, h3');
    if (!headings.length) { aside.hidden = true; aside.parentElement.classList.add('reading-layout--no-toc'); return; }
    const used = new Set(Array.from(document.querySelectorAll('[id]')).map(node => node.id));
    headings.forEach(heading => {
      if (!heading.id) {
        const base = heading.textContent.trim().toLowerCase().normalize('NFKD').replace(/[\u0300-\u036f]/g, '').replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '') || 'section';
        let unique = base, n = 2;
        while (used.has(unique)) unique = `${base}-${n++}`;
        heading.id = unique;
        used.add(unique);
      }
      const link = document.createElement('a');
      link.href = `#${encodeURIComponent(heading.id)}`;
      link.textContent = heading.textContent.trim();
      if (heading.tagName === 'H3') link.className = 'contents__sub';
      aside.appendChild(link);
    });
  });
  document.querySelectorAll('[data-copy-target]').forEach(button => {
    button.addEventListener('click', () => {
      const target = document.querySelector(button.getAttribute('data-copy-target'));
      if (!target || !navigator.clipboard) return;
      navigator.clipboard.writeText(target.textContent.trim()).then(() => {
        const original = button.textContent;
        button.textContent = 'Copied!';
        setTimeout(() => { button.textContent = original; }, 1800);
      });
    });
  });
})();
