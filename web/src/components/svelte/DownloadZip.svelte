<script lang="ts">
  import Download from '@src/icons/ui/Download.svelte';

  interface Props {
    slug?: string;
    name: string;
  }

  let { slug, name }: Props = $props();

  let loading = $state(false);

  async function handleDownload() {
    if (loading) return;
    loading = true;
    try {
      // TODO: implementar lógica de construcción del ZIP
      // - Obtener recursos desde el repo de GitHub
      // - Construir el ZIP con los archivos del tema
      // - Disparar la descarga
      console.log(`Downloading theme: ${slug}`);
    } catch (err) {
      console.error('Download failed:', err);
    } finally {
      loading = false;
    }
  }
</script>

<button
  type="button"
  onclick={handleDownload}
  disabled={loading}
  aria-label="Download {name} theme"
  class="flex items-center gap-1.5 rounded-lg border border-arch/40 bg-arch/10 px-3 py-2
         text-sm font-bold text-arch uppercase transition-colors
         hover:border-arch hover:bg-arch/20 disabled:cursor-not-allowed disabled:opacity-50">
  {#if loading}
    <svg class="size-3.5 animate-spin" viewBox="0 0 24 24" fill="none">
      <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" />
      <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8z" />
    </svg>
    <span>Loading</span>
  {:else}
    <Download class="size-3.5" />
    <span>Download</span>
  {/if}
</button>
