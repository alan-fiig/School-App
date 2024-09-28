document.addEventListener("turbo:load", () => {
  const selectAllCheckbox = document.getElementById("select_all");
  const checkboxes = document.querySelectorAll(
    'input[name="teacher_subject[group][]"]'
  );
  const errorDiv = document.getElementById("group-error");
  const form = document.getElementById("subject_form");

  // Manejar el evento de cambio en el checkbox de seleccionar/deseleccionar todo
  if (selectAllCheckbox) {
    selectAllCheckbox.addEventListener("change", (event) => {
      checkboxes.forEach((checkbox) => {
        checkbox.checked = event.target.checked;
      });
    });
  }

  // Manejar la validación al enviar el formulario
  if (form) {
    form.addEventListener("submit", (event) => {
      const hasChecked = Array.from(checkboxes).some(
        (checkbox) => checkbox.checked
      );

      if (!hasChecked) {
        event.preventDefault(); // Previene el envío del formulario
        errorDiv.style.display = "block"; // Muestra el error
      } else {
        errorDiv.style.display = "none"; // Oculta el error si hay al menos uno seleccionado
      }
    });
  }
});
