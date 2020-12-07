Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24CEC4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 07:45:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5635C229C6; Mon,  7 Dec 2020 07:45:46 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] soc: samsung: Second pull for v5.11
Date: Mon,  7 Dec 2020 08:45:27 +0100
Message-Id: <20201207074528.4475-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 124f035310adc781d91cdf0b7c6e4fb3c7e43e23:

  clk: samsung: allow building the clkout driver as module (2020-11-12 17:18:40 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.11-2

for you to fetch changes up to 4c44274ee457e3f7012dc532c8c9cc8964a82612:

  clk: samsung: mark PM functions as __maybe_unused (2020-12-05 15:13:17 +0100)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.11, part two

1. Mark PM functions of newly added clkout module as unused to silence
   !CONFIG_PM warnings.
2. Initialize ChipID driver later - in arch initcall.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: samsung: mark PM functions as __maybe_unused

Krzysztof Kozlowski (2):
      soc: samsung: exynos-chipid: order list of SoCs by name
      soc: samsung: exynos-chipid: initialize later - with arch_initcall

 drivers/clk/samsung/clk-exynos-clkout.c |  4 ++--
 drivers/soc/samsung/exynos-chipid.c     | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)
