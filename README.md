
******************************************************************
* Skewed t-distribution for Hyperspectral Anomaly Detection based on Autoencoder														
********************************************************************

Copyright 2021, Koray Kayabol, Ensar Burak Aytekin, Sertac Arisoy, Ercan Engin Kuruoglu

All Rights Reserved

Permission to use, copy, modify, and distribute this software and
its documentation for any non-commercial purpose is hereby granted
without fee, provided that the above copyright notice appear in
all copies and that both that copyright notice and this permission
notice appear in supporting documentation, and that the name of
the author not be used in advertising or publicity pertaining to
distribution of the software without specific, written prior
permission.


*****************************************************************			
* General information	
********************************************************************

Thanks for your interest in our work. This is a MATLAB implementation for the
Skewed t-distribution for hyperspectral anomaly detection based on autoencoder algorithm. The theoretical detailed of the algorithm can be found in the following paper

Koray Kayabol, Ensar Burak Aytekin, Sertac Arisoy, Ercan Engin Kuruoglu "Skewed t-distribution for Hyperspectral Anomaly Detection based on Autoencoder" IEEE Geoscience and Remote Sensing Letters (GRSL).
		  
If you use this software, you should cite
the aforementioned paper in any resulting publication.

If you have any questions about the code, please contact us.

Koray Kayabol  via <koray.kayabol@gtu.edu.tr>,

Ensar Burak Aytekin via <ebaytekin@gtu.edu.tr>

Sertac Arisoy  via <sarisoy@gtu.edu.tr>, .


*******************************************************************		
* Usage								
*******************************************************************


demo matlab code demonstrates of the usage of the code.
	
mainScript: compute the anomaly detection score for  Multivariate Skewed t distribution ,Multivariate Cauchy distribution, Multivariate Jeffrey’s distribution , Multivariate Student’s t distribution and Multivariate Laplace distribution, Multivariate Normal distribution background modelling .

Input:

	data 		: is Real HSI.
	
	map             : is anomaly map.
	
	diffim 	        : is Real HSI - Synthesized HSI.
        
	FARValue        : is False Alarm Rate for Detection Map
	
	FiltOn          : is Filter Selection.
	
	PCAOn           : is Principal component analysis ON/OFF Selection.
	
	
Output:
 
	 Result.AUCScores 		 : is The Area Under the Curve score.
	
	 Result.FARScores                : is False Alarm Rate score.
	
	 Result.elapsedTimeMean          : is processing time mean.
	
	 Result.dtmap                    : is detection map.
			

