<script lang="ts">
  import DownloadZip from '@components/svelte/DownloadZip.svelte';
  import type { Card } from '@src/types';

  interface Props extends Card {}

  let { slug, name, suffix, color, tag, image, imageAlt }: Props = $props();
  const fullName = $derived([name, suffix].filter(Boolean).join(' '));
</script>

<article
  class="flex flex-col overflow-hidden rounded-xl border border-edge bg-layer transition-all
    duration-300 hover:border-white/20">
  <div class="relative overflow-hidden">
    <img
      src={image.src}
      alt={imageAlt}
      width="480"
      height="270"
      loading="lazy"
      decoding="async"
      class="aspect-video w-full object-cover" />

    <span
      class="absolute top-3 left-3 rounded-full border px-2 py-0.5 text-sm font-semibold"
      style="color:{color}; border-color:{color}66; background:{color}22">
      {tag}
    </span>
  </div>

  <div class="flex flex-1 flex-col gap-3 p-4">
    <p class="truncate text-lg font-bold text-white">{fullName}</p>

    <div class="mt-auto flex items-center gap-2">
      <a
        href="/{slug}"
        class="flex-1 rounded-lg border border-edge py-2 text-center text-sm font-bold
          text-slate-400 uppercase transition-colors hover:border-edge hover:text-white">
        Details
      </a>
      <DownloadZip {slug} {name} />
    </div>
  </div>
</article>
