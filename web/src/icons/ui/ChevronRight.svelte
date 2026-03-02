<script lang="ts">
  interface Props {
    class?: string;
  }

  let { class: className, ...props }: Props = $props();
</script>

<svg
  class={className}
  {...props}
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 24 24"
  fill="none"
  stroke="currentColor"
  stroke-width="2"
  stroke-linecap="round"
  stroke-linejoin="round">
  <path d="m9 18 6-6-6-6"></path>
</svg>
