<script lang="ts">
  import Pagination from '@components/svelte/Pagination.svelte';
  import ThemeCard from '@components/svelte/ThemeCard.svelte';
  import FilterBar from '@src/components/svelte/FilterBar.svelte';
  import FilterSelect from '@src/components/svelte/FilterSelect.svelte';
  import type { Card } from '@src/types';

  let { items }: { items: Card[] } = $props();

  const PAGE_SIZE = 9;

  const tags = $derived<Array<Card['tag'] | 'all'>>([
    'all',
    ...[...new Set(items.map((i) => i.tag))].sort(),
  ]);

  const families = $derived<Array<Card['family'] | 'all'>>([
    'all',
    ...[...new Set(items.map((i) => i.family))].sort(),
  ]);

  let activeTag = $state<Card['tag'] | 'all'>('all');
  let activeFamily = $state<Card['family'] | 'all'>('all');
  let currentPage = $state(1);

  const filtered = $derived(
    items.filter(
      (i) =>
        (activeTag === 'all' || i.tag === activeTag) &&
        (activeFamily === 'all' || i.family === activeFamily)
    )
  );

  const totalPages = $derived(Math.max(1, Math.ceil(filtered.length / PAGE_SIZE)));
  const paginated = $derived(
    filtered.slice((currentPage - 1) * PAGE_SIZE, currentPage * PAGE_SIZE)
  );

  function setTag(tag: string) {
    activeTag = tag as Card['tag'] | 'all';
    currentPage = 1;
  }
  function setFamily(family: string) {
    activeFamily = family as Card['family'] | 'all';
    currentPage = 1;
  }

  function goTo(page: number) {
    currentPage = page;
    const el = document.getElementById('theme-gallery');
    if (!el) return;
    const header = document.querySelector<HTMLElement>('header');
    const headerH = header?.offsetHeight ?? 0;
    const top = el.getBoundingClientRect().top + window.scrollY - headerH - 24;
    window.scrollTo({ top, behavior: 'smooth' });
  }
</script>

<div id="theme-gallery" class="mb-6 flex flex-wrap items-center gap-4">
  <FilterBar {tags} {activeTag} onchange={setTag} />
  <FilterSelect options={families} activeOption={activeFamily} onchange={setFamily} />
  <span class="ml-auto text-sm font-bold text-white uppercase">
    {filtered.length} theme{filtered.length !== 1 ? 's' : ''}
  </span>
</div>

{#if paginated.length > 0}
  <ul class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
    {#each paginated as item (item.slug)}
      <li>
        <ThemeCard {...item} />
      </li>
    {/each}
  </ul>
{:else}
  <div class="py-20 text-center">
    <p class="text-base font-bold text-white">No themes match the selected filters.</p>
    <button
      type="button"
      onclick={() => {
        activeTag = 'all';
        activeFamily = 'all';
        currentPage = 1;
      }}
      class="mt-3 text-sm font-bold text-arch hover:underline">
      Clear filters
    </button>
  </div>
{/if}

{#if totalPages > 1}
  <div class="mt-6">
    <Pagination {currentPage} {totalPages} onchange={goTo} />
  </div>
{/if}
