document.addEventListener('DOMContentLoaded', () => {
    console.log('admin.js loaded');

    const addGameBtn = document.getElementById('addGameBtn');
    const addGameModal = document.getElementById('addGameModal');
    const closeModal = document.getElementById('closeModal');
    const cancelBtn = document.getElementById('cancelBtn');
    const editButtons = document.getElementsByClassName('edit-btn');
    const deleteButtons = document.getElementsByClassName('delete-btn');
    const editGameModal = document.getElementById('editGameModal');
    const closeEditModal = document.getElementById('closeEditModal');
    const cancelEditBtn = document.getElementById('cancelEditBtn');
    const editGameForm = document.getElementById('editGameForm');
    const editGameId = document.getElementById('editGameId');
    const editTitle = document.getElementById('editTitle');
    const editDescription = document.getElementById('editDescription');
    const editPrice = document.getElementById('editPrice');
    const editCategory = document.getElementById('editCategory');
    const debugOutput = document.getElementById('debugOutput');

    // Verify DOM elements
    console.log('addGameBtn:', addGameBtn);
    console.log('editGameModal:', editGameModal);
    console.log('editButtons count:', editButtons.length);
    console.log('deleteButtons count:', deleteButtons.length);

    // Add Game Modal Handling
    if (addGameBtn && addGameModal) {
        addGameBtn.addEventListener('click', () => {
            console.log('Add Game button clicked');
            addGameModal.classList.remove('hidden');
        });
    } else {
        console.error('Add Game button or modal not found');
    }

    [closeModal, cancelBtn].forEach(btn => {
        if (btn) {
            btn.addEventListener('click', () => {
                console.log('Closing Add Game modal');
                addGameModal.classList.add('hidden');
            });
        }
    });

    if (addGameModal) {
        addGameModal.addEventListener('click', (e) => {
            if (e.target === addGameModal) {
                console.log('Add Game modal background clicked');
                addGameModal.classList.add('hidden');
            }
        });
    }

    // Edit Game Modal Handling
    if (editButtons.length === 0) {
        console.error('No edit buttons found');
    } else {
        Array.from(editButtons).forEach(button => {
            button.addEventListener('click', () => {
                try {
                    console.log('Edit button clicked, data-id:', button.getAttribute('data-id'));
                    
                    // Get data from button attributes
                    const gameId = button.getAttribute('data-id');
                    const title = button.getAttribute('data-title');
                    const description = button.getAttribute('data-description') || '';
                    const category = button.getAttribute('data-category');
                    const price = parseFloat(button.getAttribute('data-price'));

                    console.log('Populating modal with:', { gameId, title, description, category, price });

                    // Verify form elements
                    if (!editGameId || !editTitle || !editDescription || !editPrice || !editCategory) {
                        throw new Error('One or more form elements not found');
                    }

                    // Populate edit modal
                    editGameId.value = gameId;
                    editTitle.value = title;
                    editDescription.value = description;
                    editPrice.value = isNaN(price) ? '' : price;
                    editCategory.value = category;

                    // Clear previous debug output
                    if (debugOutput) {
                        debugOutput.textContent = '';
                    }

                    // Open modal
                    if (editGameModal) {
                        editGameModal.classList.remove('hidden');
                        console.log('Edit modal opened');
                    } else {
                        throw new Error('Edit modal not found');
                    }
                } catch (error) {
                    console.error('Error in edit button handler:', error);
                    if (debugOutput) {
                        debugOutput.textContent = `Error: ${error.message}`;
                    }
                }
            });
        });
    }

    // Delete Game Handling
    if (deleteButtons.length === 0) {
        console.error('No delete buttons found');
    } else {
        Array.from(deleteButtons).forEach(button => {
            button.addEventListener('click', () => {
                try {
                    const gameId = button.getAttribute('data-id');
                    console.log('Delete button clicked, data-id:', gameId);

                    if (!gameId) {
                        throw new Error('Game ID not found on delete button');
                    }

                    // Confirm deletion
                    if (confirm(`Are you sure you want to delete game with ID ${gameId}?`)) {
                        console.log('Deleting game with ID:', gameId);

                        // Send POST request to delete servlet
                        const form = document.createElement('form');
                        form.method = 'POST';
                        form.action = 'delete';
                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'id';
                        input.value = gameId;
                        form.appendChild(input);
                        document.body.appendChild(form);
                        form.submit();
                    } else {
                        console.log('Deletion cancelled');
                    }
                } catch (error) {
                    console.error('Error in delete button handler:', error);
                    if (debugOutput) {
                        debugOutput.textContent = `Error: ${error.message}`;
                    }
                }
            });
        });
    }

    [closeEditModal, cancelEditBtn].forEach(btn => {
        if (btn) {
            btn.addEventListener('click', () => {
                console.log('Closing Edit Game modal');
                editGameModal.classList.add('hidden');
                if (debugOutput) {
                    debugOutput.textContent = '';
                }
            });
        }
    });

    if (editGameModal) {
        editGameModal.addEventListener('click', (e) => {
            if (e.target === editGameModal) {
                console.log('Edit modal background clicked');
                editGameModal.classList.add('hidden');
                if (debugOutput) {
                    debugOutput.textContent = '';
                }
            }
        });
    }

    // Form submission with validation and debugging
    if (editGameForm) {
        editGameForm.addEventListener('submit', (e) => {
            try {
                console.log('Edit form submitted');
                const price = parseFloat(editPrice.value);
                if (!editTitle.value.trim() || !editDescription.value.trim() || isNaN(price) || !editCategory.value) {
                    e.preventDefault();
                    const errorMsg = 'Error: Please fill all required fields with valid values.';
                    console.error(errorMsg);
                    if (debugOutput) {
                        debugOutput.textContent = errorMsg;
                    }
                    alert(errorMsg);
                    return;
                }
                const updatedData = {
                    id: editGameId.value,
                    title: editTitle.value,
                    description: editDescription.value,
                    price: price,
                    category: editCategory.value
                };
                console.log('Submitting game data:', updatedData);
                if (debugOutput) {
                    debugOutput.textContent = `Submitting: id=${updatedData.id}, title=${updatedData.title}, ` +
                                             `description=${updatedData.description}, price=${updatedData.price}, ` +
                                             `category=${updatedData.category}`;
                }
                // Form submission proceeds to servlet
            } catch (error) {
                console.error('Error in form submission:', error);
                if (debugOutput) {
                    debugOutput.textContent = `Error: ${error.message}`;
                }
            }
        });
    } else {
        console.error('Edit form not found');
    }
});