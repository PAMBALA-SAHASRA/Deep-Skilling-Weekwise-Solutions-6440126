import React from 'react';

function WelcomeButton() {
  const showWelcome = (msg) => {
    alert(msg);
  };

  return (
    <div>
      <button onClick={() => showWelcome("welcome")}>Say welcome</button>
    </div>
  );
}

export default WelcomeButton;
