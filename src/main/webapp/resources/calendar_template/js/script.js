document.addEventListener('DOMContentLoaded', function () {
  const calendarEl = document.getElementById('calendar');
  const myModal = new bootstrap.Modal(document.getElementById('form'));
  const dangerAlert = document.getElementById('danger-alert');
  const close = document.querySelector('.btn-close');
 
  const calendar = new FullCalendar.Calendar(calendarEl, {
    header: {
      left: '',     // fc-center의 header를 fc-left로 옮김 (제목)
      center: 'prev, title, next',        // fc-center 비워두기
      right: '', // fc-left에 있던 버튼들을 fc-right로 옮김
    },
    plugins: ['dayGrid', 'interaction'],
    allDay: false,
    editable: true,
    selectable: true,
    unselectAuto: false,
    displayEventTime: false,
    events: null,
    eventRender: function(info) {
      info.el.addEventListener('contextmenu', function(e) {
        e.preventDefault();
        let existingMenu = document.querySelector('.context-menu');
        existingMenu && existingMenu.remove();
        let menu = document.createElement('div');
        menu.className = 'context-menu';
        menu.innerHTML = `<ul>
        <li><i class="fas fa-edit"></i>Edit</li>
        <li><i class="fas fa-trash-alt"></i>Delete</li>
        </ul>`;

        const eventIndex = myEvents.findIndex(event => event.id === info.event.id);
        document.body.appendChild(menu);
        menu.style.top = e.pageY + 'px';
        menu.style.left = e.pageX + 'px';

        // Edit context menu
        menu.querySelector('li:first-child').addEventListener('click', function() {
          menu.remove();
          const editModal = new bootstrap.Modal(document.getElementById('form'));
          const modalTitle = document.getElementById('modal-title');
          const titleInput = document.getElementById('event-title');
          const startDateInput = document.getElementById('start-date');
          const endDateInput = document.getElementById('end-date');
          const colorInput = document.getElementById('event-color');
          const submitButton = document.getElementById('submit-button');
          modalTitle.innerHTML = 'Edit Event';
          titleInput.value = info.event.title;
          startDateInput.value = moment(info.event.start).format('YYYY-MM-DD');
          endDateInput.value = moment(info.event.end, 'YYYY-MM-DD').subtract(1, 'day').format('YYYY-MM-DD');
          colorInput.value = info.event.backgroundColor;
          submitButton.innerHTML = 'Save Changes';

          editModal.show();
          submitButton.classList.remove('btn-success')
          submitButton.classList.add('btn-primary')

          // Edit button
          submitButton.addEventListener('click', function() {
            const updatedEvents = {
              id: info.event.id,
              title: titleInput.value,
              start: startDateInput.value,
              end: moment(endDateInput.value, 'YYYY-MM-DD').add(1, 'day').format('YYYY-MM-DD'),
              backgroundColor: colorInput.value
            }

            if (updatedEvents.end <= updatedEvents.start) { // add if statement to check end date
              dangerAlert.style.display = 'block';
              return;
            }

            const eventIndex = myEvents.findIndex(event => event.id === updatedEvents.id);
            myEvents.splice(eventIndex, 1, updatedEvents);

            localStorage.setItem('events', JSON.stringify(myEvents));

            // Update the event in the calendar
            const calendarEvent = calendar.getEventById(info.event.id);
            calendarEvent.setProp('title', updatedEvents.title);
            calendarEvent.setStart(updatedEvents.start);
            calendarEvent.setEnd(updatedEvents.end);
            calendarEvent.setProp('backgroundColor', updatedEvents.backgroundColor);

            editModal.hide();
          })
        });

        // Delete menu
        menu.querySelector('li:last-child').addEventListener('click', function() {
          const deleteModal = new bootstrap.Modal(document.getElementById('delete-modal'));
          const modalBody = document.getElementById('delete-modal-body');
          const cancelModal = document.getElementById('cancel-button');
          modalBody.innerHTML = `Are you sure you want to delete <b>"${info.event.title}"</b>`
          deleteModal.show();

          const deleteButton = document.getElementById('delete-button');
          deleteButton.addEventListener('click', function () {
            myEvents.splice(eventIndex, 1);
            localStorage.setItem('events', JSON.stringify(myEvents));
            calendar.getEventById(info.event.id).remove();
            deleteModal.hide();
            menu.remove();
          });

          cancelModal.addEventListener('click', function () { 
            deleteModal.hide();
          });
        });

        document.addEventListener('click', function() {
          menu.remove();
        });
      });
    },

    /*eventDrop: function(info) { 
      let myEvents = JSON.parse(localStorage.getItem('events')) || [];
      const eventIndex = myEvents.findIndex(event => event.id === info.event.id);
      const updatedEvent = {
        ...myEvents[eventIndex],
        id: info.event.id, 
        title: info.event.title,
        start: moment(info.event.start).format('YYYY-MM-DD'),
        end: moment(info.event.end).format('YYYY-MM-DD'),
        backgroundColor: info.event.backgroundColor
      };
      myEvents.splice(eventIndex, 1, updatedEvent); // Replace old event data with updated event data
      localStorage.setItem('events', JSON.stringify(myEvents));
      console.log(updatedEvent);
=======
    }*/  
  });

  calendar.on('select', function(info) {
    const startDateInput = document.getElementById('start-date');
    const endDateInput = document.getElementById('end-date');
    startDateInput.value = info.startStr;
    const endDate = moment(info.endStr, 'YYYY-MM-DD').subtract(1, 'day').format('YYYY-MM-DD');
    endDateInput.value = endDate;
    if(startDateInput.value === endDate) {
      endDateInput.value = '';
    }
  });

  calendar.render();
  
  // class가 fc-left인 <div>에 width: 265px을 추가
  const fcLeftEl = document.querySelector('.fc-left');
  if (fcLeftEl) {
    fcLeftEl.style.width = '265px';
  }

  // 휴가신청 버튼을 툴바에 추가
  const toolbarEl = document.querySelector('.fc-toolbar.fc-header-toolbar');
  if (toolbarEl) {
    const vacationButton = document.createElement('button');
    vacationButton.type = 'button';
    vacationButton.classList.add('btn', 'btn-primary');
    vacationButton.textContent = '휴가신청';
    vacationButton.addEventListener('click', function() {
      // 버튼 클릭 시 실행할 동작을 정의
     // myModal.show();
    });
    toolbarEl.appendChild(vacationButton); // 버튼을 툴바에 추가
  }
  const form = document.querySelector('form');

  form.addEventListener('submit', function(event) {
    event.preventDefault(); // prevent default form submission

    // retrieve the form input values
    const title = document.querySelector('#event-title').value;
    const startDate = document.querySelector('#start-date').value;
    const endDate = document.querySelector('#end-date').value;
    const color = document.querySelector('#event-color').value;
    const endDateFormatted = moment(endDate, 'YYYY-MM-DD').add(1, 'day').format('YYYY-MM-DD');
    const eventId = uuidv4();


    if (endDateFormatted <= startDate) { // add if statement to check end date
      dangerAlert.style.display = 'block';
      return;
    }

    const newEvent = {
      id: eventId,
      title: title,
      start: startDate,
      end: endDateFormatted,
      allDay: false,
      backgroundColor: color
    };

    // add the new event to the myEvents array
    myEvents.push(newEvent);

    // render the new event on the calendar
    calendar.addEvent(newEvent);

    // save events to local storage
    localStorage.setItem('events', JSON.stringify(myEvents));

    myModal.hide();
    form.reset();
  });

  myModal._element.addEventListener('hide.bs.modal', function () {
    dangerAlert.style.display = 'none';
    form.reset(); 
  });
});
