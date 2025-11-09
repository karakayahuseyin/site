<script>
  export let posts = [];

  const categoryMeta = {
    tech: { color: '#3b82f6', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="8 6 4 12 8 18"></polyline><polyline points="16 6 20 12 16 18"></polyline><line x1="12" y1="6" x2="12" y2="18"></line></svg>' },
    notes: { color: '#8b5cf6', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 2h9l5 5v15a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2z"/><path d="M14 2v6h6"/></svg>' },
    uav: { color: '#22c55e', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M2 12l9-3 3 9 2-6 6-2-9-3-2 6z"/></svg>' },
    cli: { color: '#0ea5e9', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="4 8 8 12 4 16"/><line x1="10" y1="16" x2="20" y2="16"/></svg>' },
    design: { color: '#f97316', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22c4.418 0 8-3.582 8-8a4 4 0 0 0-4-4H9a5 5 0 1 0 3 9z"/></svg>' },
    devops: { color: '#f59e0b', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 1 1-4 0v-.09a1.65 1.65 0 0 0-1-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 1 1 0-4h.09a1.65 1.65 0 0 0 1.51-1 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 1 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9c0 .69.28 1.35.78 1.82.22.21.22.55 0 .76A2.64 2.64 0 0 0 19.4 15z"/></svg>' },
    productivity: { color: '#14b8a6', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6L9 17l-5-5"/></svg>' },
    default: { color: '#64748b', icon: '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 7l-8 10-5-5"/></svg>' }
  };

  const metaFor = (cat) => categoryMeta[cat] || categoryMeta.default;
</script>

<section class="post-grid-wrapper">
  <h2>Son Yazılar</h2>
  {#if posts.length === 0}
    <p class="empty">Yakında…</p>
  {:else}
    <div class="post-grid" role="list">
      {#each posts as p}
        <article class="post-tile" role="listitem">
          <span class="tile-badge" style="--badge-bg: {metaFor(p.category).color}" aria-label={p.category || 'Kategori'}>
            <span class="badge-icon">{@html metaFor(p.category).icon}</span>
            <span class="badge-label">{p.category}</span>
          </span>
          <a href={p.url} class="tile-link" aria-label={p.title}>
            <div class="tile-header">
              <h3>{p.title}</h3>
              <time datetime={p.dateISO}>{p.dateHuman}</time>
            </div>
            <p class="excerpt">{p.excerpt}</p>
          </a>
        </article>
      {/each}
    </div>
  {/if}
</section>
