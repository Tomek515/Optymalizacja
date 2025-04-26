% 1️⃣ Połącz się z brokerem MQTT
brokerAddress = 'mqtt://6aa9c1de47b0404e82629f1961517374.s1.eu.hivemq.cloud';  % lub np. 'tcp://192.168.1.100'
mqttObj = mqttclient(brokerAddress);

% 2️⃣ Subskrybuj temat z Node-RED (ten, na którym publikujesz dane)
topic = 'esp32/Pub';
subscribe(mqttObj, topic);

% 3️⃣ Przygotuj dane i wykres
czasy = [];
wartosci = [];

figure;
hold on;
grid on;
xlabel('Czas [s]');
ylabel('Wartość danych z MQTT');
title('Wykres danych z MQTT w czasie rzeczywistym');

tic; % start licznika czasu

% 4️⃣ Pętla, która czyta dane cały czas!
while true
    % Odczyt danych z brokera MQTT
    msg = read(mqttObj, "OutputFormat", "table");

if ~isempty(msg)
    daneJson = msg.Message{1};
    dane = jsondecode(daneJson);  % dekodujemy JSON
    wartosc = dane.temperatura;   % np. dostęp do pola "temperatura"
end
    msg = read(mqttObj, "OutputFormat", "table");


    % Możesz dodać małe opóźnienie, aby MATLAB nie obciążał CPU
    pause(0.1);  % 100ms przerwy, możesz zmienić na 0.01 albo 0
end
