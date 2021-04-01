Return-Path: <SRS0=cELQ=I6=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66E2C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 16:26:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9695061381; Thu,  1 Apr 2021 16:26:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D89761382;
	Thu,  1 Apr 2021 16:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D89761382
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617294385; x=1648830385;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mPIkwjQD5YnDveLgKJWb0Q8rKtmMJ9ReFqXZsU3nKaU=;
  b=MB9L5/yHpm+Wm+wMC7X8ffpXzSaCDaB/OibY67ziJp6s+mYqCttkf/0+
   jn9FZFv1J0cEF5kakIMuTc2R+xcZ2oKM68UYxvmxvATlvbNt6xWl/nMkz
   RuuEmzQtanllz+X6wn3JJb6C+9Fs+g6gxeRPJFNdwhn4aZkoF3z5lQ0Fc
   x9Kkq+1yKONnR1eLZKRYybhGeQRChC3MHQGlSBeMMfLZiZPKAOgoBVp4s
   CGdEbi2f5QvUTBMUYyCKV7k0ZELvjMuxgGxuie8+Q6SCE/YMLZ5JYxsss
   F4EC9aOf7KgxEXaZXHSAAIv6ytu8B6eevivXgKbSmAv45P++x22J0RXLX
   w==;
IronPort-SDR: qhXlHQJy4oJtmkri0qncFVEdMT5iG+XH8L8JyrM+PXWaQDlsH3zzQVgdrv8oNOGk6s16oGs5fz
 Bk01o4eH/KjvfR4OnCBICd310G5Fc2vmsRV1Q2XKYa4k0xDe5BZkFYoczu4JU78D2y92NIh+gH
 ej7c8T18NtstEDan6vRRalQhaG2EZ1g8ira50fmwxWtCocfbfIc7PCrqT0UkG06ZB5YOS887Kz
 vvI6w8jVj7PJiMAgtIR942dOY16DjH2kkXyOX44U2BjLgxBzZhnWo50YeerIkppj2OYfbjLeQM
 lGQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="109371184"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 09:26:23 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 09:26:23 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 09:26:21 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: defconfig for 5.13
Date: Thu, 1 Apr 2021 18:22:07 +0200
Message-ID: <20210401162207.29299-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the defconfig changes for 5.13 which is bigger than usual for aligning
with options that we use frequently and some changes which will be beneficial
for CI.
There is an update with savedefconfig included, tell me if you prefer the PR
without this first patch of the series.

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.13

for you to fetch changes up to 4136c4443efce6f028eca74885870ac649981da1:

  ARM: configs: at91: Modernize UBI defconfig part (2021-03-29 11:27:14 +0200)

----------------------------------------------------------------
AT91 defconfig for 5.13:

- aligment with recent kernel for sama5_defconfig
- move of 2 options to built-in
- addition of useful modules for validation and CI
- addition of Hantro G1 VPU from staging

----------------------------------------------------------------
Codrin Ciubotariu (1):
      ARM: configs: at91: sama5: Add audio MIKROE PROTO board

Emil Velikov (2):
      ARM: configs: at91: sama5: update with savedefconfig
      ARM: configs: at91: sama5: enable the Hantro G1 engine

Nicolas Ferre (4):
      ARM: configs: at91: sama5: MCP16502 regulator as built-in
      ARM: configs: at91: Add mtd tests as modules
      ARM: configs: at91: Add USB Video webcam class
      ARM: configs: at91: Modernize UBI defconfig part

Razvan Stefanescu (2):
      ARM: configs: at91: sama5: PIOBU as built-in
      ARM: configs: at91: sama5: Enable LAN78XX as module

 arch/arm/configs/at91_dt_defconfig |  5 +++-
 arch/arm/configs/sama5_defconfig   | 51 ++++++++++++++++++++---------------
 2 files changed, 33 insertions(+), 23 deletions(-)

-- 
Nicolas Ferre
