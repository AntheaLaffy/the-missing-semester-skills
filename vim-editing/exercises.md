# 练习：Vim 编辑

对应课程第 3 讲的练习（节选，按主题归入本 skill），复习用。

1. **Vim mode 一个月**。在所有支持 Vim mode 的软件（编辑器、Shell 等）里启用 Vim 模式，接下来一个月里把所有文本编辑都用 Vim 模式完成。每当觉得哪里低效、或想到「肯定有更好的办法」，就去搜索——通常真的有更好的办法。
2. **VimGolf 挑战**。完成一道 [VimGolf](https://www.vimgolf.com/) 挑战。
3. **fizzbuzz 按键演练**。用下面的按键序列修复这段有问题的 fizzbuzz（从正常模式开始）：

   ```python
   def fizz_buzz(limit):
       for i in range(limit):
           if i % 3 == 0:
               print("fizz", end="")
           if i % 5 == 0:
               print("fizz", end="")
           if i % 3 and i % 5:
               print(i, end="")
           print()

   def main():
       fizz_buzz(20)
   ```

   - main 从未被调用：`G` 跳到文件末尾 → `o` 在下方开新行 → 输入 `if __name__ == "__main__": main()` → `<ESC>` 回正常模式
   - 从 0 开始而不是从 1 开始：`/range<CR>` 搜索 range → `ww` 前进两个 word → `i` 插入 `1,` → `<ESC>` → `e` 跳到下一个单词结尾 → `a` 追加 ` + 1` → `<ESC>`
   - 对 5 的倍数打印的是 "fizz"：`:6<CR>` 跳到第 6 行 → `ci"` 修改引号内为 `buzz` → `<ESC>`

> 改编自 MIT The Missing Semester 课程 Lecture 3: Development Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=QnM1nVzrkx8
