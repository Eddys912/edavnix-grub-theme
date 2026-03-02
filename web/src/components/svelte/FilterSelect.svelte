<script lang="ts">
  import ChevronDown from '@src/icons/ui/ChevronDown.svelte';

  interface Props<T extends string> {
    options: T[];
    activeOption: T;
    onchange: (activeOption: T) => void;
  }

  let { options, activeOption, onchange }: Props<string> = $props();

  let open = $state(false);
  let triggerEl = $state<HTMLButtonElement | undefined>(undefined);

  function select(option: typeof activeOption) {
    onchange(option);
    open = false;
  }

  function handleKeydown(e: KeyboardEvent) {
    if (e.key === 'Escape') {
      open = false;
      triggerEl?.focus();
    }
  }

  function handleOutside(node: HTMLElement) {
    function onClick(e: MouseEvent) {
      if (!node.contains(e.target as Node)) open = false;
    }
    document.addEventListener('click', onClick, true);
    return { destroy: () => document.removeEventListener('click', onClick, true) };
  }
</script>

<div class="relative" use:handleOutside>
  <button
    bind:this={triggerEl}
    type="button"
    onclick={() => (open = !open)}
    onkeydown={handleKeydown}
    aria-haspopup="listbox"
    aria-expanded={open}
    class="flex cursor-pointer items-center gap-2 rounded-xl border border-edge bg-layer px-4 py-3.5
      text-sm font-bold text-slate-400 uppercase transition-colors hover:text-white">
    {activeOption}
    <ChevronDown class="size-3" />
  </button>

  {#if open}
    <ul
      role="listbox"
      aria-label="Filter by option"
      onkeydown={handleKeydown}
      class="absolute top-full left-0 z-50 mt-2 max-h-44 w-auto overflow-y-auto rounded-xl border border-edge
        bg-layer [scrollbar-color:rgba(255,255,255,0.1)_transparent] [scrollbar-width:thin]">
      {#each options as option}
        <li role="option" aria-selected={activeOption === option}>
          <button
            type="button"
            onclick={() => select(option)}
            class="w-full cursor-pointer px-4 py-2 text-left text-sm font-bold uppercase transition-colors
                   {activeOption === option
              ? 'bg-arch/10 text-arch'
              : 'text-slate-400 hover:bg-white/10 hover:text-white'}">
            {option}
          </button>
        </li>
      {/each}
    </ul>
  {/if}
</div>
