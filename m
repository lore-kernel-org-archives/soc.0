Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0220CC433E0
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 19:12:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C02B721BE5; Mon, 25 Jan 2021 19:12:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A55B21744;
	Mon, 25 Jan 2021 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611601972;
	bh=Xp/vjvu8f0gxOYSI4XF+2RKl9p51s4STWbFzsfsTK/M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OGRjUI59EItjK4kku7manjTyCncPB0aXjyWr/R8diTb7DZYpNGK8iJsoOWcc2AWI/
	 u6LcdsjFNRbuPs1wXxbjXKJCsyIvd4mHHNUieAHQbjQRGjMgs4raD3fYx4gAcJtnMM
	 qncvtTqF0MtxQEG7S150t9dAexIC7qGdbI08wEpdHIR69vMSUcFz//pyLsInQpGHgQ
	 jK1LlyIOVAiRW3WOj9dXAYR2m0DPpPELbGGda4EkneMI5tG3oyWcoREGqX7X4pZuE4
	 3/j7hptYaFoj/ZFQ0qctoGLBKAV5dKDZ6+GOHt9+25rQcfBmfPjibBTEqsg/5r+Mp3
	 zimU/CoDElu+Q==
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
Subject: [GIT PULL 1/3] soc: samsung: drivers for v5.12
Date: Mon, 25 Jan 2021 20:12:38 +0100
Message-Id: <20210125191240.11278-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125191240.11278-1-krzk@kernel.org>
References: <20210125191240.11278-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.12

for you to fetch changes up to c09a3e6c97f00a525e23854d63f003aba9adfa41:

  soc: samsung: pm_domains: Convert to regular platform driver (2021-01-15 20:50:34 +0100)

----------------------------------------------------------------
Samsung SoC drivers changes for v5.12

1. Adjust deferred probe and handle regmap_read() errors in Exynos ASV
   driver.
2. Convert the ChipID code into a driver (from a early initcall) and
   merge it into the Exynos ASV.
3. Convert the PM domains code into a driver. This is necessary for
   upcoming code enabling fw_devlinks.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      soc: samsung: exynos-asv: handle reading revision register error
      soc: samsung: exynos-chipid: convert to driver and merge exynos-asv
      soc: samsung: exynos-chipid: correct helpers __init annotation

Marek Szyprowski (2):
      soc: samsung: exynos-asv: don't defer early on not-supported SoCs
      soc: samsung: pm_domains: Convert to regular platform driver

 arch/arm/mach-exynos/Kconfig        |  1 -
 drivers/soc/samsung/Kconfig         | 12 ++---
 drivers/soc/samsung/Makefile        |  3 +-
 drivers/soc/samsung/exynos-asv.c    | 57 ++++++++--------------
 drivers/soc/samsung/exynos-asv.h    |  2 +
 drivers/soc/samsung/exynos-chipid.c | 71 ++++++++++++++++++---------
 drivers/soc/samsung/pm_domains.c    | 97 ++++++++++++++++++-------------------
 7 files changed, 125 insertions(+), 118 deletions(-)
