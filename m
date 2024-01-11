Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C332C4707B
	for <soc@archiver.kernel.org>; Thu, 11 Jan 2024 09:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 352ECC43390; Thu, 11 Jan 2024 09:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A270C433C7;
	Thu, 11 Jan 2024 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704965161;
	bh=0sHnXFouDrtnfeOKWMZKWZHvuInb51lYTqFKQBQ461I=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=QyYN/x67IXYp9bgF+TOvEMDOchCccT6nFCDxA1OT3rf7quTOolG+2qcTOYOOciS2f
	 ked+AN5MDtEERO3f3CK4FN/JBor1A4w9byfdu6h4HKoHacDA7WdiLjrCnFIh1wWROK
	 kDJv+Jw/9OIcYh2hxIDOvSxharzCWeN2bKjB58SamgfJ12q6ZcuTKX+t2LBdhb8VQ2
	 jhGWYNFLHt62JjhnM49sWCLWQNTTqHvQ0K3qqtzKIqbGTGpCavbt4QTKvQF+iYgo0R
	 RbNnUWzhF1Ljk2X8qP/kfcUG4XZPRlUPl/fFihJxfMqZ7+t20hDdTdOB3Xh15Hw0JM
	 yJjKREfQ2fFgw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/6] ARM: refresh config files
Date: Thu, 11 Jan 2024 10:25:44 +0100
Message-Id: <20240111092550.1313277-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

I added these to my soc/defconfig branch to help minimize the
diff for 'make savedefconfig'. there are still a lot of lines that
get dropped by this, but I did not manage to get through all of them.

Arnd Bergmann (6):
  arm64: defconfig reorder config lines
  ARM: defconfig: reorder config lines
  ARM: defconfig: remove sysfs-deprecated entries
  ARM: defconfig: remove CONFIG_NET_ETHERNET references
  ARM: defconfig: remove CONFIG_SLUB references
  ARM: defconfig: remove dead platform options

 arch/arm/configs/am200epdkit_defconfig |   2 -
 arch/arm/configs/aspeed_g4_defconfig   |   4 +-
 arch/arm/configs/aspeed_g5_defconfig   |   4 +-
 arch/arm/configs/assabet_defconfig     |   1 -
 arch/arm/configs/at91_dt_defconfig     |   4 +-
 arch/arm/configs/bcm2835_defconfig     |   4 +-
 arch/arm/configs/clps711x_defconfig    |   7 --
 arch/arm/configs/collie_defconfig      |   3 +-
 arch/arm/configs/davinci_all_defconfig |   2 +-
 arch/arm/configs/dove_defconfig        |   2 -
 arch/arm/configs/ep93xx_defconfig      |   2 +-
 arch/arm/configs/footbridge_defconfig  |   1 -
 arch/arm/configs/gemini_defconfig      |   2 +-
 arch/arm/configs/imx_v4_v5_defconfig   |   5 --
 arch/arm/configs/jornada720_defconfig  |   2 -
 arch/arm/configs/lpc32xx_defconfig     |   2 -
 arch/arm/configs/mmp2_defconfig        |   2 -
 arch/arm/configs/moxart_defconfig      |   4 +-
 arch/arm/configs/multi_v4t_defconfig   |   3 +-
 arch/arm/configs/multi_v5_defconfig    |   2 +-
 arch/arm/configs/multi_v7_defconfig    |  26 +++---
 arch/arm/configs/mv78xx0_defconfig     |   2 -
 arch/arm/configs/neponset_defconfig    |   1 -
 arch/arm/configs/netwinder_defconfig   |   1 -
 arch/arm/configs/omap1_defconfig       |   6 +-
 arch/arm/configs/pxa168_defconfig      |   2 -
 arch/arm/configs/pxa3xx_defconfig      |   2 -
 arch/arm/configs/pxa910_defconfig      |   2 -
 arch/arm/configs/pxa_defconfig         |   9 +-
 arch/arm/configs/qcom_defconfig        |  10 +--
 arch/arm/configs/realview_defconfig    |   6 +-
 arch/arm/configs/rpc_defconfig         |   5 +-
 arch/arm/configs/s3c6400_defconfig     |   2 -
 arch/arm/configs/s5pv210_defconfig     |   2 -
 arch/arm/configs/sama5_defconfig       |   2 +-
 arch/arm/configs/sama7_defconfig       |   4 +-
 arch/arm/configs/spitz_defconfig       |   2 -
 arch/arm/configs/stm32_defconfig       |   2 +-
 arch/arm/configs/tegra_defconfig       |   4 +-
 arch/arm/configs/vf610m4_defconfig     |   2 +-
 arch/arm64/configs/defconfig           | 120 ++++++++++++-------------
 41 files changed, 110 insertions(+), 160 deletions(-)

-- 
2.39.2

