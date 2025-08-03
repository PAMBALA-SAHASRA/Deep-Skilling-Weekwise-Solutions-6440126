import React from 'react';
import CourseDetails from './components/CourseDetails';
import BookDetails from './components/BookDetails';
import BlogDetails from './components/BlogDetails';

function App() {
  return (
    <div style={styles.container}>
      <div style={styles.column}><CourseDetails /></div>
      <div style={styles.divider}></div>
      <div style={styles.column}><BookDetails /></div>
      <div style={styles.divider}></div>
      <div style={styles.column}><BlogDetails /></div>
    </div>
  );
}

const styles = {
  container: {
    display: 'flex',
    padding: '40px',
    justifyContent: 'center',
    gap: '20px',
  },
  column: {
    flex: 1,
    padding: '0 10px',
  },
  divider: {
    borderLeft: '4px solid green',
    height: 'auto'
  }
};

export default App;
