classdef ell14
    properties
        device     
        addr
        Prop
    end
    properties (Constant)
        baudrate = 9600
    end
    methods
        function obj = ell14(port)
            obj.device = serialport(port, obj.baudrate);
            obj.device.DataBits = 8;               % 8 data bits
            obj.device.StopBits = 1;               % 1 stop bit
            obj.device.Parity = "none";            % No parity
            configureTerminator(obj.device, "CR/LF");
            obj.addr = '0';
        end

        function obj = setaddress(obj, current_address, new_address)
            command = ['TX "' current_address ' ca ' new_address '"'];
            writeline(obj.device, command);
            obj.addr = current_address;
        end
        
        function message = rotate_foward(obj)
            command = ['TX "' num2str(obj.addr) 'fw"'];
            writeline(obj.device, command);
            message = readline(obj.device);
        end
        function message = default_pos(obj)
            command = ['TX "' obj.addr 'ho0"']
            writeline(obj.device,command);
            message = readline(obj.device);
        end

        function message = rotate_Backward(obj)
            command = ['TX "' num2str(obj.addr) 'bw"'];
            writeline(obj.device, command);
            message = readline(obj.device);
        end

        function step = change_step(obj, degree_of_precision)
            degtorad = degree_of_precision * (pi/180);
            step = round((143360 / (2 * pi)) * degtorad);
            hex = dec2hex(step);
            L = strlength(hex);

            % Format the step value for the command
            steps = repmat('0', 1, 8-L);  % Add leading zeros
            steps = [steps hex];
            command = ['TX "' num2str(obj.addr) 'sj' steps '"'];
            
            % Send the command
            writeline(obj.device, command);
            readline(obj.device);
        end
    end
end
