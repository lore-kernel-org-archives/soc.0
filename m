Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623BFC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 20:44:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D0B821741; Tue,  1 Dec 2020 20:44:47 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4DB5421D42;
	Tue,  1 Dec 2020 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606855486;
	bh=27tCpQcWOs4tSngGp9vXEG4BIPRYRzE0lDdLeMC9nhk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d78RAluWg3tIjuQZyCTjFMS1Wvmp5SfWWCg/vuTOeC8OsPoAiE8UyGEaiwYhCCJzm
	 7IqeRWusLN9Wdhq5CY6NZQBW8A1Xwf9avC1f5PlrzOvP0DK1KexifWLYaPDZt6K0lK
	 KrNQiXm3CMeb2kzWBdgiRMmDBCSx5yIesjFMwZqY=
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
Subject: [GIT PULL 2/4] ARM: dts: samsung for v5.11
Date: Tue,  1 Dec 2020 22:44:02 +0200
Message-Id: <20201201204404.22675-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201201204404.22675-1-krzk@kernel.org>
References: <20201201204404.22675-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Samsung changes, on top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 73f882a0f3a833d589c1a0b6b83045567244e71e:

  ARM: dts: exynos: use hyphens in MFC reserved memory node names (2020-11-10 19:21:21 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.11-2

for you to fetch changes up to afbd0bdebe0d82c4846dbbce53625110889c5de8:

  ARM: dts: exynos: switch Atmel mxt reset GPIO to active low on P4 Note (2020-11-22 12:36:11 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.11, part two

1. Add devicetree of Samsung Galaxy Note 10.1 tablets
   (GT-N8010/GT-N8013), called P4 Note.  These are quite old but
   still functional devices, based on Exynos4412.
2. Minor cleanups in Odroid XU3 Ethernet.
3. Minor fixes: ADC io-channel-ranges and P4 Note touchscreen GPIO
   polarity.

----------------------------------------------------------------
Jonathan Cameron (3):
      ARM: dts: exynos: Drop incorrect use of io-channel-ranges
      ARM: dts: s5pv210: Drop incorrect use of io-channel-ranges property
      ARM: dts: s5pv210: Drop unneeded io-channel-ranges property in Aries

Martin Jücker (3):
      dt-bindings: arm: samsung: document bindings for P4 Note family board
      ARM: dts: exynos: add Samsung's Exynos4412-based P4 Note boards
      ARM: dts: exynos: switch Atmel mxt reset GPIO to active low on P4 Note

Łukasz Stelmach (2):
      ARM: dts: exynos: Fix Ethernet interface description on Odroid XU3
      ARM: dts: exynos: Add an alias for the Ethernet interface on Odroid XU3

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/exynos3250.dtsi                  |    1 -
 arch/arm/boot/dts/exynos4412-p4note-n8010.dts      |   17 +
 arch/arm/boot/dts/exynos4412-p4note.dtsi           | 1132 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4412.dtsi                  |    1 -
 arch/arm/boot/dts/exynos5250.dtsi                  |    1 -
 arch/arm/boot/dts/exynos5422-odroidxu3.dts         |    8 +-
 arch/arm/boot/dts/exynos54xx.dtsi                  |    1 -
 arch/arm/boot/dts/s5pv210-aries.dtsi               |    1 -
 arch/arm/boot/dts/s5pv210.dtsi                     |    1 -
 11 files changed, 1164 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n8010.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi
