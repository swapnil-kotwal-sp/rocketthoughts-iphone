//
//  Evaluate.h
//

#import <UIKit/UIKit.h>

@protocol Evaluate

- (double)evaluateAt:(double)position;

@end

@interface BezierEvaluator : NSObject <Evaluate>
{
	double firstControlPoint;
	double secondControlPoint;
}

- (id)initWithFirst:(double)newFirst second:(double)newSecond;

@end

@interface ExponentialDecayEvaluator : NSObject <Evaluate>
{
	double coeff;
	double offset;
	double scale;
}

- (id)initWithCoefficient:(double)newCoefficient;

@end

@interface SecondOrderResponseEvaluator : NSObject <Evaluate>
{
	double omega;
	double zeta;
}

- (id)initWithOmega:(double)newOmega zeta:(double)newZeta;

@end

