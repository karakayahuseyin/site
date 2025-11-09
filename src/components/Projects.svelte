<script>
  export let projects = [];

  const langIcons = {
    js: { label: 'JavaScript', slug: 'javascript', bg: '#F7DF1E' },
    ts: { label: 'TypeScript', slug: 'typescript', bg: '#3178C6' },
    svelte: { label: 'Svelte', slug: 'svelte', bg: '#FF3E00' },
    docker: { label: 'Docker', slug: 'docker', bg: '#0DB7ED' },
    bash: { label: 'Bash', slug: 'bash', bg: '#3E4446' },
    yaml: { label: 'YAML', slug: 'yaml', bg: '#CB171E' },
    python: { label: 'Python', slug: 'python', bg: '#3776AB' },
    cpp: { label: 'C++', slug: 'cplusplus', bg: '#00599C' }
  };

  const deviconUrl = (slug) =>
    `https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/${slug}/${slug}-plain.svg`;
</script>

<section class="projects-wrapper">
  <h2>Öne Çıkan Projeler</h2>
  {#if projects.length === 0}
    <p class="empty">Yakında…</p>
  {:else}
    <div class="project-grid" role="list">
      {#each projects as pr}
        <article class="project-tile" role="listitem">
          <a href={pr.url} class="project-link" aria-label={pr.title}>
            <div class="project-header">
              <h3>{pr.title}</h3>
              <time datetime={pr.dateISO}>{pr.dateHuman}</time>
            </div>
            <ul class="project-tags" aria-label="Etiketler">
              {#each pr.tags as t}
                <li>{t}</li>
              {/each}
            </ul>
            {#if pr.langs?.length}
              <div class="project-badges" aria-label="Teknolojiler">
                {#each pr.langs as l}
                  {#if langIcons[l]?.slug}
                    <span class="lang-badge" title={langIcons[l].label} aria-label={langIcons[l].label} style="--lang-bg: {langIcons[l].bg}">
                      <img src={deviconUrl(langIcons[l].slug)}
                           alt={langIcons[l].label}
                           width="18" height="18" />
                    </span>
                  {:else}
                    <span class="lang-badge" title={l} aria-label={l}></span>
                  {/if}
                {/each}
              </div>
            {/if}
          </a>
        </article>
      {/each}
    </div>
  {/if}
</section>
