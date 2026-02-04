document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.btn-youtube').forEach(btn => {
    btn.addEventListener('click', () => {
      window.open('https://www.youtube.com/', '_blank');
    });
  });
});
