using AreasUtils;
using Microsoft.AspNetCore.Mvc;

namespace OpenShift_Area.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AreasController : ControllerBase
    {
        [HttpGet]
        public string GetPerimeter()
        {
            var dims = new AerasDims(3, 5);
            return dims.perimeter.ToString();
        }

    }
}
