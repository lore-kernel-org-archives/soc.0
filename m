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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D933DC433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 17:49:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7859610A0; Thu,  1 Apr 2021 17:49:55 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5223460234;
	Thu,  1 Apr 2021 17:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5223460234
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299395; x=1648835395;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t+Damo6lBLTec0MqdYsAZG21XEfwTrUjDwnQIVPgrfg=;
  b=C1JlNayVuothxW5Q1zNAHSzT0JD30HKCQPhNeuKTGYc50akr8tkSDhw/
   DBlb/E7liLuR7h+QsxCVIgr6q/sN4sbxqa95P09nsNDm7Hn0v1Hm18vtg
   8trrijmPoY2ZUR4LDI3WlATK2R+9SHIcdKJ0Qsv341i6gkbC/CQp6wm2d
   8vwB5AFsjJohHMvxOSN7OpnYK9I3ELl492RtBibORU4yj0JEArNP9Oah3
   vC3SjYP0y8LpHbcLvAWCzVAa9MHrV4dvL65tJIjRWW5LnepfnDy8KbDWq
   Z6R9JI1R8HsPR+ci1E1ZHSQSsjdRbsIjcGU3NHqn/nWwh7wV8crAmyfRC
   A==;
IronPort-SDR: 5Ng5NM1EzbpwR/HTQNvjcYL+q3V6cpSEYUklwZ7HK057B398VMKy7ww3FQCX3PxiL+u3xAMd55
 MXUshv32BekJnKyET4D489sAzSpIGtg6eqmR/LYgGcT6AHFfvCai4HxPcgvH9jkVRiHUF/VIkt
 dapG1mATxs46C4ElHH7FoXFGb2vgTzPrbx4ZDVrZFsWtf9Rl2B7ZyXbTLXgeDXK/GIiVarPOXS
 7aLrbtkGK+ZQOXfye16SXvY8kG+hwYf9n6Pv9gbrVw9Db3edYDVLcvqt7Z6pcSNs0fjKoo+ZT+
 eQ4=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="112171420"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 10:49:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 10:49:54 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 10:49:52 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: soc for 5.13
Date: Thu, 1 Apr 2021 19:45:44 +0200
Message-ID: <20210401174544.32193-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

One single patch for now on our SoC branch. Stakeholders agreed to make it
travel with at91 -> arm-soc.

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.13

for you to fetch changes up to 41dbf4a146a06443d1cbf39e238f02fa1ca9d626:

  ARM: at91: pm: Move prototypes to mutually included header (2021-03-26 18:20:49 +0100)

----------------------------------------------------------------
AT91 soc for 5.13:

- Fixing a W=1 warning

----------------------------------------------------------------
Lee Jones (1):
      ARM: at91: pm: Move prototypes to mutually included header

 arch/arm/mach-at91/pm.c        | 19 ++++++++-----------
 drivers/pinctrl/pinctrl-at91.c |  2 ++
 include/soc/at91/pm.h          | 16 ++++++++++++++++
 3 files changed, 26 insertions(+), 11 deletions(-)
 create mode 100644 include/soc/at91/pm.h

-- 
Nicolas Ferre
