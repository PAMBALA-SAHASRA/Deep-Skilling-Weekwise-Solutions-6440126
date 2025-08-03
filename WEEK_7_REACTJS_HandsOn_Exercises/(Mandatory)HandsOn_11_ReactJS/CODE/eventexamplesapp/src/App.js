import React from 'react';
import Counter from './components/Counter';
import WelcomeButton from './components/WelcomeButton';
import ClickMessage from './components/ClickMessage';
import CurrencyConverter from './components/CurrencyConverter';

function App() {
  return (
    <div>
      <Counter />
      <WelcomeButton />
      <ClickMessage />
      <CurrencyConverter />
    </div>
  );
}

export default App;
