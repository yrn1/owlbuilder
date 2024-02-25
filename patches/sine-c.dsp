declare owl "[voct:input]";

import("stdfaust.lib");
import("owl.lib");

tune = hslider("Tune[OWL:D]", 0, -0.1, 0.1, 0.001) - 1.75;

process = sample2hertz(tune) : os.oscs <: _,_;