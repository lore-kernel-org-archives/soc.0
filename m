Return-Path: <SRS0=HPaf=LF=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88942C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 12:35:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31C2C613DD; Fri, 11 Jun 2021 12:35:01 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11CE613B8;
	Fri, 11 Jun 2021 12:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11CE613B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623414900; x=1654950900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9oKOs6soBsf7r+2YKy8MGZXh0qlSUDGRKn5ybaBeEtg=;
  b=h5A7Yj65bzM+ynSTqv3uHjDlQMQwL1tAPRsqkoWOfBZ7FgBwvkS5Zs8O
   PWZl4Xo1ODMSDNZ+cn1ucTz14Tf8SJwDBac8nfi13mjb8Humu9sjM/E0X
   ZWOAQaqOj7yW628Ef0PHn2dG0K7u56UpnmDKz/Gw/meOB7qECJk8kn11z
   W2eiUTx9no9tvQw0t2sai+RN/WoxvtTkA6mfuDNg6EZIZhFPdv9DOC6LQ
   0+1Gg5GHa1umy3shdkPwzE6KvSrNCBW9eCCqGCl0MZVkqfKajF2FHFhdE
   G/VjAHnXaj5T64TIVBHhzoNIORsQr2HD0kM8BCN54mV6x+GegxWEBov+9
   g==;
IronPort-SDR: oveMVxy44jYHj0c1he8s0soS9zYYAD4Jryogra1xjJfITufBQN6yWKQ3+tgfWn6ZHgGFYLEWcf
 zWLkvfYfYrstG+D1aMA4NqxDSXOKzmmLhKZTO5z0Z4k8xDh5fDlkMDxB4qCKIPnv+NoGBm5v+f
 VRf7HezzAsMMjJqEkjeM98x4B7Qyuye9ucdFX7eKpNotYoG1qWlokOMi6qFWyCtW+u1i8Bctsk
 4zzHkk4ou5bM/+Zif/gJvAeJSpGLqjEyR/zVSLUJmeN4R/n8hMK+vm30JUY+FWTeqd7hP6sybs
 28A=
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="118397800"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jun 2021 05:34:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 05:34:59 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 11 Jun 2021 05:34:57 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.14
Date: Fri, 11 Jun 2021 14:34:46 +0200
Message-ID: <20210611123446.20510-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the first batch of dt changes for 5.14. Very small amount this time.

Thanks, best regards,
  Nicolas

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.14

for you to fetch changes up to 92e669017ff1616ba7d8ba3c65f5193bc2a7acbe:

  dt-bindings: i2c: at91: fix example for scl-gpios (2021-06-04 15:19:32 +0200)

----------------------------------------------------------------
AT91 dt for 5.14:

- A fix for sama5d4 gpio mux
- A trivial fix for DT documentation

----------------------------------------------------------------
Ludovic Desroches (1):
      ARM: dts: at91: sama5d4: fix pinctrl muxing

Nicolas Ferre (1):
      dt-bindings: i2c: at91: fix example for scl-gpios

 Documentation/devicetree/bindings/i2c/i2c-at91.txt | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Nicolas Ferre
