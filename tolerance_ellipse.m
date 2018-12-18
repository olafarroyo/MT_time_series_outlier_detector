%MATLAB script to detect outliers in MT data series, based on a tolerance
%ellipse with center and axes defined by the statistical properties of
%data.
%
%Written by: Olaf J. Cort?s Arroyo (CEMIE-GEO, CICESE)
%December 2018
%
%Detailed information of variables and theory in the PDF file included 
%with this algorithm in the GitHub repository: 
%https://github.com/olafarroyo/MT_time_series_outlier_detector
%
%If you find this algorithm useful, please use the following DOI in your 
%publication for citation:
%DOI: 10.5281/zenodo.2006797
%
%Any comments or suggestions, please contact me trough Researchgate:
%https://www.researchgate.net/profile/Olaf_Cortes-Arroyo
%
%
function[nc]=tolerance_ellipse(S,F,mode)

%Calculate size of matrix S
[rows cols]=size(S);

%Equation to find data points inside of the tollerance ellipse
% (x-xo)^2/a^2 + (y-yo)^2/b^2 +(z-zo)^2/c^2 < 1

%Perform estimations by column (channel)
for m = 1:1:cols
    
    channel=S(:,m);

    md = median(channel) .* ones(rows,1);
    channel = channel-md;
    
    if mode == 0
       mds = F(m) * std(channel); 
    end
    if mode == 1
        mds = F(m) * mad(channel);
    end
    
    vc1=(channel).^2;
    vc2=vc1./(mds.^2);
    vc3(:,m)=vc2;

end

    
for n = 1:1: rows 
    vc(n)=sum(vc3(n,:));
end

%Select data inside the tolerance ellipsoid (non-outliers)
nc=find(vc <= 1);

