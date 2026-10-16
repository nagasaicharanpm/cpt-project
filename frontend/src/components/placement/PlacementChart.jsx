export default function PlacementChart({ stats = {} }) {
  const data = Object.entries(stats)
    .map(([name, value]) => ({
      name: name.replaceAll('_', ' '),
      value: Number(value) || 0,
    }))
    .filter(({ value }) => value >= 0);
  const maximum = Math.max(...data.map(({ value }) => value), 1);

  if (data.length === 0) {
    return <p className="text-muted mb-0">No placement statistics available.</p>;
  }

  return (
    <div className="d-flex align-items-end gap-3" style={{ height: 280 }} aria-label="Placement statistics chart">
      {data.map(({ name, value }) => (
        <div className="d-flex flex-column align-items-center flex-fill h-100" key={name}>
          <span className="small fw-semibold mb-1">{value}</span>
          <div className="d-flex align-items-end flex-grow-1 w-100">
            <div
              className="bg-primary rounded-top w-100"
              style={{ height: `${Math.max((value / maximum) * 100, value ? 4 : 0)}%` }}
              title={`${name}: ${value}`}
            />
          </div>
          <span className="small text-muted text-capitalize text-center mt-2">{name}</span>
        </div>
      ))}
    </div>
  );
}
