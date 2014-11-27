/**
* Copyright 2014 Silviu Schiau.
*
* Author: Silviu Schiau <pr@silviu.co>
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

// Bubble sort is a simple sorting algorithm that works by repeatedly stepping through the list to be sorted, comparing each pair of adjacent items and swapping them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted.
// Complexity: O(n^2)
func bubbleSort(list: NSArray) -> NSArray
{
    var sortedList = list.mutableCopy() as NSMutableArray
    var isSorted = false
    
    while isSorted == false
    {
        isSorted = true
        
        for i in  0..<sortedList.count-1
        {
            var current: Int = sortedList[i] as Int
            var next: Int = sortedList[i+1] as Int
            
            if next < current
            {
                sortedList[i] = next
                sortedList[i+1] = current
                
                isSorted = false
            }
        }
    }
    
    return sortedList
}

// TEST
let list: NSArray = [18, 2, 6, 1, 5, 6, 1, 0, 43, 16]
bubbleSort(list);