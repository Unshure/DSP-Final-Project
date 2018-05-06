function [fftout] = dspfft(x,N,s)
fftout= zeros(1,N);
if N==1
    fftout= x;
else
    fftout(1:N/2) = dspfft(x(1:2:end),N/2,2*s);
    fftout(N/2+1:N) = dspfft(x(2:2:end),N/2,2*s);
    for k=1:N/2
       t = fftout(k);
       fftout(k) = t + exp(-2*pi*1i*k/N)*fftout(k+N/2);
       fftout(k+N/2) = t - exp(-2*pi*1i*k/N)*fftout(k+N/2);
    end
end
end

