% Create a figure window
fig = figure;

% Create a button with the text "Run Program"
button1 = uicontrol('String', 'Run Program', 'Position', [20 20 100 20]);

% Set the callback function for the button to run the program
set(button1, 'Callback', @runProgram);

% Create a button with the text "Edit"
button2 = uicontrol('String', 'Edit', 'Position', [20 60 100 20]);

% Set the callback function for the button to edit the image
set(button2, 'Callback', @editImage);

% Define the function that will be executed when the "Run Program" button is clicked
function runProgram(src, event)
    % Prompt the user to select an image file
    [filename, pathname] = uigetfile('*.png;*.jpg;*.bmp', 'Select an image file');

    % Read the image file using the imread function
    img = imread(fullfile(pathname, filename));

    % Display the image using the imshow function
    imshow(img);
end

% Define the function that will be executed when the "Edit" button is clicked
function editImage(src, event)
    % Convert the image to greyscale
    img = rgb2gray(img);

    % Display the edited image
    imshow(img);
end
