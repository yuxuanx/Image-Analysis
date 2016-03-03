function  quadViewer(img, overlay, yellow_pts, cyan_pts)
% quadViewer(img, overlays, points)
% img - 3d image
% overlay - overlay of same size as img (or a cell with 1-3 overlays)
% yellow_pts - 3d points to plot in yellow. 
% cyan_pts - 3d points to plot in cyan.
% Primitive viewer for 3D images. You control the viewing using
% 1           Switch to first view
% 2           Switch to second view
% 3           Switch to third view
% Arrow keys  Move in the current view
% +           Zoom in
% -           Zoom out
% f           Toggle "fast mode". Makes the arrow keys take larger steps.
% x           Quit


    if nargin < 3
        points = [];
    else
        points(1).points = yellow_pts;
        points(1).format = 'y*';
    end
    if nargin == 4
        points(2).points = cyan_pts;
        points(2).format = 'co';
    end
        
        
    if nargin < 2
        overlay = [];
    end
    
    if ~iscell(overlay) && all(size(overlay)==size(img))
        overlay = {overlay};
    end
    

    centre = round(size(img)/2);
    view_radius = round(max(size(img))/3);
    voxdims = [1 1 1];
    
    step_size = 1;
    plot_margin = 1;
    
    
    % Create a normalized uint8 image.
    img = normalize_image(img);
    overlay1 = [];
    overlay2 = [];
    overlay3 = [];
    for kk = 1:length(overlay)
        overlay{kk} = normalize_image(overlay{kk});
        overlay1{kk} = rearrange_image(overlay{kk}, 1);
        overlay2{kk} = rearrange_image(overlay{kk}, 2);
        overlay3{kk} = rearrange_image(overlay{kk}, 3);
    end
        
    % Reorganize dimensions.
    img1 = rearrange_image(img,     1);
    img2 = rearrange_image(img,     2);
    img3 = rearrange_image(img,     3);

    % Init image plots.
    fig = figure('KeyPressFcn',@(obj,evt) 0); 
	clf;
    
    
    ha = tight_subplot(2,2,[0.001 0.001],0,0);
    
    axes(ha(1));
    a1 = ha(1);
    h1 = imshow(build_2d_image(img1, overlay1, centre(1)));
    colormap(gray);
    axis off
    axis image
    hold on
    for k = 1:length(points)
        ph1(k) = plot(nan,nan,points(k).format);
        for jj = 1:size(points(k).points,2)
            if isfield(points(k), 'string')
                pht1(jj) = text(points(k).points(3,jj),points(k).points(2,jj),points(k).string{jj});
            else
                pht1(jj) = text(nan,nan,'');
                pht1(jj).Visible = 'off';
            end
            pht1(jj).Color = [1 1 1];
            pht1(jj).Interpreter = 'none';
            pht1(jj).Clipping = 'on';
        end
    end
    lh12 = plot([1 1], [1 1], 'g-');
    lh13 = plot([1 1], [1 1], 'g-');
    % Set up aspect ratio.
    daspect([voxdims(2:3) 1]);
    % Plot line indicating the other subplot
    plot_cut_line(lh12, 2, centre(2));
      
   
    axes(ha(3));
    a2 = ha(3);
    h2 = imshow(build_2d_image(img2, overlay2, centre(2)));
    colormap(gray);
    axis off
    axis image
    hold on
    for k = 1:length(points)
        ph2(k) = plot(nan,nan,points(k).format);
        for jj = 1:size(points(k).points,2)
            if isfield(points(k), 'string')
                pht2(jj) = text(points(k).points(3,jj),points(k).points(1,jj),points(k).string{jj});
            else
                pht2(jj) = text(nan,nan,'');
                pht2(jj).Visible = 'off';
            end
            pht2(jj).Color = [1 1 1];
            pht2(jj).Interpreter = 'none';
            pht2(jj).Clipping = 'on';
        end
    end
    lh21 = plot([1 1], [1 1], 'y-');
    lh23 = plot([1 1], [1 1], 'y-');

    daspect([voxdims([1 3]) 1]);
    plot_cut_line(lh21, neighbour_cut_dim(2,1), centre(1));
	
    axes(ha(4));
    a3 = ha(4);
    h3 = imshow(build_2d_image(img3, overlay3, centre(3)));
    colormap(gray);
    axis off
    axis image
    hold on
    for k = 1:length(points)
        ph3(k) = plot(nan,nan,points(k).format);
        for jj = 1:size(points(k).points,2)
            if isfield(points(k), 'string')
                pht3(jj) = text(points(k).points(2,jj),points(k).points(1,jj),points(k).string{jj});
            else
                pht3(jj) = text(nan,nan,'');
                pht3(jj).Visible = 'off';
            end
            pht3(jj).Color = [1 1 1];
            pht3(jj).Interpreter = 'none';
            pht3(jj).Clipping = 'on';
        end
    end
    lh31 = plot([1 1], [1 1], 'y-');
    lh32 = plot([1 1], [1 1], 'y-');
    daspect([voxdims(1:2) 1]);
    plot_cut_line(lh31, 1, centre(2));
	
    active_dim = 1; 
    right = [0 0 1];
    up = [0 -1 0];

    axes(ha(2));
    a4 = ha(2);
    set(a4,'Color',[0.5 0.5 0.5])
    set(a4,'xdir','reverse')
    plot_segmentations_3d(overlay,voxdims,{'red','green', 'blue'})
    view(90,0)
    alpha(0.3)
    hold on
    for kk = 1:length(points)
        pts3d(kk)=plot3(points(kk).points(2,:),points(kk).points(1,:),points(kk).points(3,:),points(kk).format,'LineWidth',2);
        for jj = 1:size(points(k).points,2)
            if isfield(points(k), 'string')
                pht4(jj) = text(points(kk).points(2,jj),points(kk).points(1,jj),points(kk).points(3,jj),points(k).string{jj});
            else
                pht4(jj) = text(nan,nan,'');
                pht4(jj).Visible = 'off';
            end
            pht4(jj).Color = [0 0 0];
            pht4(jj).Interpreter = 'none';
            pht4(jj).Clipping = 'on';
        end
    end
    current=plot3(centre(2),centre(1),centre(3),'k+','LineWidth',2);

   
    
      
    while true
        
        bnds = [centre(:)-view_radius./voxdims(:) centre(:)+view_radius./voxdims(:)];
        bnds(3,:) = [centre(3)-view_radius./voxdims(3)*1.5 centre(3)+view_radius./voxdims(3)*1.5];
        
        % Plot image 1.
        set(h1, 'CData', build_2d_image(img1, overlay1, centre(1)));
        set(a1, 'XLim', bnds(3,:))
        set(a1, 'YLim', bnds(2,:))
        for k = 1:length(points)
                selected = abs(points(k).points(1,:) - centre(1)) < plot_margin;
                set(ph1(k), 'XData', points(k).points(3,selected));
                set(ph1(k), 'YData', points(k).points(2,selected));
                if nnz(selected) 
                    [pht1(selected).Visible] = deal('on');
                end
                if nnz(~selected)
                    [pht1(~selected).Visible] = deal('off');
                end
        end
        plot_cut_line(lh12, 1, centre(2));
        plot_cut_line(lh13, 2, centre(3));


        % Plot image 2.
        set(h2, 'CData', build_2d_image(img2, overlay2, centre(2)));
        set(a2, 'XLim', bnds(3,:))
        set(a2, 'YLim', bnds(1,:))

        for k = 1:length(points)
                selected = abs(points(k).points(2,:) - centre(2)) < plot_margin;
                set(ph2(k), 'XData', points(k).points(3,selected));
                set(ph2(k), 'YData', points(k).points(1,selected));
                if nnz(selected) 
                    [pht2(selected).Visible] = deal('on');
                end
                if nnz(~selected)
                    [pht2(~selected).Visible] = deal('off');
                end
       end
        plot_cut_line(lh21, 1, centre(1));
        plot_cut_line(lh23, 2, centre(3));

        
        % Plot image 3.
        set(h3, 'CData', build_2d_image(img3, overlay3, centre(3)));
        set(a3, 'XLim', bnds(2,:))
        set(a3, 'YLim', bnds(1,:))
        for k = 1:length(points)
                selected = abs(points(k).points(3,:) - centre(3)) < plot_margin;
                set(ph3(k), 'XData', points(k).points(2,selected));
                set(ph3(k), 'YData', points(k).points(1,selected));
                if nnz(selected) 
                    [pht3(selected).Visible] = deal('on');
                end
                if nnz(~selected)
                    [pht3(~selected).Visible] = deal('off');
                end
        end
        plot_cut_line(lh32, 2, centre(2));
        plot_cut_line(lh31, 1, centre(1));
        
        set(a4, 'XLim', bnds(2,:))
        set(a4, 'YLim', bnds(1,:))
        set(a4, 'ZLim', bnds(3,:))

        set(current, 'XData', centre(2))
        set(current, 'YData', centre(1))
        set(current, 'ZData', centre(3))




        drawnow 
        % step through volume
        while true       

            set(fig,'CurrentCharacter','s');
            waitfor(gcf,'CurrentCharacter');
            k = get(fig,'CurrentCharacter');
            
            try
            if k == 'x'
                return;
            elseif k == ',' || double(k) == 30
                centre = max(min(centre + up, size(img)),1);
                break;
            elseif k == '.' || double(k) == 31
                centre = max(min(centre - up, size(img)), 1);
                break;
            elseif k == ',' || double(k) == 28
                centre = max(min(centre - right, size(img)),1);
                break;
            elseif k == '.' || double(k) == 29
                centre = max(min(centre + right, size(img)),1);
                break;
            elseif k == '+'
                view_radius = view_radius-1;
                break;
            elseif k =='-'
                view_radius = max(10,view_radius+1);
                break;
            elseif k == '1' 
                right = [0 0 1]*step_size;
                up = [0 -1 0]*step_size;
                lh12.Color = [0 1 0];
                lh13.Color = [0 1 0];
                lh21.Color = [1 1 0];
                lh23.Color = [1 1 0];
                lh31.Color = [1 1 0];
                lh32.Color = [1 1 0];

            break;
            elseif k == '2' 
                right = [0 0 1]*step_size;
                up = [-1 0 0]*step_size;
                lh12.Color = [1 1 0];
                lh13.Color = [1 1 0];
                lh21.Color = [0 1 0];
                lh23.Color = [0 1 0];
                lh31.Color = [1 1 0];
                lh32.Color = [1 1 0];
            break;
            elseif k == '3' 
                right = [0 1 0]*step_size;
                up = [-1 0 0]*step_size;
                lh12.Color = [1 1 0];
                lh13.Color = [1 1 0];
                lh21.Color = [1 1 0];
                lh23.Color = [1 1 0];
                lh31.Color = [0 1 0];
                lh32.Color = [0 1 0];

            break;
            elseif k == 'f'
                if step_size == 1
                    step_size = 10;
                    up = sign(up)*step_size;
                    right = sign(right)*step_size;
                else
                    step_size = 1;
                    up = sign(up);
                    right = sign(right);
                end
            break;
            end
            catch
                disp(['Unknown character ' k]);
            end

        end

    end
end


function out = rearrange_image(img, cutdim)
    out = [];
    if ~isempty(img)
        new_order = [1 2 3];
        if cutdim == 1
            new_order = [2 3 1];
        elseif cutdim == 2
            new_order = [1 3 2];
        end
        out = permute(img, new_order);
    end
end


function out = build_2d_image(img, overlay, cutId)
    out = zeros(size(img,1),size(img,2),3,'uint8');
    out(:,:,1) = 0.7*img(:,:,cutId);
    out(:,:,2) = 0.7*img(:,:,cutId);
    out(:,:,3) = 0.7*img(:,:,cutId);
    if ~isempty(overlay)
        for kk =1:length(overlay)
            out(:,:,kk) = max(0.7*img(:,:,cutId), overlay{kk}(:,:,cutId));
        end
    end
end


function out = normalize_image(img)
	out = [];
    if ~isempty(img)
		img = single(img);
		out = (img-min(img(:)))/(max(img(:))-min(img(:)));
		out = uint8(out * 255);
	end
end


function plotdim = neighbour_cut_dim(mycutdim, itscutdim)
    if mycutdim == 1 && itscutdim == 2
        plotdim = 1;
    elseif mycutdim == 1 && itscutdim == 3
        plotdim = 2;
    elseif mycutdim == 2 && itscutdim == 1
        plotdim = 1;
    elseif mycutdim == 2 && itscutdim == 3
        plotdim = 2;
    elseif mycutdim == 3 && itscutdim == 1
        plotdim = 1;
    else
        plotdim = 2;
    end
end


function plot_cut_line(line_handle, plotdim, pixel_coord)
    axis_handle = get(line_handle, 'Parent');
    if plotdim == 2
        ylim = get(axis_handle, 'YLim');
        set(line_handle, 'XData', [pixel_coord pixel_coord]);
        set(line_handle, 'YData', ylim);
    else
        xlim = get(axis_handle, 'XLim');
        set(line_handle, 'XData', xlim);
        set(line_handle, 'YData', [pixel_coord pixel_coord]);
    end
end







