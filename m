Return-Path: <SRS0=qWJH=7X=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12616C76196
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 14:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7D87C4339B; Fri, 31 Mar 2023 14:28:20 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3D5CC433D2;
	Fri, 31 Mar 2023 14:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3D5CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680272898; x=1711808898;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FPeKCSq//jX/PgJO9hMQy3VzulKpWZJXnBnblAWYvII=;
  b=yWeNpTld/qahhRPmSL8Fn2hBvtPLcrAzvR/Hwa98A3ZWpwmtp2HlnqO8
   y+uLO0lA0tIKNHY3bovtpxZ56Ogm0SyZem+aCUENuyucsLMwz2CXLhzGP
   JFCaQcdI4NQPtpyUGaR4kv8QaiyWZxTxissS5jAosHRxFhNwF7c8S0R9R
   GgKHy3TeZf6Bq/AsVQr4EwmWzgT59XwJqejZzlAFxUPInNZyOM9lSfxxC
   YIKU3YPav49hxSJXQu65ElAlSt/ulOhgTjLddWbotvtvmdoFIYCVb4ImC
   b/k/rkK2YiH7BK42fnLwa6s4Xl1UyH13bC6CI4VdZm9FQEvrRgug9mtsV
   g==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="208261974"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 07:28:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 07:28:16 -0700
Received: from ROU-LT-M43238L.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 07:28:14 -0700
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
Subject: [GIT PULL] ARM: at91: dt for 6.4
Date: Fri, 31 Mar 2023 16:27:51 +0200
Message-ID: <20230331142751.41522-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the dt changes for 6.4. Just a few patches this cycle, please pull.

Thanks, best regards,
  Nicolas

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.4

for you to fetch changes up to 2c0a1faa4da5324a2ad6621b69fb7db26134b994:

  ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency (2023-03-30 21:20:59 +0200)

----------------------------------------------------------------
AT91 device tree updates for 6.4:

It contains:
- Update to maximum frequency for QSPI on several boards thanks
  to the additon of the new spi-cs-setup-ns property.

----------------------------------------------------------------
Tudor Ambarus (4):
      ARM: dts: at91-sama5d27_wlsom1: Set sst26vf064b SPI NOR flash at its maximum frequency
      ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency
      ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency
      ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency

 arch/arm/boot/dts/at91-sam9x60ek.dts        | 3 ++-
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi   | 3 ++-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi | 3 ++-
 arch/arm/boot/dts/at91-sama5d2_icp.dts      | 3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

-- 
Nicolas Ferre
