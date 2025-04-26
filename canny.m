% Wybór pliku obrazu z folderu
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp', 'Obrazy (*.jpg, *.png, *.bmp)'}, 'Wybierz plik obrazu');
if isequal(filename, 0)
    disp('Nie wybrano pliku.');
    return;
end

% Wczytanie obrazu
imagePath = fullfile(pathname, filename);
img = imread(imagePath);

% Konwersja na skalę szarości, jeśli obraz jest kolorowy
if size(img, 3) == 3
    imgGray = rgb2gray(img);
else
    imgGray = img;
end

% Detekcja krawędzi metodą Canny'ego
edges = edge(imgGray, 'Canny');

% Wyświetlenie wyników
figure;
subplot(1, 2, 1);
imshow(img);
title('Oryginalny obraz');

subplot(1, 2, 2);
imshow(edges);
title('Detekcja krawędzi Canny');
