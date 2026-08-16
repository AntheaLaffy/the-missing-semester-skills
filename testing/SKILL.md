---
name: testing
description: >
  测试与覆盖率：单元/集成/功能测试、TDD、回归测试、性质测试（Hypothesis/QuickCheck）、
  mock 外部依赖、行覆盖率与 Codecov。Use when the user asks to write tests, raise coverage,
  or choose a testing approach. 触发于「写测试/提覆盖率/选测试策略」。
---

# 测试

主线：测试是提高正确性信心的标准技术——写代码去调用你的代码，行为不符预期就报错。TDD 的红-绿-重构纪律另见 dsh 的 `tdd` skill；本 skill 只做 MIT 讲义的科学面（测试类型与工具）。

## 测试类型

- 按粒度：单元测试（单个函数）、集成测试（模块/服务之间的交互）、功能测试（端到端场景）。
- TDD 先写测试再写实现；发现 bug 时写**回归测试**——未来再坏立刻能抓住。
- 性质测试（property-based）：QuickCheck（Haskell）开创，Hypothesis（Python）等实现——声明性质，框架随机找反例。
- 用哪种看项目，通常是若干种的组合。
- 依赖数据库/Web API 等外部服务时，测试里 mock 它们，不真打第三方。

## 覆盖率

- 行覆盖率：测试跑过哪些行，按行显示、指导补测试；Codecov 类服务提供 Web 界面跟踪项目历史。
- 覆盖率是质量指标之一，不是目标本身——别过度追求数字，高质量的测试更重要。
- 让 AI 提覆盖率时，要给它「带覆盖率跑测试 + 逐行覆盖率报告」的环境，它才知道聚焦在哪；AI 生成的测试要审（见 `agentic-coding`）。发现 bug 后补回归测试的排查思路见 `debugging`。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 9: Code Quality（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=XBiLUNx84CQ
