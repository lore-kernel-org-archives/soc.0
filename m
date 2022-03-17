Return-Path: <SRS0=YD5N=T4=arm.com=andre.przywara@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF72DC433EF
	for <soc@archiver.kernel.org>; Thu, 17 Mar 2022 18:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E08CC340F3; Thu, 17 Mar 2022 18:30:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.kernel.org (Postfix) with ESMTP id E2A67C340E9
	for <soc@kernel.org>; Thu, 17 Mar 2022 18:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2A67C340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6A5D1682;
	Thu, 17 Mar 2022 11:30:51 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45DEA3F7F5;
	Thu, 17 Mar 2022 11:30:50 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/5] ARM: configs: fix multi_v5_defconfig
Date: Thu, 17 Mar 2022 18:30:38 +0000
Message-Id: <20220317183043.948432-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a revamp of two patches contained in some Allwinner
F1C100 DT update (patch 13 and 14 in [1]). Back then I was just syncing
the result of "make savedefconfig" over to multi_v5_defconfig, but this
revealed there were problems in the defconfig which warrant closer
inspection.

This series fixes the multi_v5_defconfig in a way that "make
savedefconfig" and multi_v5_defconfig come out identical, but also the
options we mention in the defconfig are actually honoured. Currently
some options are not enabled, because we lost dependencies over the past
two years or so.

The commit messages contain the details about what happened to each
option. Patches 1 and 4 are just cleanups, without .config or
savedefconfig changes, but patch 2 and 3 change the active options.
Patch 5 enables the Allwinner platform in the multi_v5_defconfig, so
that the LicheePi Nano boots to the prompt.

This series relies on [2], that fixes Kconfig dependencies for one of
the options we enable.

Please have a look!

Cheers,
Andre

[1] https://lore.kernel.org/all/20220307143421.1106209-1-andre.przywara@arm.com/
[2] https://lore.kernel.org/dri-devel/20220315084559.23510-1-tzimmermann@suse.de/raw

Andre Przywara (5):
  ARM: configs: multi_v5_defconfig: remove deleted platforms
  ARM: configs: multi_v5_defconfig: re-enable
    CONFIG_V4L_PLATFORM_DRIVERS
  ARM: configs: multi_v5_defconfig: re-enable DRM_PANEL and FB_xxx
  ARM: configs: clean up multi_v5_defconfig
  ARM: configs: multi_v5: Enable Allwinner F1C100

 arch/arm/configs/multi_v5_defconfig | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
2.25.1

