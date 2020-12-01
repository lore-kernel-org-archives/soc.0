Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C936C64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 20:44:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EE154217A0; Tue,  1 Dec 2020 20:44:44 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3ACD6206E0;
	Tue,  1 Dec 2020 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606855484;
	bh=vVZ+K/b8J7gDzg0Bd0fi47AEfEtZuQondB5ry8wIBok=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=DLtT6P2/a3SPbiwFBo1NqmQdZw4YzrL84Dk7CRQ0JPmgAds0cehwJat4KtEoarOzr
	 dfXDkfGlXXLT289kjAykZJf61sbn1P5m4olqp2MgPEV83eBbtb10S40Mqi3ELnPMwB
	 z77o5xNvWkTvX4U4jcIovfdmcckgesAgmnPCH2Fw=
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
Subject: [GIT PULL 1/4] ARM: defconfig: samsung for v5.11
Date: Tue,  1 Dec 2020 22:44:01 +0200
Message-Id: <20201201204404.22675-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.11

for you to fetch changes up to 225ef3a3e8f48154ca7a4cfe44d3b576aff2f860:

  ARM: multi_v7_defconfig: make Samsung Exynos EHCI driver a module (2020-11-25 19:33:27 +0100)

----------------------------------------------------------------
Samsung defconfig changes for v5.11

1. Enable sound driver for Midas (Exynos4412 based) boards.
2. Enable ax88796c Ethernet driver for Artik5 (Exynos3250) board.
3. Enable Atmel touchscreen and STMPE ADC drivers for P4 Note board.
4. Build Samsung Exynos EHCI as module, to match the setting for the PHY
   driver.

----------------------------------------------------------------
Marek Szyprowski (3):
      ARM: exynos_defconfig: enable sound driver for Midas platform
      ARM: multi_v7_defconfig: enable sound driver for Midas platform
      ARM: multi_v7_defconfig: make Samsung Exynos EHCI driver a module

Martin Jücker (2):
      ARM: defconfig: add STMPE ADC driver for P4 Note
      ARM: exynos_defconfig: compile Atmel MXT touchscreeen as module

Łukasz Stelmach (1):
      ARM: defconfig: Enable ax88796c driver for Exynos boards

 arch/arm/configs/exynos_defconfig   | 8 +++++++-
 arch/arm/configs/multi_v7_defconfig | 7 ++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)
