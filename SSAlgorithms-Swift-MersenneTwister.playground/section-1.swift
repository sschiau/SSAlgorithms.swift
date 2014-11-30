/**
* Copyright 2014 Silviu Schiau.
*
*
* Generates uniformly distributed 32-bit integers in the range [0, 232 − 1] with the MT19937 algorithm
*
* Author: Silviu Schiau <pr@silviu.co>
* Marsene Twister
* Version: 1.0.0
* License Apache License Version 2.0 http://www.apache.org/licenses/LICENSE-2.0.txt
*
* This copyright notice
* shall be included in all copies or substantial portions of the software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
* DEALINGS IN THE SOFTWARE.
*
*/

import UIKit

var MT: NSMutableArray = []
var index: Int = 0


// Generate an array of 624 untempered numbers
func generateNumbers()
{
    for i in 0..<624
    {
        // bit 31 (32nd bit) of MT[i]
        var bit32 = MT[i] as Int & 0x80000000
        
        // bits 0-30 (first 31 bits) of MT[...]
        var first31bits = MT[(i+1) % 624] as Int & 0x7fffffff
        
        var y: Int = bit32 + first31bits
        
        MT[i] = MT[(i + 397) % 624] as Int ^ (y >> 1)
        
        // y is odd
        if (y % 2) != 0
        {
            // 0x9908b0df
            MT[i] = MT[i] as Int ^ 2567483615
        }
    }
}

// Extract a tempered pseudorandom number based on the index-th value,
// calling generate_numbers() every 624 numbers
func extractNumber() -> Int
{
    if index == 0
    {
        generateNumbers()
    }
    
    var y: Int = MT[index] as Int
    
    y = y ^ (y >> 11)
    y = y ^ ((y << 7) & 2636928640) // 0x9d2c5680
    y = y ^ ((y << 15) & 4022730752) // 0xefc60000
    y = y ^ (y >> 18)
    
    index = (index + 1) & 624
    
    return y
}

// Initialize the generator from a seed
func initGenerator(seed: Int) -> Void
{
    index = 0
    MT[0] = seed
    
    // loop over each other element
    for i in 1..<624
    {
        // 0x7fffffff max 32bit
        MT[i] = (1812433253 * (MT[i-1] as Int ^ (MT[i-1] as Int >> 30)) + 1) & 0x7fffffff
    }
}

initGenerator(1)
extractNumber()
