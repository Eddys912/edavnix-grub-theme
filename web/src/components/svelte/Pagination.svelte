<script lang="ts">
  import ChevronLeft from '@src/icons/ui/ChevronLeft.svelte';
  import ChevronRight from '@src/icons/ui/ChevronRight.svelte';

  interface Props {
    currentPage: number;
    totalPages: number;
    onchange: (page: number) => void;
  }

  let { currentPage, totalPages, onchange }: Props = $props();

  function getPages(current: number, total: number): Array<number | '...'> {
    if (total <= 7) return Array.from({ length: total }, (_, i) => i + 1);

    const set = new Set(
      [1, total, current, current - 1, current + 1].filter((p) => p >= 1 && p <= total)
    );
    const sorted = [...set].sort((a, b) => a - b);

    const result: Array<number | '...'> = [];
    for (let i = 0; i < sorted.length; i++) {
      if (i > 0 && sorted[i] - sorted[i - 1] > 1) result.push('...');
      result.push(sorted[i]);
    }
    return result;
  }

  const pages = $derived(getPages(currentPage, totalPages));
</script>

<nav aria-label="Pagination" class="flex items-center justify-center gap-2">
  <button
    type="button"
    onclick={() => onchange(currentPage - 1)}
    disabled={currentPage === 1}
    aria-label="Previous page"
    class="flex size-9 items-center justify-center rounded border text-sm font-bold
      transition-all disabled:pointer-events-none disabled:opacity-30
      {currentPage > 1
      ? 'cursor-pointer border-edge text-slate-400 hover:border-arch hover:text-arch'
      : 'border-edge text-slate-400'}">
    <ChevronLeft class="size-4" />
  </button>

  {#each pages as p}
    {#if p === '...'}
      <span class="flex size-9 items-center justify-center text-slate-400 select-none">…</span>
    {:else}
      <button
        type="button"
        onclick={() => onchange(p)}
        aria-label="Page {p}"
        aria-current={p === currentPage ? 'page' : undefined}
        class="flex size-9 cursor-pointer items-center justify-center rounded border text-sm
          font-bold transition-all {p === currentPage
          ? 'border-arch bg-arch text-dark'
          : 'border-edge text-slate-400 hover:border-arch hover:text-arch'}">
        {p}
      </button>
    {/if}
  {/each}

  <button
    type="button"
    onclick={() => onchange(currentPage + 1)}
    disabled={currentPage === totalPages}
    aria-label="Next page"
    class="flex size-9 items-center justify-center rounded border text-sm font-bold
      transition-all disabled:pointer-events-none disabled:opacity-30
      {currentPage < totalPages
      ? 'cursor-pointer border-edge text-slate-400 hover:border-arch hover:text-arch'
      : 'border-edge text-slate-400'}">
    <ChevronRight class="size-4" />
  </button>
</nav>
