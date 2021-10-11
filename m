Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1222C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 12:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A491A60E9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 12:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A491A60E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bi88FamsvWEXo/NO1A4PB2dnNEf6gwaKFQl9sIcqF+o=; b=UND/tJP45ZbI0p
	9qvX4uk4T6yTh6p2Rn8+7UmW2NqpBJ36i6PC+28ByI6huzVt8DqaGq/ydkJscyWlY0zTVfRm1HOcC
	spVwwn81xI6f8XLTDuXLGD8fbu4h2BWwY/4XDPmGxoN8XWVRxxyMkndnzbbmPS42I3/Rk8xuLgjHs
	iPrz12FovUqq16gyPnZ1YmujUuPt2TJ2VfuAQeygIwXcRbjau4LDoEVBn9tk+x/bz8UjwqB4U6LQQ
	RpzrdZVp3J+dDWWvdA4xbKSvKm/c/Im+3sT/Ym/Ma2+pvYmb8ryD75iWUSzwdZ9HBGdGlkGZ5M1pk
	ItD6A1AZd8l3t56c9QeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZuWD-009Lng-V1; Mon, 11 Oct 2021 12:35:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZuW9-009LmW-GO
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 12:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633955697; x=1665491697;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=19Zf8gS8tbv3mJ7/Vg+/VX208ra+1ZI4GBOQZ9ZBMxs=;
 b=v0LW/yspzeDH/h3DIVdmghH5pFynxMB2Bg9FMrsocXKzhSHbmJKN6me7
 ris0k29i3TbpcrI1SmkCx82XV2apXP6Rs0Km+zpIzkDZcXAQ2rS0rYqFR
 n0iqVbGwHqYYwkmo/A45m3THmsx6etdfBTRyZtoTuyIWGK8IhR/lT0mo9
 /Fj7vflGylxCud6C2Z6shKgy1yXNRCJqWSxa4HgSPUorGNs2NzxIXe460
 SXilkp1C8m0eJ+ahhJCGT4z5ERRZCcTHgVOzL+AKkhofDr+FWfLa935aY
 B1P9ci9r9uf/O1HMEQW4EDy3oq1GhXi1qx7PUTBoMMMSs3u/cFNGch2t/ Q==;
IronPort-SDR: p0mg/WOOlihCpcH/XXXAjeE4kr0V8UQTuuovd36qIMe4cYtgq+6u//P5SzhD70610UngoWyGDe
 GvWW1p9D54eEC/EUbYLfwqsn3YFh61FoZnfcaMC6lmIzegP0mskEwfiHItKqHiPR7akh59T1d6
 lv87CWS2eTFH38R7RABV2/DVhxuES8kuzwYnFVDvE17Gd4jR3Mva2UkaB7cqQiLKuVUINWPwgZ
 etJbwU/hzjCPg2VqbtXhTMFHPUg8Z4Ht3zi/kx0Cy2jSc5A/bQEtQBKcKOCxm9b/JhrGRuEFAX
 a4/q4rzdd4JRCx99yj8t3aBK
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="139834233"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Oct 2021 05:34:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 11 Oct 2021 05:34:54 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 11 Oct 2021 05:34:52 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: dt for 5.16
Date: Mon, 11 Oct 2021 14:34:38 +0200
Message-ID: <20211011123438.16562-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_053457_617128_D01CAB55 
X-CRM114-Status: GOOD (  11.56  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211011123438.cvSTY-hot1bDps8GK3LueeZX_S7m84KojyOeNwYhNA4@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the first batch of dt changes for 5.16.

Thanks, best regards,
  Nicolas

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-dt-5.16

for you to fetch changes up to 4c46b991bab640ee91f16967be2b0d00b7d5f992:

  ARM: at91: dts: sama5d29: Add dtsi file for sama5d29 (2021-09-21 12:37:07 +0200)

----------------------------------------------------------------
AT91 DT #1 for 5.16:

- Addition of a new variant in the sama5d2 family: the sama5d29 with
  significant updates being CAN and Ethernet controllers;
- Add support for Exegin Q5xR5 and CalAmp LMU5000 boards which were
  maintained up to this moment, separately, in OpenWrt tree;
- Two more boards gained I2C bus recovery support;
- Tse850 updated with one Ethernet fix;
- Sama7g5ek gained ADC nodes  and sama5d27_wlsom1 WiFi support.

----------------------------------------------------------------
Adam Porter (1):
      ARM: dts: at91: add CalAmp LMU5000 board

Claudiu Beznea (5):
      ARM: dts: at91: at91sam9260: add pinctrl label
      dt-bindings: add vendor prefix for calamp
      dt-bindings: ARM: at91: document CalAmp LMU5000 board
      dt-bindings: add vendor prefix for exegin
      dt-bindings: ARM: at91: document exegin q5xr5 board

Durai Manickam KR (2):
      ARM: dts: at91-sama5d27_som1_ek: Added I2C bus recovery support
      ARM: dts: at91-sama5d2_icp.dts: Added I2C bus recovery support

Eugen Hristev (3):
      ARM: dts: at91: sama5d27_wlsom1: add wifi device
      ARM: dts: at91: sama7g5: add node for the ADC
      ARM: dts: at91: sama7g5ek: enable ADC on the board

Hari Prasath (1):
      ARM: at91: dts: sama5d29: Add dtsi file for sama5d29

Owen Kirby (1):
      ARM: dts: at91: add Exegin Q5xR5 board

Peter Rosin (1):
      ARM: dts: at91: tse850: the emac<->phy interface is rmii

 .../devicetree/bindings/arm/atmel-at91.yaml        |  12 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/at91-lmu5000.dts                 | 147 +++++++++++++++
 arch/arm/boot/dts/at91-q5xr5.dts                   | 199 +++++++++++++++++++++
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |  12 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |  23 ++-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |  70 ++++++++
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |  22 ++-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |   8 +
 arch/arm/boot/dts/at91-tse850-3.dts                |   2 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |   2 +-
 arch/arm/boot/dts/sama5d29.dtsi                    |  16 ++
 arch/arm/boot/dts/sama7g5.dtsi                     |  16 ++
 14 files changed, 528 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts
 create mode 100644 arch/arm/boot/dts/sama5d29.dtsi

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
