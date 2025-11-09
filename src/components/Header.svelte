<script>
  import ThemeToggle from './ThemeToggle.svelte';
  import { siteConfig } from '../config/site.js';

  const { name, title, description, avatar, social } = siteConfig;
</script>

<section class="header-wrapper">
  <div class="header-content">
    <div class="header-actions">
      <ThemeToggle />
    </div>
    <img alt={name} src={avatar} class="header-avatar" />
    <h1>{name}</h1>
    <p class="header-title">{title}</p>
    <p class="about-text">
      {description}
    </p>
    <nav class="social-links" aria-label="Sosyal">
      {#each social as item}
        <a 
          href={item.href} 
          target="_blank" 
          rel="noreferrer noopener"
          class="social-badge"
          style="--badge-color: {item.color}"
        >
          {@html item.icon}
          <span>{item.label}</span>
        </a>
      {/each}
    </nav>
  </div>
</section>
