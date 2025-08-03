import React from 'react';

const OfficeDetails = () => {
  const office = {
    name: "DBS",
    rent: 50000,
    address: "Chennai",
    image: "https://assets.iwgplc.com/image/upload/f_auto,q_auto,w_834,h_522,c_fill/CentreImagery/2051/2051_3.jpg"
  };

  const rentStyle = {
    color: office.rent > 60000 ? 'green' : 'red',
    fontWeight: 'bold'
  };

  return (
    <div style={{ textAlign: 'center', padding: '20px' }}>
      <h1 style={{ fontWeight: 'bold' }}>Office Space , at Affordable Range</h1>
      <img src={office.image} alt={office.name} width="300" height="200" style={{ margin: '20px' }} />
      <h2>Name: {office.name}</h2>
      <p style={rentStyle}>Rent: Rs. {office.rent}</p>
      <p><strong>Address:</strong> {office.address}</p>
    </div>
  );
};

export default OfficeDetails;
