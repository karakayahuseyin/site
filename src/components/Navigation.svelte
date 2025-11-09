<script>
  const pages = [
    { href: '/', label: 'Ana Sayfa' },
    { href: '/about', label: 'Hakkımda' },
    { href: '/posts', label: 'Yazılar' },
    { href: '/projects', label: 'Projeler' },
    { href: '/uses', label: 'Kullandıklarım' }
  ];
</script>

<nav class="nav-card">
  {#each pages as page}
    <a href={page.href} class="nav-link">
      {page.label}
    </a>
  {/each}
</nav>
