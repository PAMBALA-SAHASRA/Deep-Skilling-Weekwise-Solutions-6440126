import React, { useState } from 'react';
import GuestPage from './GuestPage';
import UserPage from './UserPage';

function LoginControl() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const handleLogin = () => setIsLoggedIn(true);
  const handleLogout = () => setIsLoggedIn(false);

  let button;
  let pageContent;

  if (isLoggedIn) {
    button = <button onClick={handleLogout}>Logout</button>;
    pageContent = <UserPage />;
  } else {
    button = <button onClick={handleLogin}>Login</button>;
    pageContent = <GuestPage />;
  }

  return (
    <div style={styles.fullPageCenter}>
      <div style={{ textAlign: 'center' }}>
        {pageContent}
        {button}
      </div>
    </div>
  );
}

const styles = {
  fullPageCenter: {
    height: '100vh',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
  }
};

export default LoginControl;
