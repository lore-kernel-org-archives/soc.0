Return-Path: <SRS0=h2dX=3Z=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF68C4332F
	for <soc@archiver.kernel.org>; Fri, 25 Nov 2022 14:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 737DBC433D7; Fri, 25 Nov 2022 14:01:36 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0DDAC433D6;
	Fri, 25 Nov 2022 14:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0DDAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669384893; x=1700920893;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dpga1nt+LVvl6AdQuHJLwyEYXsGPR+BRmfkaRLBvClc=;
  b=h3QbUvjs6PeBIWEUmBIXTeX68czcblTuJSxyYBohD+zRpgUoJPaBElwl
   qlOrgd7sm27gVGw0jgQvfYM/uhLOXwgzf8tkPb4wEjw9utVl8hkYi2MsM
   1VfgGdOkUoPCKgjSm38Ij9ONX6kABqOTqxHfjsavZQRM6jauV3rShE8Ul
   8dq6l18UzphX5HcofdYmlBTv01Y/gg80cMXa3bMfWLLwVGY6nk5hb/DC2
   DcfLZq1rPC5nmU4AYTCp7U6ehKPMz2ysUNSDO0WVVcB9U7wea2pccQ79a
   N8NfYQq75NSvI6h0dj/ugOMU2iOX5PdquOXpa3DL6O60BLqsf+Zblb9AK
   g==;
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; 
   d="scan'208";a="201397673"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 Nov 2022 07:01:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 25 Nov 2022 07:01:32 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 25 Nov 2022 07:01:30 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 defconfig updates for 6.2 #2
Date: Fri, 25 Nov 2022 16:06:21 +0200
Message-ID: <20221125140621.384953-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd,

This contains also a patch for multi_v7_defconfig.

Thank you,
Claudiu Beznea

The following changes since commit d2c064d66e91de391c0b1208c9ac8a54ec3b065f:

  ARM: configs: at91: sama7: add config for thermal management (2022-11-01 12:29:30 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.2-2

for you to fetch changes up to c38fa1bff0c4270c5cf1f69820c3caa5d4f56709:

  ARM: configs: multi_v7: switch to new MICROCHIP_ISC driver (2022-11-25 15:33:43 +0200)

----------------------------------------------------------------
AT91 defconfig for 6.2 #2

It contains:
- updates for defconfigs to use the new CONFIG_VIDEO_MICROCHIP_ISC,
  CONFIG_VIDEO_MICROCHIP_XISC config flags that replaced the
  CONFIG_VIDEO_ATMEL_ISC, CONFIG_VIDEO_ATMEL_XISC. Drivers under
  CONFIG_VIDEO_ATMEL_* were moved to staging and considered deprecated.

----------------------------------------------------------------
Eugen Hristev (2):
      ARM: configs: sama5/7: switch to new MICROCHIP_ISC driver
      ARM: configs: multi_v7: switch to new MICROCHIP_ISC driver

 arch/arm/configs/multi_v7_defconfig | 4 ++--
 arch/arm/configs/sama5_defconfig    | 2 +-
 arch/arm/configs/sama7_defconfig    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
