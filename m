Return-Path: <SRS0=zSrx=VZ=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB968C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 15:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C30E1C34119; Tue, 17 May 2022 15:08:42 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47F1FC34116;
	Tue, 17 May 2022 15:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47F1FC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652800121; x=1684336121;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7m2XYwtoguE1rr8a0hZclV93DDxQXRnyoanZTRu0XsU=;
  b=06nfKo4IqwTW9lT/tVBkVWzGGw3HcmJQKsumqp//rlGd1XFEi01Nq3Gj
   1yPTFHk/g2Z8uElNTPGt91756AyawILzVFWCJAwP3iCRp/gKjeW72+Cdb
   odLhC0hBlqjctxhIPd7ChQ+47hsgbl58wbJC/Bc5cpTC7tMD/gKSqNVf3
   LkBGa96vovEok3Q4AX+2hTWDbuZfO2kuy7xsyFnkZx/joLD69u7FkJc9x
   P7hge3vsaate+yGxnkS4JXxmNRiVtHG4TMdIndCKkZmoqtxjkyqmjib03
   5eGknetf6q/PJcO4l8FqXtQBxqQ2LbkLRAFXCNqXFNa1OZAhm5jVfxT4D
   A==;
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="159435231"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2022 08:08:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 17 May 2022 08:08:37 -0700
Received: from ROU-LT-M43238L.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 17 May 2022 08:08:34 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?=
	<clement.leger@bootlin.com>
Subject: [GIT PULL] ARM: at91: soc for 5.19 #2
Date: Tue, 17 May 2022 17:08:32 +0200
Message-ID: <20220517150832.89451-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is one more soc patch for 5.19. It goes on top of previous PR from last
week and fixes one patch queued in this presious series.

Please pull. Thanks, best regards,
  Nicolas

The following changes since commit 6041558ebf1fc87d1e0bdeb51e985807dab06bed:

  ARM: at91: debug: add lan966 support (2022-05-13 13:42:03 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.19-2

for you to fetch changes up to 46a65cd376f9f754149be33b32244cabcf376982:

  ARM: at91: pm: Fix rand build error (2022-05-17 16:40:34 +0200)

----------------------------------------------------------------
AT91 SoC #2 for 5.19:

- One Kconfig fix for random build error

----------------------------------------------------------------
YueHaibing (1):
      ARM: at91: pm: Fix rand build error

 arch/arm/mach-at91/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Nicolas Ferre
