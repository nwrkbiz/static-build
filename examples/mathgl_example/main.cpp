// heavily inspired from the MathGL FLTK Example

// FLTK
#include <FL/Fl_RGB_Image.H>
#include <FL/Fl.H>
#include <FL/Fl_Double_Window.H>

// MathGL plotting lib FLTK widget
#include <mgl2/fltk.h>

#include <memory>

#include "Icon.h" // icon for window manager (embedded into executable for maximum portability)

int test_wnd(mglGraph *gr)
{
	mgl_set_test_mode(true);
	gr->NewFrame();	// 0
	gr->Box();
	gr->EndFrame();
	gr->NewFrame();	// 1
	gr->Axis();
	gr->EndFrame();
	gr->NewFrame();	// 2
	gr->Label('x',"XXXX",0);
	gr->Label('y',"YYYY",0);
	gr->EndFrame();
	gr->NewFrame();	// 3
	gr->Puts(mglPoint(0,0),"0");
	gr->EndFrame();

	gr->Clf();
	gr->ShowFrame(0);
	gr->ShowFrame(1);
	gr->ShowFrame(2);
	gr->ShowFrame(3);
	gr->Finish();
	return 0;
}

int sample(mglGraph *gr)
{
	gr->Rotate(20,40);
	gr->SetRanges(-2,2,-2,2,-1,3);
	gr->FSurf("cos(2*pi*(x^2+y^2))/(x^2+y^2+1)^2/(x^2+y^2<4)");
	gr->Drop(mglPoint(0,0,3),mglPoint(0,0,-1),0.7,"b");
	return 0;
}

int sample_1(mglGraph *gr)
{
	mglData  a(50,15),d(50),d1(50),d2(50);
	d.Modify("0.7*sin(2*pi*x) + 0.5*cos(3*pi*x) + 0.2*sin(pi*x)");
	d1.Modify("cos(2*pi*x)");
	d2.Modify("sin(2*pi*x)");
	a.Modify("pow(x,4*y)");

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Simple plot of one curve");
	gr->Plot(d);
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Three curves with manual styles");
	gr->Plot(d,"b");
	gr->Plot(d1,"ri");
	gr->Plot(d2,"m|^");
	gr->Plot(d,"l o");
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Three curves with automatic styles");
	gr->Plot(d);
	gr->Plot(d1);
	gr->Plot(d2);
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Curves from matrix");
	gr->Plot(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Parametrical curves in 2D");
	gr->Plot(d1,d2,"b");
	gr->Plot(d1,d,"ri");
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Parametrical curves in 3D");
	gr->Rotate(60,40);
	gr->Box();	gr->Axis();	gr->Label('x',"x");	gr->Label('y',"y");	gr->Label('z',"z");
	gr->Plot(d1,d2,d,"b");
	gr->EndFrame();

	gr->NewFrame();
	gr->SubPlot(2,2,0);
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Area plot");
	gr->Area(d);
	gr->SubPlot(2,2,1);
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Step plot");
	gr->Step(d);
	gr->SubPlot(2,2,2);
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Stem plot");
	gr->Stem(d);
	gr->SubPlot(2,2,3);
	gr->Box();	gr->Axis("xy");	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Puts(mglPoint(0,1.2,1),"Bars plot");
	gr->Bars(d);
	gr->EndFrame();

	gr->NewFrame();
	gr->SubPlot(2,2,0);
	gr->Puts(mglPoint(0,1.2,1),"Area plot in 3D");
	gr->Rotate(60,40);
	gr->Box();	gr->Axis();	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Area(d1,d2,d);
	gr->SubPlot(2,2,1);
	gr->Puts(mglPoint(0,1.2,1),"Step plot in 3D");
	gr->Rotate(60,40);
	gr->Box();	gr->Axis();	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Step(d1,d2,d);
	gr->SubPlot(2,2,2);
	gr->Puts(mglPoint(0,1.2,1),"Stem plot in 3D");
	gr->Rotate(60,40);
	gr->Box();	gr->Axis();	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Stem(d1,d2,d);
	gr->SubPlot(2,2,3);
	gr->Puts(mglPoint(0,1.2,1),"Bars plot in 3D");
	gr->Rotate(60,40);
	gr->Box();	gr->Axis();	gr->Label('x',"x");	gr->Label('y',"y");
	gr->Bars(d1,d2,d);
	gr->EndFrame();
	return gr->GetNumFrame();
}

int sample_2(mglGraph *gr)
{
	mglData  a(50,50),b(50,50),c(50,50),d(50,50),m(50,50),c1(50,50,7),
	d1(50),d2(50);
	d1.Modify("2*x*x-1");	d2.Modify("sin(pi*(x-0.5))");
	a.Modify("0.6*sin(2*pi*x)*sin(3*pi*y) + 0.4*cos(3*pi*(x*y))");
	b.Modify("(2+sin(2*pi*x))*cos(2*pi*y)/3");
	c.Modify("(2+sin(2*pi*x))*sin(2*pi*y)/3");
	d.Modify("cos(2*pi*x)");
	m.Modify("cos(pi*x)");
	c1.Modify("(2-z)*(2*x-1)^2 + (z+1)*(2*y-1)^2");

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Simple surface");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->SubPlot(2,2,0);
	gr->Puts(mglPoint(0,1.2,1),"Gray color scheme 'kw'");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(a,"kw");
	gr->SubPlot(2,2,1);
	gr->Puts(mglPoint(0,1.2,1),"Hot color scheme 'wyrRk'");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(a,"wyrRk");
	gr->SubPlot(2,2,2);
	gr->Puts(mglPoint(0,1.2,1),"Along coordiantes 'rgbd'");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(a,"rgbd");
	gr->SubPlot(2,2,3);
	gr->Puts(mglPoint(0,1.2,1),"Bicolor scheme 'BbwrR'");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(a,"BbwrR");
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis();
	gr->Puts(mglPoint(0,1.2,1),"Density plot");
	gr->Dens(a);
	gr->InPlot(0.6,1,0.6,1,false);	// new axis in upper right corner
	gr->Box();	gr->Axis();
	gr->Puts(mglPoint(0,1.2,1),"... with bicolor");
	gr->Dens(a,"BbwrR");
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Mesh lines (previous scheme by default)");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Mesh(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Surface of boxes");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Boxs(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Contour plot");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Cont(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Contour isosurface y-rotation");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Axial(a,":y");
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Contour isosurface x-rotation");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Axial(a,"x");
	a.Transpose();
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Surface and contours");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Cont(a,"BbcyrR_");
	gr->Surf(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Parametrical surface (1)");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Mesh(d1,d2,b);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Parametrical surface (vase)");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(b,c,m);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Parametrical surface (torus)");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf(b,c,d);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Contours for 3-tensor");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Cont(c1);
	gr->EndFrame();
	return gr->GetNumFrame();
}

int sample_3(mglGraph *gr)
{
	mglData  a(50,50,50),b(50,50,50), c(50,50,50),d(50,50,50), d1(50),d2(50),d3(50);
	d1.Modify("cos(2*pi*x)");
	d2.Modify("sin(2*pi*x)");
	d3.Modify("2*x*x-1");
	a.Modify("(-2*((2*x-1)^2 + (2*y-1)^2 + (2*z-1)^4 - (2*z-1)^2 + 0.1))");
	b.Modify("-2*((2*x-1)^2 + (2*y-1)^2)");
	c.Modify("exp(-8*((2*x-1)^2+(2*y-1)^2)/(1+z*z*4))");
	d.Modify("cos(32*z*((2*x-1)^2+(2*y-1)^2)/(1+z*z*4))");

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Isosurface (try lightning!)");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf3(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Isosurface with 'rgbd' scheme");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf3(a,"rgbd");
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Cloud plot (switch alpha !!!)");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Cloud(a);
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Density at central slices");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Dens3(a,"x");	gr->Dens3(a);	gr->Dens3(a,"z");
	gr->EndFrame();

	gr->NewFrame();
	gr->Puts(mglPoint(0,1.2,1),"Contours at central slices");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Cont3(a,"x");	gr->Cont3(a);	gr->Cont3(a,"z");
	gr->EndFrame();

	gr->NewFrame();
	gr->SubPlot(2,1,0);
	gr->Puts(mglPoint(0,1.2,1),"Gauss difraction");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->SetRange('c',0,1);
	gr->Surf3(0.5,c,"g");
	gr->SubPlot(2,1,1);
	gr->Puts(mglPoint(0,1.2,1),"and its phase");
	gr->Rotate(40,60);
	gr->Box();	gr->Axis();
	gr->Surf3A(sin(M_PI/4),d,c,"q");
	gr->Surf3A(-sin(M_PI/4),d,c,"q");
	gr->EndFrame();

	return gr->GetNumFrame();
}

int sample_d(mglGraph *gr)
{
	mglData  a(50,50),b(50,50);
	mglData cx(50,50,50),cy(50,50,50),cz(50,50,50);
	a.Modify("0.6*sin(2*pi*x)*sin(3*pi*y) + 0.4*cos(3*pi*(x*y))");
	b.Modify("0.6*cos(2*pi*x)*cos(3*pi*y) + 0.4*cos(3*pi*(x*y))");
	cx.Modify("0.01*(x-0.3)/pow((x-0.3)^2+(y-0.5)^2+(z-0.5)^2,1.5) - 0.01*(x-0.7)/pow((x-0.7)^2+(y-0.5)^2+(z-0.5)^2,1.5)");
	cy.Modify("0.01*(y-0.5)/pow((x-0.3)^2+(y-0.5)^2+(z-0.5)^2,1.5) - 0.01*(y-0.5)/pow((x-0.7)^2+(y-0.5)^2+(z-0.5)^2,1.5)");
	cz.Modify("0.01*(z-0.5)/pow((x-0.3)^2+(y-0.5)^2+(z-0.5)^2,1.5) - 0.01*(z-0.5)/pow((x-0.7)^2+(y-0.5)^2+(z-0.5)^2,1.5)");

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");
	gr->Puts(mglPoint(0,1.2,1),"Vector field (color ~ \\sqrt{a^2})",":rC",8);
	gr->Vect(a,b,"","value 50");
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");
	gr->Puts(mglPoint(0,1.2,1),"Vector field (length ~ \\sqrt{a^2})",":rC",8);
	gr->Vect(a,b);
	gr->EndFrame();

	gr->NewFrame();
	gr->Box();	gr->Axis("xy");
	gr->Puts(mglPoint(0,1.2,1),"Flow chart (blue - source)",":rC",8);
	gr->Flow(a,b);
	gr->EndFrame();

	return gr->GetNumFrame();
}


int main(int argc,char **argv)
{
	std::shared_ptr<mglFLTK> gr;
	char key = 0;

	if(argc>1)	key = argv[1][0]!='-' ? argv[1][0]:argv[1][1];

	else	printf("You may specify argument '1', '2', '3', 'd' for viewing examples of 1d, 2d, 3d, dual plotting.");

	switch(key)
	{
		case '0':	gr = std::make_shared<mglFLTK>((mglDraw *)NULL,"1D plots");
				gr->Rotate(40,60);	gr->Box();	gr->Light(true);
				gr->FSurf("sin(4*pi*x*y)");	gr->Update();	break;
		case '1':	gr = std::make_shared<mglFLTK>(sample_1,"1D plots");	break;
		case '2':	gr = std::make_shared<mglFLTK>(sample_2,"2D plots");	break;
		case '3':	gr = std::make_shared<mglFLTK>(sample_3,"3D plots");	break;
		case 'd':	gr = std::make_shared<mglFLTK>(sample_d,"Dual plots");break;
		case 't':	gr = std::make_shared<mglFLTK>(test_wnd,"Testing");	break;
		case 'f':	gr = std::make_shared<mglFLTK>("Frame drawing");
				gr->NewFrame();	gr->Box();	gr->EndFrame();	break;
		default:	gr = std::make_shared<mglFLTK>(sample,"Drop and waves");	break;
	}

	std::shared_ptr<Fl_RGB_Image> icon = std::make_shared<Fl_RGB_Image>(icon_data, 500, 500, 4, 0);
	Fl_Widget* widget = (Fl_Widget*)mgl_fltk_widget(gr->Self()); // get the underlaying fltk widget
	Fl_Double_Window* window = ((Fl_Double_Window*)widget->parent()); // get the underlaying fltk window
	window->icon(icon.get());

	return Fl::run();
}
