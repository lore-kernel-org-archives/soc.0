Return-Path: <SRS0=h2dX=3Z=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479FC4332F
	for <soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97E5EC433D7; Fri, 25 Nov 2022 14:00:42 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2D93C433C1;
	Fri, 25 Nov 2022 14:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2D93C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669384840; x=1700920840;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kZ6l9IK0hqNxspdPyuio7aO/qr/yU78UB/H6DApFSwA=;
  b=U8qHcv/K6MNAaSlRnpjhijs1aRsGClWLlELgzyHaM293HwLVWDdp+2EA
   D7438rc9hAw/RWD1QcBKtoofTUpCJLMApUZaNboMPVH7BneZjm2clz036
   MAXE47nDLA8ZaNmv6+Bp28jqw8HkkvyOvR4D/t2dpB6G3F41EMQfpvOYg
   5yZCCNeXdusrlsLVp4auxHHg02xWghqeiZg2KAwXVFftlMvd8z77THBCW
   XOMiu855ELekT+Vp0ZwX6jLXo+E5a6UnoZnYZfM4SgWH6TMr+7Joj+hqi
   Mo0XtAU4iz3UqsvGrT45yDY2CUOAUcqEQFdj9INLTsGKIdoQV2HJpuNuP
   w==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="190546141"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 07:00:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 07:00:36 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 25 Nov 2022 07:00:35 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for 6.2 #3
Date: Fri, 25 Nov 2022 16:05:25 +0200
Message-ID: <20221125140525.384928-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 7a3c62678699d7e56736c2d0579d077a7773e77c:

  ARM: dts: at91: sama7g5: fix signal name of pin PD8 (2022-11-17 15:32:33 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.2-3

for you to fetch changes up to eb93f1d7c91d8d6fe6fc001e0b515d1bbd755fd2:

  ARM: dts: lan966x: Add otp support (2022-11-25 11:11:50 +0200)

----------------------------------------------------------------
AT91 DT for 6.2 #3

It contains:
- proper power rail description for SDMMC devices available on
  SAMA7G5-EK
- OTP controller has been added for LAN966X devices

----------------------------------------------------------------
Eugen Hristev (1):
      ARM: dts: at91: sama7g5ek: align power rails for sdmmc0/1

Horatiu Vultur (1):
      ARM: dts: lan966x: Add otp support

 arch/arm/boot/dts/at91-sama7g5ek.dts | 5 ++++-
 arch/arm/boot/dts/lan966x.dtsi       | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)
