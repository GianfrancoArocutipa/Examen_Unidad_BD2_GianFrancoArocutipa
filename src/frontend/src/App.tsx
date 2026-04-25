import { useEffect, useState } from 'react';

interface Evento {
  id: number;
  nombre: string;
  precio: number;
  stock: number;
}

function App() {
  const [eventos, setEventos] = useState<Evento[]>([]);

  useEffect(() => {
    // Simulación de carga de datos para el examen
    setEventos([
      { id: 1, nombre: "Concierto Rock UPT", precio: 150.0, stock: 50 },
      { id: 2, nombre: "Festival de Teatro", precio: 45.0, stock: 30 }
    ]);
  }, []);

  return (
    <div style={{ padding: '20px', backgroundColor: '#f4f4f4', minHeight: '100vh' }}>
      <header style={{ textAlign: 'center', marginBottom: '30px' }}>
        <h1 style={{ color: '#2c3e50' }}>SISTEMA DE VENTAS - EXAMEN UNIDAD 2</h1>
        <p><strong>Desarrollado por:</strong> Gianfranco Arocutipa</p>
      </header>

      <div style={{ display: 'flex', gap: '20px', justifyContent: 'center', flexWrap: 'wrap' }}>
        {eventos.map(e => (
          <div key={e.id} style={{ background: 'white', padding: '20px', borderRadius: '10px', boxShadow: '0 4px 6px rgba(0,0,0,0.1)', width: '250px' }}>
            <h3>{e.nombre}</h3>
            <p style={{ fontSize: '1.2em', color: '#27ae60' }}>Precio: S/ {e.precio}</p>
            <p>Stock: {e.stock}</p>
            <button style={{ width: '100%', padding: '10px', backgroundColor: '#2980b9', color: 'white', border: 'none', borderRadius: '5px', cursor: 'pointer' }}>
              Comprar Ticket
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}

export default App;