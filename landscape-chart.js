
document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('aiLandscapeChart');
  if (!el || !window.Chart) return;
  const ctx = el.getContext('2d');
  new Chart(ctx, {
    type: 'scatter',
    data: {
      datasets: [
        {label: 'Aramco', data: [{x: 9.5, y: 5.5}]},
        {label: 'ExxonMobil', data: [{x: 8.5, y: 6.5}]},
        {label: 'Chevron', data: [{x: 8.0, y: 6.0}]},
        {label: 'Shell', data: [{x: 8.5, y: 7.0}]},
        {label: 'BP', data: [{x: 7.5, y: 7.0}]},
        {label: 'TotalEnergies', data: [{x: 8.0, y: 7.5}]},
        {label: 'Equinor', data: [{x: 8.5, y: 8.0}]},
        {label: 'ConocoPhillips', data: [{x: 7.5, y: 6.5}]},
        {label: 'Sinopec', data: [{x: 7.0, y: 5.5}]},
        {label: 'PetroChina', data: [{x: 7.5, y: 5.0}]},
        {label: 'Well-Tegra (Bridge)', data: [{x: 8.2, y: 9.5}]}
      ]
    },
    options: {
      responsive: true,
      plugins: {
        legend: { position: 'bottom' },
        tooltip: {
          callbacks: {
            label: (ctx) => `${ctx.dataset.label}: AI Maturity ${ctx.raw.x}, Interoperability ${ctx.raw.y}`
          }
        }
      },
      scales: {
        x: { title: { display: true, text: 'AI Maturity' }, min: 0, max: 10 },
        y: { title: { display: true, text: 'Data Interoperability' }, min: 0, max: 10 }
      }
    }
  });
});
