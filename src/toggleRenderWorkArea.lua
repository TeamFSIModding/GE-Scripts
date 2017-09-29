-- Author:TyKonKet
-- Name:toggleRenderWorkArea
-- Description:Toggles the visualization of the field areas
-- Icon:iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAARBJREFUOI2dk71KA0EURs9cZjfeZkNsbHwCCURIIQSUJcz7+Fw+hVjkDQR7sbDR0kKTuRbZwfGywZ+FaQ7f2TvzzS4Aqkr9qOqvWYE2rF1KfbdcnscSEhE8A55jjCYSrAADrIL2BwbAbYzRqikmIsQY36opJiKsVhcnlfwBQEp954NN07x6tl5fHXuGqjJMtgLbtn0akWcV2wGWUt/VzZqIMJm0DyPytGJbILsj78OqRxsvu+O9l8n1DTAUZj/IL07+eoEvcYQ9OlkPlggEJ987eQaE0RIBcfKdk09LdrREJ984dnYgByIydyVeu+Clk7ffSvznP7D/8FSVnHfkbGU3IaV+uljMm5wtAGGElcF8AjzcoOFIOa4vAAAAAElFTkSuQmCCAAAAAAAAAAAAAAAAAAAAWGcX2wABAIiQHxIAAAAAAIIfEgAAAAAAxgAAUgAAAAABAAAAAAAAAAAAAAAAAAAABgAAAAAAAAADAAAAYAAAAGAAAAAAAAAAAAAAAAsAAAAIAAAADwAAAAAAAAAAAAAAShQKmf/////EEAppAAAAAAAAAAAAAAAAYCLMMxkCAAAAAAAAIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP////8AAAAAAAAAAAAAAAD/////BgAAAAIAAAAAAAAA///////////oAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAPAAAAAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAABAAAAAAAAAAD/AAAA//////8IAAAAFQAAAAEAAAAAAAAAAAAAAA0AAAAFAAAAGAAAAAEAAABzZz7bAAIAkG4AYQBtAGUAPQBkAHkAbgB0AGIAOQA7AGMAYQBwAHQAaQBvAG4APQBTAGMAcgBpAHAAdABzACAANQA7AHMAdABhAHQAZQA9ADIAMQAwADgAMQA0ADYAOwBkAGkAcgA9ADEAOwBsAGEAeQBlAHIAPQAxADAAOwByAG8AdwA9ADAAOwBwAG8AcwA9ADgAOwBwAHIAbwBwAD0AMQAwADAAMAAwADAAOwBiAGUAcwB0AHcAPQAxADsAYgBlAHMAdABoAD0AMQA7AG0AaQBuAHcAPQAtADEAOwBtAGkAbgBoAD0ALQAxADsAbQBhAHgAdwA9AC0AMQA7AG0AYQB4AGgAPQAtADEAOwBmAGwAbwBhAHQAeAA9AC0AMQA7AGYAbABvAA==
-- Hide: no
function toggleRenderWorkArea_drawCallback()
    local r, g, b, a = 1, 0.1, 0, 0.4;
    local node = g_renderWorkAreaDrawFieldDefinition;
    local dimNode = getChildAt(node, 0);
    local dimNode1 = getChildAt(node, 1);
    local dimNode2 = getChildAt(node, 2);
    local x, y, z = getWorldTranslation(dimNode);
    local x1, y1, z1 = getWorldTranslation(dimNode1);
    local x2, y2, z2 = getWorldTranslation(dimNode2);
    drawDebugTriangle(x, y, z, x2, y2, z2, x1, y1, z1, r, g, b, a, false);
    drawDebugTriangle(x1, y, z2, x1, y1, z1, x2, y2, z2, r, g, b, a, false);
end

if g_renderWorkAreaDrawCallback ~= nil then
    removeDrawListener(g_renderWorkAreaDrawCallback);
    g_renderWorkAreaDrawCallback = nil;
    g_renderWorkAreaNode = nil;
else
    local node = getSelection(0);
    g_renderWorkAreaDrawFieldDefinition = node;
    if node == nil or getNumOfChildren(node) < 3 then
        print("Please select a valid workArea");
    end
    g_renderWorkAreaDrawCallback = addDrawListener("toggleRenderWorkArea_drawCallback");
end
