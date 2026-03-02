<script lang="ts">
  interface Props<T extends string> {
    tags: T[];
    activeTag: T;
    onchange: (tag: T) => void;
  }

  let { tags, activeTag, onchange }: Props<string> = $props();
</script>

<div
  class="flex w-full items-center justify-between gap-2 rounded-xl border border-edge bg-layer p-2 md:w-auto">
  {#each tags as tag}
    <button
      type="button"
      onclick={() => onchange(tag)}
      class="cursor-pointer rounded-lg px-4 py-1.5 text-sm font-bold uppercase transition-colors
        {activeTag === tag ? 'bg-arch/10 text-arch' : 'text-slate-400 hover:text-white'}">
      {tag}
    </button>
  {/each}
</div>
