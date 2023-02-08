using Microsoft.AspNetCore.Http;
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
            return "Areas perimeter";
        }

    }
}
