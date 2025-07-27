import React from 'react';
import '../Stylesheets/mystyle.css';

function CalculateScore(props) {
  const percentage = (props.total / props.maxMarks) * 100;

  return (
    <div className="score-container">
      <h2 className="heading">Student Details:</h2>

      <p><span className="label name-label">Name:</span> <span className="value name-value">{props.name}</span></p>
      <p><span className="label school-label">School:</span> <span className="value school-value">{props.school}</span></p>
      <p><span className="label total-label">Total:</span> <span className="value total-value">{props.total} Marks</span></p>
      <p><span className="label score-label">Score:</span> <span className="value score-value">{percentage.toFixed(2)}%</span></p>
    </div>
  );
}

export default CalculateScore;
