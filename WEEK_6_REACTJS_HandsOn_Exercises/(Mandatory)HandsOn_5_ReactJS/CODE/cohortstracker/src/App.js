import React from "react";
import CohortDetails from "./CohortDetails";

const cohorts = [
  {
    cohortCode: "INTADMDF10",
    track: ".NET FSD",
    startDate: "22-Feb-2022",
    status: "Scheduled",
    coach: "Aathma",
    trainer: "Jojo Jose",
  },
  {
    cohortCode: "ADM21JF014",
    track: "Java FSD",
    startDate: "10-Sep-2021",
    status: "Ongoing",
    coach: "Apoorv",
    trainer: "Elisa Smith",
  },
  {
    cohortCode: "CDBJF21025",
    track: "Java FSD",
    startDate: "24-Dec-2021",
    status: "Ongoing",
    coach: "Aathma",
    trainer: "John Doe",
  },
];

function App() {
  return (
    <div className="App" style={{ textAlign: "center" }}>
      <h1>Cohorts Details</h1>
      <div
        style={{
          display: "flex",
          flexWrap: "wrap",
          justifyContent: "center",
          gap: "20px",
          padding: "20px",
        }}
      >
        {cohorts.map((cohort, index) => (
          <CohortDetails key={index} cohort={cohort} />
        ))}
      </div>
    </div>
  );
}

export default App;
S