Return-Path: <SRS0=PSrN=BT=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F0EC77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 10:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D456C433D2; Tue, 30 May 2023 10:59:44 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30815C4339C;
	Tue, 30 May 2023 10:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30815C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685444381; x=1716980381;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jAFCKE5zOPZlL6OeGR8Vuo6TAJ2+n4ENV8nKXtEDP3Q=;
  b=PGQla4LrFnsvfIriA3QJ4qvFUTj2qao6mcgYHgwhgTGES33G4s+Bs0nW
   9tjNvHpkl6KAdl/dUdgRbXZVNZ08Dp12blHI4UzgPd/D+fY0+OGkwzXA3
   kR0BTHSAKpzREdWPFXYx+h2HmMXc/cUKSNeNCnvKRjprQHpjgfGvLYgcs
   +t52lGaVvKHZpb+BJMla/1ve9jayCRIUWG/Zt64KUwaYKKLi8+flx4KjQ
   rtW4UFThbJjtoCaHWVKq8j6LfQkwv301PvUPGtLRX87gfi4UaPFg0QbgC
   pFc7jauzGaniFy8JWIBXR5GUO5wInVKjGe/rAkbFaQd//XlKhQuTBcL+G
   A==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="217927080"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 03:59:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 03:59:36 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 30 May 2023 03:59:34 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.4
Date: Tue, 30 May 2023 13:59:30 +0300
Message-ID: <20230530105930.11621-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.4

for you to fetch changes up to 6b0db163ff9200a55dc77a652dad1d4b0a853f63:

  ARM: dts: at91: sama7g5ek: fix debounce delay property for shdwc (2023-05-24 11:50:22 +0300)

----------------------------------------------------------------
AT91 fixes for 6.4

It contains:
- fix imbalanced reference counter for ethernet devices; without it
  system hangs after consecutive suspend/resume cycles;
- fix debounce delay property for shutdown controller; the initial DT
  property is not what the driver expects.

----------------------------------------------------------------
Claudiu Beznea (2):
      ARM: at91: pm: fix imbalanced reference counter for ethernet devices
      ARM: dts: at91: sama7g5ek: fix debounce delay property for shdwc

 arch/arm/boot/dts/at91-sama7g5ek.dts |  2 +-
 arch/arm/mach-at91/pm.c              | 20 +++++++++-----------
 2 files changed, 10 insertions(+), 12 deletions(-)
