import React from 'react';

function OddPlayers({ team }) {
  const oddPlayers = team.filter((_, index) => index % 2 === 0);
  return (
    <ul>
      {oddPlayers.map((player, index) => (
        <li key={index}>
          {index === 0 && `First : ${player}`}
          {index === 2 && `Third : ${player}`}
          {index === 4 && `Fifth : ${player}`}
        </li>
      ))}
    </ul>
  );
}

export default OddPlayers;
