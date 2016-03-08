function coords = annotate_cells(img, points_in)

    doinput = false;
      
    if nargin < 2
       points_in = zeros(2,0);
    end
        
    coords = points_in;
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




