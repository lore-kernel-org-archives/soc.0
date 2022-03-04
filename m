Return-Path: <SRS0=arFV=TP=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83876C433EF
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 14:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EA14C340F1; Fri,  4 Mar 2022 14:43:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E8A9C340E9;
	Fri,  4 Mar 2022 14:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E8A9C340E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646405016; x=1677941016;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CW0GZlgSnEJ+z/BmZSRD3m0q4ahJDHVBRYgA4ELGTuQ=;
  b=fPFQo756LV4/yQMeFymLNkYjUAb4HSBVtTCiZcKhzKkRYUlMS7DfT8ax
   +8auCukGEsxxQuY4N3zMd5+bvW5/VVHuWgXRNbr1Fx3JRrzNzlj0bVS2P
   ELMq1AJZEe99IEdM87vZHtTWt32XfDheu/KY4ZHXojufrji0roO1PQQQm
   8+irrVyejgJJwHKcANhVFSQDhzYCrcL1yQuxY1oda1B2AH8NEMx6zHYzP
   Go9WihzD496ftAbdd+Ksc1N3EMWW+Vk0SVdQxRQSZsadthbimWcjNlPRr
   qvCz8UhNqs8dzCs5LOt1WxATr8Hk6ZzJFNMOBEOhs+hlg25vp+HYvNKyq
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; 
   d="scan'208";a="150870328"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 07:43:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 07:43:34 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 4 Mar 2022 07:43:32 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [GIT PULL] ARM: at91: soc for 5.18 #2
Date: Fri, 4 Mar 2022 15:42:17 +0100
Message-ID: <20220304144216.23340-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

One more patch for 5.18 on the SoC branch.
You already have the patch made by Conor "soc: microchip: make
mpfs_sys_controller_put static" in your tree, so I didn't add it here.

Thanks, best regards,
  Nicolas

The following changes since commit d0054a470c33902f5ae88835ed8a8ecc3cf8faa4:

  soc: add microchip polarfire soc system controller (2022-02-25 12:50:59 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.18-2

for you to fetch changes up to def8abbb1464579c37f15b3d7a95e5f3bab758dc:

  ARM: at91: add support in soc driver for new SAMA5D29 (2022-03-04 12:49:22 +0100)

----------------------------------------------------------------
AT91 SoC #2 for 5.18:

- SAMA5D29 variant to the SAMA5D2 family in SoC driver.

----------------------------------------------------------------
Mihai Sain (1):
      ARM: at91: add support in soc driver for new SAMA5D29

 drivers/soc/atmel/soc.c | 3 +++
 drivers/soc/atmel/soc.h | 1 +
 2 files changed, 4 insertions(+)

-- 
Nicolas Ferre
