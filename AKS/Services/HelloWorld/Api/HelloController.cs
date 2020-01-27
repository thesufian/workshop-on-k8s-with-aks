using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace HelloWorld.Controllers
{
    [Route("api/hello")]
    public class HelloController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public HelloController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        [Route("")]
        public IActionResult Get()
        {
            var message = _configuration["Hello:Message"];
            return Ok(new { message });
        }
    }
}
