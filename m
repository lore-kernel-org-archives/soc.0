Return-Path: <SRS0=5s2Y=X3=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63795C433EF
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 15:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11977C341CB; Fri, 22 Jul 2022 15:18:20 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CA58C341C6;
	Fri, 22 Jul 2022 15:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9CA58C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658503098; x=1690039098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UswR2zWoW9d/yJ8KQoHjJwm0liWWYOrrjyelFdm2oAk=;
  b=hcEaP+PIIwCZ28vO6tJPNvVdbZ8J2PPa9D4yHzFmRuLcVglzNlXj8/f4
   EkgDqwuUfdsZ8o3RYbBkZ2v5dn7DWOsCmolVU0E4+R26QB2NvNw3x1nCv
   Pqq6e1wkb25HQk7sfxblZsFaTK1CV0W+YNO1vD/kC5QJkW8OfKKGJef7v
   FI7a170Pv5zUg+a+ACY5fA/It840V+ExqJWU6FRqTeLlx4diN2Xf9qtyO
   0MiSVAmyPTUZk5VeCxD30DkgkiW1a8vby4i66dr1baQOvxs7zGTWKExmF
   rK6bb98gy20zHmXO9x6gdZDdYcVzR3WvGu2X1flst7uKNnWZZoynigB4t
   g==;
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="183352091"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jul 2022 08:18:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Jul 2022 08:18:16 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 22 Jul 2022 08:18:14 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for v5.20 #3
Date: Fri, 22 Jul 2022 18:20:41 +0300
Message-ID: <20220722152041.1752962-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit be16285265868aa371378132fe37df2bc14ceb78:

  ARM: dts: kswitch-d10: enable the USB device port (2022-07-12 10:12:30 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.20-3

for you to fetch changes up to d3e71a2eae1f43fd318922694b843d34b4920b07:

  ARM: dts: lan966x: Enable network driver on pcb8291 (2022-07-22 17:54:09 +0300)

----------------------------------------------------------------
AT91 DT for v5.20 #3

It contains updates for LAN966X devices as follows:
- clock gating support
- gpio restart and network switch for lan966x-pcb8291 board

----------------------------------------------------------------
Horatiu Vultur (3):
      ARM: dts: lan966x: Add gpio-restart
      ARM: dts: lan966x: Disable can0 on pcb8291
      ARM: dts: lan966x: Enable network driver on pcb8291

Michael Walle (1):
      ARM: dts: lan966x: add clock gating register

 arch/arm/boot/dts/lan966x-pcb8291.dts | 43 ++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/lan966x.dtsi        |  2 +-
 2 files changed, 43 insertions(+), 2 deletions(-)
