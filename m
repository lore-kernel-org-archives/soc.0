Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C72C433DB
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 19:12:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AE544221E3; Mon, 25 Jan 2021 19:12:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1036521D79;
	Mon, 25 Jan 2021 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611601976;
	bh=V+ItWKJbb51hevbOoFFfArpLuF+1sIMvo9Ou3fOfQGM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7oA2czoLGKKs4kqPkqK3oT5Yeh6CY12yG795vmfFeTcHP4MPRi0xs9UYsXmBrRYY
	 g0gxminyxtML6rRHzhsc9kemdT8G4QkS8D79Laa0axBHyev0+rJbzRbV155HZbLiFd
	 KrKlBY0C5en5qHfVzWKfCr9X+vJ+Xdc4+y2fI1/IVOFneExatryLtaFwT8SYJZPcuX
	 qIOgUaQaEqymKwbr1TpaWddhKpj15DU2i3OvxGgFgHC3aGL2yyPACyl8I7s5OfvTGh
	 uQ2Sin0dVcpmKExJqTEDZSKHVylhHaZSGMrXyRZS6Tba12vy9sdU/7rCeI0qthmGDu
	 PU6UIvXDmxRmw==
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
Subject: [GIT PULL 3/3] arm64: dts: samsung: DTS for v5.12
Date: Mon, 25 Jan 2021 20:12:40 +0100
Message-Id: <20210125191240.11278-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125191240.11278-1-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.12

for you to fetch changes up to 545a540a9c2ec192cdd5c75af1e334711a79354a:

  arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2 (2020-12-29 16:47:20 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.12

Correct Samsung PMIC and S3FWRN5 NFC interrupts trigger levels on
TM2/TM2E and Espresso boards.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: exynos: correct PMIC interrupt trigger level on TM2
      arm64: dts: exynos: correct PMIC interrupt trigger level on Espresso
      arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 4 ++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
