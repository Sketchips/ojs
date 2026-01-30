{**
 * downloadableFilesManager.tpl
 * 
 * Template untuk manage downloadable PDF files di advanced settings
 *}

<div id="downloadableFilesManager" class="pkp_form">
	<h3>Manage Downloadable PDF Files</h3>
	<p>Add PDF files that will be available for download on the homepage. Files will be displayed 2 per row.</p>
	
	<div id="filesList">
		{* File items will be dynamically added here *}
	</div>
	
	<button type="button" id="addFileBtn" class="btn btn-primary">
		<span class="glyphicon glyphicon-plus"></span> Add PDF File
	</button>
	
	<input type="hidden" name="downloadableFiles" id="downloadableFilesInput" value="">
</div>

<script>
(function($) {
	var files = [];
	var fileIndex = 0;
	
	// Initialize from existing data
	var existingData = '{$downloadableFilesJson|escape:"javascript"}';
	if (existingData) {
		try {
			files = JSON.parse(existingData);
			files.forEach(function(file) {
				addFileRow(file);
			});
		} catch(e) {
			console.error('Error parsing existing files:', e);
		}
	}
	
	$('#addFileBtn').click(function() {
		addFileRow();
	});
	
	function addFileRow(fileData) {
		fileData = fileData || { name: '', file: null };
		var index = fileIndex++;
		
		var row = $('<div class="file-row" data-index="' + index + '" style="margin-bottom: 15px; padding: 15px; border: 1px solid #ddd; border-radius: 4px;">');
		
		var nameInput = $('<input type="text" class="form-control file-name" placeholder="Display Name (e.g., Pedoman Author)" style="margin-bottom: 10px;" value="' + (fileData.name || '') + '">');
		
		var fileInput = $('<input type="file" class="form-control file-upload" accept=".pdf" style="margin-bottom: 10px;">');
		
		var removeBtn = $('<button type="button" class="btn btn-danger btn-sm remove-file">Remove</button>');
		
		removeBtn.click(function() {
			row.remove();
			updateHiddenInput();
		});
		
		nameInput.on('change', updateHiddenInput);
		
		fileInput.on('change', function() {
			// Handle file upload
			var file = this.files[0];
			if (file) {
				// Upload to temporary files API
				uploadFile(file, index);
			}
		});
		
		row.append(nameInput).append(fileInput).append(removeBtn);
		
		if (fileData.file && fileData.file.uploadName) {
			var fileInfo = $('<div class="alert alert-success">File uploaded: ' + fileData.file.uploadName + '</div>');
			row.append(fileInfo);
		}
		
		$('#filesList').append(row);
		updateHiddenInput();
	}
	
	function uploadFile(file, index) {
		var formData = new FormData();
		formData.append('file', file);
		
		$.ajax({
			url: '{$temporaryFileApiUrl}',
			type: 'POST',
			data: formData,
			processData: false,
			contentType: false,
			success: function(response) {
				console.log('Upload success:', response);
				// Update file data
				updateHiddenInput();
			},
			error: function(xhr, status, error) {
				alert('Upload failed: ' + error);
			}
		});
	}
	
	function updateHiddenInput() {
		var filesData = [];
		$('.file-row').each(function() {
			var name = $(this).find('.file-name').val();
			if (name) {
				filesData.push({
					name: name,
					file: null // Will be populated after upload
				});
			}
		});
		$('#downloadableFilesInput').val(JSON.stringify(filesData));
	}
})(jQuery);
</script>

<style>
.file-row {
	background: #f9f9f9;
}
.remove-file {
	float: right;
}
</style>
