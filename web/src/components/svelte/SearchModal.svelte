<script lang="ts">
  import Search from '@src/icons/ui/Search.svelte';
  import portal from '@src/lib/portal';
  import type { Card } from '@src/types';
  import { onDestroy, onMount } from 'svelte';

  let { distros }: { distros: Card[] } = $props();

  let open = $state(false);
  let query = $state('');
  let selectedIndex = $state(0);
  let listEl = $state<HTMLUListElement | undefined>(undefined);

  const filtered = $derived(
    query.trim()
      ? distros.filter(
          ({ name, family, tag }) =>
            name.toLowerCase().includes(query.toLowerCase()) ||
            family.toLowerCase().includes(query.toLowerCase()) ||
            tag.toLowerCase().includes(query.toLowerCase())
        )
      : distros.slice(0, 5)
  );

  $effect(() => {
    if (query) selectedIndex = 0;
  });

  $effect(() => {
    if (open && listEl) {
      const item = listEl.children[selectedIndex] as HTMLElement;
      item?.scrollIntoView({ block: 'nearest' });
    }
  });

  function openModal() {
    open = true;
    query = '';
    selectedIndex = 0;
  }

  function closeModal() {
    open = false;
  }

  function handleKeydown(e: KeyboardEvent) {
    if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
      e.preventDefault();
      open ? closeModal() : openModal();
      return;
    }

    if (!open) return;

    if (e.key === 'Escape') closeModal();

    if (e.key === 'ArrowDown') {
      e.preventDefault();
      selectedIndex = (selectedIndex + 1) % filtered.length;
    }

    if (e.key === 'ArrowUp') {
      e.preventDefault();
      selectedIndex = (selectedIndex - 1 + filtered.length) % filtered.length;
    }

    if (e.key === 'Enter' && filtered[selectedIndex]) {
      const a = listEl?.querySelector(
        `[href="/${filtered[selectedIndex].slug}"]`
      ) as HTMLAnchorElement;
      a?.click();
      closeModal();
    }
  }

  onMount(() => {
    window.addEventListener('keydown', handleKeydown);
  });

  onDestroy(() => {
    window.removeEventListener('keydown', handleKeydown);
  });
</script>

<!-- Trigger mobile (<md) -->
<button
  type="button"
  onclick={openModal}
  class="flex cursor-pointer items-center justify-center rounded text-white md:hidden"
  aria-label="Open search">
  <Search class="size-6" />
</button>

<!-- Trigger desktop (md+)  -->
<button
  type="button"
  onclick={openModal}
  class="hidden w-full cursor-pointer items-center gap-2 rounded border border-edge bg-dark px-3
    py-2 text-base text-slate-400 transition-colors hover:bg-layer focus:outline-none md:flex"
  aria-label="Open search">
  <Search class="size-5" />
  <span class="flex-1 text-left">Search themes...</span>
  <kbd
    class="shrink-0 rounded border border-edge bg-layer px-2 py-0.5 text-sm font-semibold
    text-slate-400">
    Ctrl K
  </kbd>
</button>

<!-- Modal -->
{#if open}
  <div use:portal>
    <div
      role="presentation"
      class="fixed inset-0 z-90 bg-dark/60 backdrop-blur-sm"
      onclick={closeModal}>
    </div>

    <div
      role="dialog"
      aria-modal="true"
      aria-label="Search themes"
      class="fixed top-[15%] left-1/2 z-100 flex max-h-[80dvh] w-[calc(100%-2rem)] max-w-lg
        -translate-x-1/2 flex-col overflow-hidden rounded-xl border border-edge bg-layer">
      <div class="flex items-center gap-3 border-b border-edge px-4">
        <Search class="size-5 shrink-0 text-slate-400" />
        <!-- svelte-ignore a11y_autofocus -->
        <input
          autofocus
          type="search"
          bind:value={query}
          placeholder="Search themes, families, tags..."
          class="flex-1 bg-transparent py-4 text-base text-white outline-none
            placeholder:text-slate-400"
          aria-label="Search themes"
          autocomplete="off" />
      </div>

      {#if filtered.length > 0}
        <ul
          bind:this={listEl}
          role="listbox"
          aria-label="Search results"
          class="overflow-y-auto py-2">
          {#each filtered as distro, i}
            <li role="option" aria-selected={i === selectedIndex}>
              <a
                href="/{distro.slug}"
                onclick={closeModal}
                onmouseenter={() => (selectedIndex = i)}
                class="flex items-center gap-3 px-4 py-3 transition-colors
                  {i === selectedIndex ? 'bg-arch/10' : ' hover:bg-white/10'}">
                <img
                  src={distro.image.src}
                  alt={distro.imageAlt}
                  loading="lazy"
                  class="aspect-video h-15 w-auto shrink-0 rounded border border-edge
                    object-contain"
                  style="box-shadow: 0 0 6px {distro.color}77" />
                <div class="flex-1">
                  <p class="truncate text-base font-black">{distro.name} {distro.suffix}</p>
                  <p class="text-sm font-extralight text-slate-400">{distro.family}</p>
                </div>
                <span
                  class="shrink-0 rounded-full border px-1.5 py-0.5 text-xs md:text-sm"
                  style="color:{distro.color}; border-color:{distro.color}88;
                    background:{distro.color}44">
                  {distro.tag}
                </span>
              </a>
            </li>
          {/each}
        </ul>
      {:else}
        <p class="py-10 text-center text-base text-slate-400">
          No results for "<span class="text-white">{query}</span>"
        </p>
      {/if}
    </div>
  </div>
{/if}
