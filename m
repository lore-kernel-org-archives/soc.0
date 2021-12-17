Return-Path: <SRS0=Mh7t=RC=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD3FC433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D52B1C36AE9; Fri, 17 Dec 2021 16:59:03 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E91E1C36AE7;
	Fri, 17 Dec 2021 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E91E1C36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639760343; x=1671296343;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XjAbaeCyYnGkhfNDEqSOCJEj/QZGtp6vPVcYYe4dPY4=;
  b=fZJ2rTOyVPwsSz5d4Mq5+EBFlsQaUQCNjslkIWbz65VIPEPsTONVf1WX
   4kC1gfunw1AU68rR7x595TvfSu0VB6uZg9/KOjyPDog89kql4JWBOAYJK
   s7HeOH2WQLxqtj9e1i6HYwpuRaKMxMrBayJdiDECmuJRkJv8YS/O6mXed
   i5KgrNI94hW9cHxt652Crg1ZOvqjTbR/wf7HUoeeh+Uq9unJAOlPBwMri
   oS/ewGHMwA5qklGqthiIzDUVmt23iDP6TWDa0dq1sjMaC9A2IZ/qxXOV/
   UGZBScJ1HXSn6tGkMgU5dTVZ+8tUqHARsn9pubdYTzXpa5k/IAsLYHiAl
   g==;
IronPort-SDR: xzuxQW5TBDcMlRuhOKooiRHEV0AciTsO1IyHvD476Ue4XHCX0rGX1UnULDJVXOxu3aQ5aFA57m
 CdToHFtFQRY7onhEf3FJOGf4eANgaXPgL3hhy00vTV93AY/EKZYJVv4WPBb63eKEDP37tBg/Sc
 7mCZEp0mNmr7vUtdHoJCGpk7diawWukh0zy0HcVOpH1KT/lZSLDU80eBjC05cW//7CmIZn4H1m
 Fn7RLAVCUbZmPjZ0U0JZXNnjq2FFWuZgjbHws95zN6FMPpv2410wxfNoQDt8SRhhmmYdQS4Nh9
 JEYhfFwWaSgXOgdlvWYwODQz
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="147046955"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 09:59:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 09:59:01 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 09:58:59 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [GIT PULL] ARM: at91: defconfig for 5.17
Date: Fri, 17 Dec 2021 17:58:50 +0100
Message-ID: <20211217165850.29694-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the defconfig changes for 5.17. Please pull.

Thanks, best regards,
  Nicolas

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.17

for you to fetch changes up to e1137bcefa025ec4c583e85d6c86c9ba11133224:

  ARM: configs: at91: Enable crypto software implementations (2021-12-17 17:51:36 +0100)

----------------------------------------------------------------
AT91 defconfig #1 for 5.17:

- Sama7: addition of QSPI SPI-NOR and the QSPI controller for this
  product
- Addition of the crypto algorithms that are fallbacks for HW engines

----------------------------------------------------------------
Tudor Ambarus (2):
      ARM: configs: at91: sama7: Enable SPI NOR and QSPI controller
      ARM: configs: at91: Enable crypto software implementations

 arch/arm/configs/at91_dt_defconfig | 9 ++++++++-
 arch/arm/configs/sama5_defconfig   | 8 ++++++++
 arch/arm/configs/sama7_defconfig   | 5 +++--
 3 files changed, 19 insertions(+), 3 deletions(-)

-- 
Nicolas Ferre
