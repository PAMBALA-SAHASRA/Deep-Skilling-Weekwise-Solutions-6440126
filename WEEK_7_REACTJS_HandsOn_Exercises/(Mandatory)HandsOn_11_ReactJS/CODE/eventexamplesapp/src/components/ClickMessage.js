import React from 'react';

function ClickMessage() {
  const handleClick = (event) => {
    alert("I was clicked");
  };

  return (
    <div>
      <button onClick={handleClick}>Click on me</button>
    </div>
  );
}

export default ClickMessage;
