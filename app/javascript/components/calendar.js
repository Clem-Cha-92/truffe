const initCalendar = () => {
  const calendars = document.querySelectorAll('.days');
  calendars.forEach((calendar) => {
    
    const days = calendar.querySelectorAll('.day');
    
    let number = 0;
    days.forEach((day) => {
      day.addEventListener('click', () => {
        day.classList.toggle('active');
        const actives = calendar.querySelectorAll('.active');  
        if (actives.length === 2) {
          number = day.innerHTML - actives[0].innerHTML + 3;
          for (let i = actives[0].innerHTML; i < number; i++) { 
            days[i].classList.add('active2');
          }
        } else if (actives.length > 2) {
          days.forEach((day) => {
            day.classList.remove('active');
            day.classList.remove('active2');
          });
        }
      }); 
    });
  });
}

export { initCalendar };