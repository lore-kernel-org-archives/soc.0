Return-Path: <SRS0=zSrx=VZ=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750C5C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 15:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4289AC34117; Tue, 17 May 2022 15:39:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40A47C34116;
	Tue, 17 May 2022 15:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40A47C34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652801978; x=1684337978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vjEkaJTkjDDJBA3jZlCF4IOQPC13hVXrVqeqKghrK44=;
  b=kUAqPXWoc2u3xFwtKC0LzXt/O1tMkH/TtFt9IqdFeT46Qz7BX3dXYUNd
   5+kQAoNm7LaRZtbRU2UX1PWw96Pxi1nzopSetLW6w/5T/Y7nElGUrb0Mx
   +s6KUCAqesfs90fUEJgW4hy+ibEZKxBW2my91dlxyw/V2Z0l4RGF+/u5F
   kqvYoslA+A6pViAfrkxjNdD6uZ599b64FmAkyBVDK+Pw7v3Ct5nDktQan
   pAqhhBy0NzkRQEQE64Cw6AvwDlYLEETSbvBbBaI7O7XuIZT9tJG+DMl+c
   vtFWOFhTgta4PSgNavVRo2SyP9AmLr53TuLLliXgWXAvxbYCmPoOTC5QM
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="156418168"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2022 08:37:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 17 May 2022 08:37:56 -0700
Received: from ROU-LT-M43238L.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 17 May 2022 08:37:54 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.19 #2
Date: Tue, 17 May 2022 17:32:52 +0200
Message-ID: <20220517153252.92393-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the (late) second batch of dt changes for 5.19. It's not crucial code,
so you can just postopone its inclusion without any problem.

Thanks, best regards,
  Nicolas

The following changes since commit 46a9556d977e290a18890fb4cf07d19b0da16f31:

  ARM: dts: kswitch-d10: enable networking (2022-05-13 16:42:43 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.19-2

for you to fetch changes up to 821cb05f6b4b024847624de0d0e5765c7b09b947:

  ARM: dts: at91: sama7g5ek: add node for PDMC0 (2022-05-17 17:14:42 +0200)

----------------------------------------------------------------
AT91 DT #2 for 5.19:

- at91: more DT compliance updates for RTC and RTT nodes
- at91: sama7g5: add microphone support

----------------------------------------------------------------
Codrin Ciubotariu (2):
      ARM: dts: at91: sama7g5: add nodes for PDMC
      ARM: dts: at91: sama7g5ek: add node for PDMC0

Sergiu Moga (2):
      ARM: dts: at91: Add the required 'atmel, rtt-rtc-time-reg' property
      ARM: dts: at91: Use the generic "rtc" node name for the rtt IPs

 arch/arm/boot/dts/at91-sama7g5ek.dts | 21 ++++++++++++++++++++-
 arch/arm/boot/dts/at91sam9261ek.dts  |  4 ++++
 arch/arm/boot/dts/at91sam9263ek.dts  |  4 ++++
 arch/arm/boot/dts/at91sam9rlek.dts   |  4 ++++
 arch/arm/boot/dts/sam9x60.dtsi       |  2 +-
 arch/arm/boot/dts/sama7g5.dtsi       | 26 +++++++++++++++++++++++++-
 6 files changed, 58 insertions(+), 3 deletions(-)

-- 
Nicolas Ferre
