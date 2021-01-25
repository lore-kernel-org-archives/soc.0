Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D87C433DB
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 19:12:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B40C7221FB; Mon, 25 Jan 2021 19:12:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1AE7421D94;
	Mon, 25 Jan 2021 19:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611601974;
	bh=2VuRuHW8Al2DfnQg6T81D9vdEK7Yw6uv4M3aBtQ02rE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GwBl19TQPtO32Ms7qWQnBYXb9z+aNt16f9wzrYWC07+BBBeFJe0PwCe3k7aTgcepR
	 n6sQI7y/EnLVnavQ47u9x201TVXUkWv2GQjCENhCHVxm62gE1bnsx0E6trrS+2J9gG
	 Aa3RB6YQnu02NnsNlYoFRFp5uey/dXolbud2z1P6K9WiAC65m5Tybdx3S3A6Pp7Ni2
	 0ZnLXV+aqw1hT5HMG3BXfK2scJ+XH34/OYasPczjXwy1eSbZfb55jWheGAsd+IC5mO
	 ljQ3ezRlbYwsrfTTpj1C3ZC8jCypli/VVQnOFlAW3JUSgWFnvCMn08vyFYqP7qFhSX
	 QzH8yX2AgaEFA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
Date: Mon, 25 Jan 2021 20:12:39 +0100
Message-Id: <20210125191240.11278-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125191240.11278-1-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.12

for you to fetch changes up to 3803f461bd28c1c817281348509399778633e82f:

  ARM: dts: exynos: Add top-off charging regulator node for I9100 (2021-01-03 17:33:29 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.12

1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
   it suspend/resume cycle.
2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
3. Correct the voltages of Samsung GT-I9100 charger and add top-off
   charger.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      ARM: dts: exynos: correct PMIC interrupt trigger level on Artik 5
      ARM: dts: exynos: correct PMIC interrupt trigger level on Monk
      ARM: dts: exynos: correct PMIC interrupt trigger level on Rinato
      ARM: dts: exynos: correct PMIC interrupt trigger level on Spring
      ARM: dts: exynos: correct PMIC interrupt trigger level on Arndale Octa
      ARM: dts: exynos: correct PMIC interrupt trigger level on Odroid XU3 family

Marek Szyprowski (1):
      ARM: dts: exynos: use Exynos5420 dedicated USB2 PHY compatible

Timon Baetz (2):
      ARM: dts: exynos: Fix charging regulator voltage and current for I9100
      ARM: dts: exynos: Add top-off charging regulator node for I9100

 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  2 +-
 arch/arm/boot/dts/exynos3250-monk.dts         |  2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts       |  2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts        | 30 ++++++++++++++++-----------
 arch/arm/boot/dts/exynos5250-spring.dts       |  2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
 arch/arm/boot/dts/exynos54xx.dtsi             |  6 +++---
 8 files changed, 27 insertions(+), 21 deletions(-)
