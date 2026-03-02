<script lang="ts">
  interface Props {
    installCmd: string;
    slug: string;
  }

  let { installCmd, slug }: Props = $props();

  type Tab = 'install' | 'description' | 'details';
  let active = $state<Tab>('install');

  // El contenido de description y details llega via slots nombrados
</script>

<div>
  <!-- Tab nav -->
  <div class="flex items-center gap-1 rounded-xl bg-layer p-1">
    {#each [['install', 'Install'], ['description', 'Description'], ['details', 'Details']] as const as [id, label]}
      <button
        type="button"
        onclick={() => (active = id)}
        aria-selected={active === id}
        class="rounded-lg px-4 py-1.5 text-xs font-bold uppercase transition-colors
               {active === id ? 'bg-arch text-dark' : 'text-slate-400 hover:text-white'}">
        {label}
      </button>
    {/each}
  </div>

  <!-- Tab panels -->
  <div class="mt-4">
    {#if active === 'install'}
      <slot name="install" />
    {:else if active === 'description'}
      <slot name="description" />
    {:else}
      <slot name="details" />
    {/if}
  </div>
</div>
