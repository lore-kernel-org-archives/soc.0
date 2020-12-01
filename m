Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6297EC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 20:44:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15CFF2220B; Tue,  1 Dec 2020 20:44:49 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5BF9321D7F;
	Tue,  1 Dec 2020 20:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606855489;
	bh=6cXeaIeIdbmC+HYmVDVTPFolLEAgizsqHOBdzvUx6pU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4Qj7p1WIJfSAo/6V/zyB+bl4ee41qN4QjmNTfDDoq5aOJ+uHeIqUldolKTzeMumw
	 mMljRFXOMOzw8P/VNFXIFVI7oCiEEr5djeY9ra7tDfi62tL3Nmy0TRwdYtNzZQM/ll
	 Q3/3FkaSIr0tm6L79q0yUf3jsKOtg3HLArTpIgFc=
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
Subject: [GIT PULL 3/4] arm64: dts: exynos: Pull for v5.11
Date: Tue,  1 Dec 2020 22:44:03 +0200
Message-Id: <20201201204404.22675-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.11

for you to fetch changes up to f74e93032df229a8358617e586ba89f744d5dbcd:

  arm64: dts: exynos: Drop incorrect use of io-channel-ranges property (2020-11-17 20:47:55 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.11

1. Several cleanups, including aligning node names with dtschema.
2. Add WiFi/PCIe to TM2 boards (Exynos5433).
3. Correct restart and shutdown of Exynos7 boards, as part of Paweł
   Chmiel Exynos7420 mainlining effort.

----------------------------------------------------------------
Jaehoon Chung (1):
      arm64: dts: exynos: add the WiFi/PCIe support to TM2(e) boards

Jonathan Cameron (1):
      arm64: dts: exynos: Drop incorrect use of io-channel-ranges property

Krzysztof Kozlowski (4):
      arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
      arm64: dts: exynos: adjust node names to DT spec in Exynos7 Espresso
      arm64: dts: exynos: remove redundant status=okay in Exynos5433 TM2
      arm64: dts: exynos: use hyphens in Exynos5433 node names

Paweł Chmiel (2):
      arm64: dts: exynos: Include common syscon restart/poweroff for Exynos7
      arm64: dts: exynos: Correct psci compatible used on Exynos7

Serge Semin (1):
      arm64: dts: exynos: Harmonize DWC USB3 DT nodes name

 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     | 10 ++---
 arch/arm64/boot/dts/exynos/exynos5433-pinctrl.dtsi |  2 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 39 +++++++++++++----
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 49 ++++++++++++++++++----
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  2 +-
 arch/arm64/boot/dts/exynos/exynos7.dtsi            | 15 +++----
 6 files changed, 84 insertions(+), 33 deletions(-)
