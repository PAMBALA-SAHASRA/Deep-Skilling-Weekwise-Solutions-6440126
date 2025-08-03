import React from 'react';

function EvenPlayers({ team }) {
  const evenPlayers = team.filter((_, index) => index % 2 !== 0);
  return (
    <ul>
      {evenPlayers.map((player, index) => (
        <li key={index}>
          {index === 0 && `Second : ${player}`}
          {index === 1 && `Fourth : ${player}`}
          {index === 2 && `Sixth : ${player}`}
        </li>
      ))}
    </ul>
  );
}

export default EvenPlayers;
