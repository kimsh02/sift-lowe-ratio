function [q] = hw09()
% usage:
%  q = hw09()
% where q is the number of questions answered
% 
%  assumes all required files for hw09 exist in the same directory as the
%  script

format compact
close all
q = 4;

% A

% 1

s1c = imread("slide1.jpeg");
s2c = imread("slide2.jpeg");
s3c = imread("slide3.jpeg");
f1c = imread("frame1.jpg");
f2c = imread("frame2.jpg");
f3c = imread("frame3.jpg");

% s1 = imread("slide1.pgm");
% s2 = imread("slide2.pgm");
% s3 = imread("slide3.pgm");
% f1 = imread("frame1.pgm");
% f2 = imread("frame2.pgm");
% f3 = imread("frame3.pgm");

s1s = load("sift_files/slide1.sift");
s2s = load("sift_files/slide2.sift");
s3s = load("sift_files/slide3.sift");
f1s = load("sift_files/frame1.sift");
f2s = load("sift_files/frame2.sift");
f3s = load("sift_files/frame3.sift");

% size(s1s)
% size(s2s)
% size(s3s)
% size(f1s)
% size(f2s)
% size(f3s)

A = zeros(size(s3c, 1), size(s3c, 2), 3, 'uint8');
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        g = s3c(i,j);
        A(i,j,:) = [g, g, g];
    end
end
s3c = A;

nth = 1;
k = 1;
[knn1, d1] = knnsearch(s1s(:,5:end), f1s(1:nth:end,5:end), 'K', k);
[knn2, d2] = knnsearch(s2s(:,5:end), f2s(1:nth:end,5:end), 'K', k);
[knn3, d3] = knnsearch(s3s(:,5:end), f3s(1:nth:end,5:end), 'K', k);

if false
% build collage
% change me start
sc = s1c;
fc = f1c;
idx = knn1;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
c(y+1:y+ys, 1:xs,:) = sc;
c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s1s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
dxs = s(idx, 3) .* cos(s(idx,4));
dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f1s;
% change me end
xfs = s(1:nth:end, 1);
yfs = s(1:nth:end, 2);
dxf = s(1:nth:end, 3) .* cos(s(1:nth:end,4));
dyf = s(1:nth:end, 3) .* sin(s(1:nth:end,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i)+y, xfs(i) + x], [yss(i) + y, xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
plot(xss, yss, 'y.', 'MarkerSize', 10);
quiver(xss, yss, dxs, dys, 2.5, 'y', 'LineWidth', 1);
plot(xfs + x, yfs, 'y.', 'MarkerSize', 10);
quiver(xfs + x, yfs, dxf, dyf, 2.5, 'y', 'LineWidth', 1);
plot(xss, yss + y, 'g.', 'MarkerSize', 10);
plot(xfs + x, yfs + y, 'g.', 'MarkerSize', 10);
% change me start
title('SIFT Keypoints for Slide 1 and Frame 1');
saveas(gcf, '1a.png');
% change me end

% build collage
% change me start
sc = s2c;
fc = f2c;
idx = knn2;
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
c(y+1:y+ys, 1:xs,:) = sc;
c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s2s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
dxs = s(idx, 3) .* cos(s(idx,4));
dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f2s;
% change me end
xfs = s(1:nth:end, 1);
yfs = s(1:nth:end, 2);
dxf = s(1:nth:end, 3) .* cos(s(1:nth:end,4));
dyf = s(1:nth:end, 3) .* sin(s(1:nth:end,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i)+y, xfs(i) + x], [yss(i) + y, xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
plot(xss, yss, 'y.', 'MarkerSize', 10);
quiver(xss, yss, dxs, dys, 2.5, 'y', 'LineWidth', 1);
plot(xfs + x, yfs, 'y.', 'MarkerSize', 10);
quiver(xfs + x, yfs, dxf, dyf, 2.5, 'y', 'LineWidth', 1);
plot(xss, yss + y, 'g.', 'MarkerSize', 10);
plot(xfs + x, yfs + y, 'g.', 'MarkerSize', 10);
% change me start
title('SIFT Keypoints for Slide 2 and Frame 2');
saveas(gcf, '1b.png');
% change me end

% build collage
% change me start
sc = s3c;
fc = f3c;
idx = knn3;
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
c(y+1:y+ys, 1:xs,:) = sc;
c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s3s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
dxs = s(idx, 3) .* cos(s(idx,4));
dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f3s;
% change me end
xfs = s(1:nth:end, 1);
yfs = s(1:nth:end, 2);
dxf = s(1:nth:end, 3) .* cos(s(1:nth:end,4));
dyf = s(1:nth:end, 3) .* sin(s(1:nth:end,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i)+y, xfs(i) + x], [yss(i) + y, xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
plot(xss, yss, 'r.', 'MarkerSize', 10);
quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
plot(xfs + x, yfs, 'r.', 'MarkerSize', 10);
quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss + y, 'g.', 'MarkerSize', 10);
plot(xfs + x, yfs + y, 'g.', 'MarkerSize', 10);
% change me start
title('SIFT Keypoints for Slide 3 and Frame 3');
saveas(gcf, '1c.png');
% change me end

end

% 2
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if false

P = 5;

% change me start
dist = d1;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s1c;
fc = f1c;
idx = knn1(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s1s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f1s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 10);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 10);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 1 Euclidean Distance P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2a.png');
% change me end

% change me start
dist = d2;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s2c;
fc = f2c;
idx = knn2(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s2s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f2s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 10);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 10);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 2 Euclidean Distance P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2b.png');
% change me end

% change me start
dist = d3;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s3c;
fc = f3c;
idx = knn3(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s3s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f3s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 3 Euclidean Distance P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2c.png');
% change me end

[knn1, d1] = knnsearch(s1s(:,5:end), f1s(1:nth:end,5:end), 'K', k, 'Distance', 'cosine');
[knn2, d2] = knnsearch(s2s(:,5:end), f2s(1:nth:end,5:end), 'K', k, 'Distance', 'cosine');
[knn3, d3] = knnsearch(s3s(:,5:end), f3s(1:nth:end,5:end), 'K', k, 'Distance', 'cosine');

% change me start
dist = d1;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s1c;
fc = f1c;
idx = knn1(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s1s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f1s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 1 Cosine Similarity P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2d.png');
% change me end

% change me start
dist = d2;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s2c;
fc = f2c;
idx = knn2(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s2s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f2s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 2 Cosine Similarity P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2e.png');
% change me end

% change me start
dist = d3;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s3c;
fc = f3c;
idx = knn3(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s3s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f3s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 3 Cosine Similarity P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2f.png');
% change me end

chi2Distance = @(Z, X) sum(((Z - X).^2) ./ (Z + X), 2) / 2;

[knn1, d1] = knnsearch(s1s(:,5:end), f1s(1:nth:end,5:end), 'K', k, 'Distance', chi2Distance);
[knn2, d2] = knnsearch(s2s(:,5:end), f2s(1:nth:end,5:end), 'K', k, 'Distance', chi2Distance);
[knn3, d3] = knnsearch(s3s(:,5:end), f3s(1:nth:end,5:end), 'K', k, 'Distance', chi2Distance);

% change me start
dist = d1;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s1c;
fc = f1c;
idx = knn1(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s1s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f1s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 1 Chi-Square P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2g.png');
% change me end

% change me start
dist = d2;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s2c;
fc = f2c;
idx = knn2(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s2s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f2s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 2 Chi-Square P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2h.png');
% change me end

% change me start
dist = d3;

% change me end
[~, sorted] = sort(dist, 1);
best_num = floor(P/100 * size(dist,1));
best = sorted(1:best_num);
% build collage
% change me start
sc = s3c;
fc = f3c;
idx = knn3(best);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s3s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f3s;
% change me end
xfs = s(best, 1);
yfs = s(best, 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 20);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 20);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 3 Chi-Square P=5%');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '2i.png');
% change me end

end

% 3
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if false

t = 0.92;
P = 5;

k = 2;    
[knn1, d1] = knnsearch(s1s(:,5:end), f1s(1:nth:end,5:end), 'K', k);
[knn2, d2] = knnsearch(s2s(:,5:end), f2s(1:nth:end,5:end), 'K', k);
[knn3, d3] = knnsearch(s3s(:,5:end), f3s(1:nth:end,5:end), 'K', k);

% change me start
dist = d1;
knn = knn1;
% change me end
A = [knn(:,1), (1:size(dist,1))', dist(:,1)];
ctr = 1;
for i = 1:size(knn,1)
    if dist(i,1)/dist(i,2) <= t
        index(ctr,:) = A(i,:);
        ctr = ctr + 1;
    end
end
index_sorted = sortrows(index, 3);
best_num = floor(P/100 * size(index,1));
best = index_sorted(1:best_num,:);
% build collage
% change me start
sc = s1c;
fc = f1c;
idx = best(:,1);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s1s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f1s;
% change me end
xfs = s(best(:,2), 1);
yfs = s(best(:,2), 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 10);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 10);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 1 Lowe Ratio');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '3a.png');
% change me end

% change me start
dist = d2;
knn = knn2;
clear index A;
% change me end
A = [knn(:,1), (1:size(dist,1))', dist(:,1)];
ctr = 1;
for i = 1:size(knn,1)
    if dist(i,1)/dist(i,2) <= t
        index(ctr,:) = A(i,:);
        ctr = ctr + 1;
    end
end
index_sorted = sortrows(index, 3);
best_num = floor(P/100 * size(index,1));
best = index_sorted(1:best_num,:);
% build collage
% change me start
sc = s2c;
fc = f2c;
idx = best(:,1);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s2s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f2s;
% change me end
xfs = s(best(:,2), 1);
yfs = s(best(:,2), 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 10);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 10);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 2 Lowe Ratio');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '3b.png');
% change me end

% change me start
dist = d3;
knn = knn3;
clear index A;
% change me end
A = [knn(:,1), (1:size(dist,1))', dist(:,1)];
ctr = 1;
for i = 1:size(knn,1)
    if dist(i,1)/dist(i,2) <= t
        index(ctr,:) = A(i,:);
        ctr = ctr + 1;
    end
end
index_sorted = sortrows(index, 3);
best_num = floor(P/100 * size(index,1));
best = index_sorted(1:best_num,:);
% build collage
% change me start
sc = s3c;
fc = f3c;
idx = best(:,1);
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% change me end
[ys, xs, ~] = size(sc);
[yf, xf, ~] = size(fc);
y = max(ys, yf);
x = max(xs, xf);
c(1:ys, 1:xs,:) = sc;
c(1:yf, x+1:x+xf,:) = fc;
% c(y+1:y+ys, 1:xs,:) = sc;
% c(y+1:y+yf, x+1:x+xf,:) = fc;
% change me start
s = s3s;
% change me end
xss = s(idx, 1);
yss = s(idx, 2);
% dxs = s(idx, 3) .* cos(s(idx,4));
% dys = s(idx, 3) .* sin(s(idx,4));
% change me start
s = f3s;
% change me end
xfs = s(best(:,2), 1);
yfs = s(best(:,2), 2);
% dxf = s(best, 3) .* cos(s(best,4));
% dyf = s(best, 3) .* sin(s(best,4));
% matching
for i = 1:size(xfs,1)
    c = draw_segment(c, [yfs(i), xfs(i)+x], [yss(i), xss(i)], 0, 255, 0, 0);
end
figure;
axis image;
imshow(c);
hold on;
% plot(xss, yss, 'r.', 'MarkerSize', 10);
% quiver(xss, yss, dxs, dys, 2.5, 'r', 'LineWidth', 1);
% plot(xfs + x, yfs, 'r.', 'MarkerSize', 10);
% quiver(xfs + x, yfs, dxf, dyf, 2.5, 'r', 'LineWidth', 1);
plot(xss, yss, 'g.', 'MarkerSize', 20);
plot(xfs + x, yfs, 'g.', 'MarkerSize', 20);
% change me start
title('Slide/Frame 3 Lowe Ratio');
set(gca,'Position', [0.05 0.05 0.9 0.9]);
saveas(gcf, '3c.png');
% change me end

end

% 4
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if true
clear c y x xss yss xfs yfs dxs dys dxf dyf;
% [ys1, xs1, ~] = size(s1c);
% [yf1, xf1, ~] = size(f1c);
% [ys2, xs2, ~] = size(s2c);
% [yf2, xf2, ~] = size(f2c);
% [ys3, xs3, ~] = size(s3c);
% [yf3, xf3, ~] = size(f3c);
% y = max([ys1,yf1,ys2,yf2,ys3,yf3]);
% x = max([xs1,xf1,xs2,xf2,xs3,xf3]);


max = 0;
best_t = 0;
best_P = 0;
best_C = [];



k = 2;

S = [s1s(:,5:end);s2s(:,5:end);s3s(:,5:end)];
F = [f1s(1:nth:end,5:end);f2s(1:nth:end,5:end);f3s(1:nth:end,5:end)];
[KNN, D] = knnsearch(S,F,'K',k);
% change me start
dist = D;
knn = KNN;
% change me end
A = [knn(:,1), (1:size(dist,1))', dist(:,1)];

for t=0.26:0.01:1
    for P = 1:100

% clear A index;



ctr = 1;
index = [];
for i = 1:size(knn,1)
    if dist(i,1)/dist(i,2) <= t
        index(ctr,:) = A(i,:);
        ctr = ctr + 1;
    end
end
index_sorted = sortrows(index, 3);
best_num = floor(P/100 * size(index,1));
best = index_sorted(1:best_num,:);

size(best,1);

s1_size = size(s1s, 1);
f1_size = size(f1s, 1);

s2_size = size(s2s, 1) + (s1_size);
f2_size = size(f2s, 1) + (f1_size);

s3_size = size(s3s, 1) + s2_size;
f3_size = size(f3s, 1) + f2_size;

s_range = [1, s1_size, s2_size, s3_size];
f_range = [1, f1_size, f2_size, f3_size];

C = zeros(3,3);
row = discretize(best(:,1)', s_range);
col = discretize(best(:,2)', f_range);

% size(row)
% size(col)

for i = 1:size(row,2)
    C(row(i),col(i)) = C(row(i),col(i)) + 1;
end

mask = ~eye(size(C));
non_diag = C(mask);
% if sum(diag(C)) - sum(non_diag) > max
%     max_t = t;
%     max_P = P;
%     best_C = C;
%     max = sum(diag(C)) - sum(non_diag);
% end
if sum(diag(C)) - sum(non_diag) > max
    best_t = t;
    best_P = P;
    best_C = C;
    max = sum(diag(C)) - sum(non_diag);
end


    end
end

best_t
best_P
best_C
max

end    