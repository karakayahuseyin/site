<script>
  import Header from './components/Header.svelte';
  import Navigation from './components/Navigation.svelte';
  import PostList from './components/PostList.svelte';
  import SpacerFooter from './components/SpacerFooter.svelte';
  import Projects from './components/Projects.svelte';
  import posts from './data/posts.js';
  import projects from './data/projects.js';
</script>

<div class="page-wrapper">
  <div class="page-container">
    <Header />
    <Navigation />
    <div class="container">
      <main class="content">
        <PostList {posts} />
        <Projects {projects} />
      </main>
    </div>
  </div>
  <SpacerFooter />
</div>
