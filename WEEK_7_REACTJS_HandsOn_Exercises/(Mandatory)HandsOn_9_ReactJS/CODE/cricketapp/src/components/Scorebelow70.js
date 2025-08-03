import React from 'react';

function Scorebelow70({ players }) {
  const filtered = players.filter(player => player.score < 70);
  return (
    <ul>
      {filtered.map((player, index) => (
        <li key={index}>
          Mr. {player.name} {player.score}
        </li>
      ))}
    </ul>
  );
}

export default Scorebelow70;
