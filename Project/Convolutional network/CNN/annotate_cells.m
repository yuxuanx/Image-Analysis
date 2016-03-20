function coords = annotate_cells(img)
    % coords = annotate_cells(img)
    % Use space to enter input mode.
    % Move the cursor to the point you want to annotate.
    % Use the mouse button or space to make an annotation there.
    % If you did a mistake you can use backspace to remove the last point.
    % Press x to exit.
    
    doinput = false;
              
    coords = zeros(2,0);
    fig = figure('KeyPressFcn',@(obj,evt) 0); 
	clf;
    imagesc(img)
    if size(img,3)==1
        colormap(gray)
    end
    axis equal
    hold on
    plot(coords(2,:),coords(1,:),'y*')
    
    while true
       
		if (doinput)
			coord = ginput(1);
            coords = [coords coord(2:-1:1)'];
            doinput = false;
        end
        plot(coords(2,:),coords(1,:),'y*')
		
        drawnow

        
        % step through volume
        while true       

            set(fig,'CurrentCharacter','s');
            waitfor(gcf,'CurrentCharacter');
            k = get(fig,'CurrentCharacter');

            if k == 'x'
                return;
            elseif double(k) == 8
                disp('Removing')
                coords(:,end) = [];
                hold off
                imagesc(img)
                axis equal
                hold on
                plot(coords(2,:),coords(1,:),'y*')
                break;
            elseif k == ' ' %space
                doinput = true;
                break
            end		
        end

    end
end




