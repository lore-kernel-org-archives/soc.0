Return-Path: <SRS0=v9WN=FK=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A14C4361B
	for <soc@archiver.kernel.org>; Sun,  6 Dec 2020 18:32:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 43F352312F; Sun,  6 Dec 2020 18:32:38 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524212311B;
	Sun,  6 Dec 2020 18:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524212311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1klypn-0003xT-WC; Sun, 06 Dec 2020 19:32:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 5.11
Date: Sun, 06 Dec 2020 19:32:35 +0100
Message-ID: <2750818.e9J7NaK4W3@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-defconfig64-1

for you to fetch changes up to eeffc0fbd022422777b91cdfa0e12ba2bcd6c5e7:

  arm64: defconfig: Enable RTC_DRV_HYM8563 (2020-11-30 22:23:58 +0100)

----------------------------------------------------------------
Some additional modules needed by Rockchip-based boards.

----------------------------------------------------------------
Jagan Teki (4):
      arm64: defconfig: Enable ROCKCHIP_LVDS
      arm64: defconfig: Enable PHY_ROCKCHIP_INNO_DSIDPHY
      arm64: defconfig: Enable USB_SERIAL_CP210X
      arm64: defconfig: Enable RTC_DRV_HYM8563

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)



