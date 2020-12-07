Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CECC4361B
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 07:45:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4833722BE8; Mon,  7 Dec 2020 07:45:48 +0000 (UTC)
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
Subject: [GIT PULL 2/2] ARM: dts: samsung: Third pull for v5.11
Date: Mon,  7 Dec 2020 08:45:28 +0100
Message-Id: <20201207074528.4475-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207074528.4475-1-krzk@kernel.org>
References: <20201207074528.4475-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

I think the 2nd pull was not merged so it's message is here:

Samsung DTS ARM changes for v5.11, part two

1. Add devicetree of Samsung Galaxy Note 10.1 tablets
   (GT-N8010/GT-N8013), called P4 Note.  These are quite old but
   still functional devices, based on Exynos4412.
2. Minor cleanups in Odroid XU3 Ethernet.
3. Minor fixes: ADC io-channel-ranges and P4 Note touchscreen GPIO
   polarity.

Best regards,
Krzysztof


The following changes since commit afbd0bdebe0d82c4846dbbce53625110889c5de8:

  ARM: dts: exynos: switch Atmel mxt reset GPIO to active low on P4 Note (2020-11-22 12:36:11 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.11-3

for you to fetch changes up to 7995fb896b9637a5f59a56ae0d8f2b7ca71a040d:

  ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 board (2020-12-03 22:42:12 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.11, part three

1. S3C bindings and DTS cleanup,
2. Correct the clock rates for SPI0 in Artik 5 which is a fix for recently
   introduced Ethernet on SPI on Artik 5 board.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      dt-bindings: arm: samsung: document SMDK2416 board binding
      dt-bindings: arm: samsung: document S3C6410-based boards binding
      ARM: dts: s3c24xx: add SMDK2416 board compatible
      ARM: dts: s3c6410: correct SMDK6410 board compatible

Marek Szyprowski (1):
      ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 board

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 13 +++++++++++++
 arch/arm/boot/dts/exynos3250-artik5-eval.dts                |  7 ++-----
 arch/arm/boot/dts/s3c2416-smdk2416.dts                      |  2 +-
 arch/arm/boot/dts/s3c6410-smdk6410.dts                      |  2 +-
 4 files changed, 17 insertions(+), 7 deletions(-)
