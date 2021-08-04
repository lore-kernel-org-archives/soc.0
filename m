Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF42C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:52:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3840460EE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3840460EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dcwpa7ZqK5MIGRIgYmQqkcPSkwXpQu33GKUbMYVwigM=; b=iH/PbAXtVYZI9G
	v4rmHHxNyk5onmCB1pwRJxzucOGhHlMoWVD+VWTiy9KsJ+KK3IRQEoTZMg1ANp5SUjX4qkZlMk1bO
	trfF5MHQbuDsggRy75B1iho18DtWvMxJ/h6y7iUklkkBkiKVN1wAfID4fXVwWl9XG0/XIG88PumWf
	nBn0qnPIIxiQSDPSIukCx4ee8XZ0+UaSwrN7s9xMxUGtNh+enJerCunOLVsDHWFD5I2Ff9AavgW1o
	9ew6oPGo1uSZ9HmyEaHTsS/gjMK1OQM6BZxalcjoholFsXETqqX0nDjUJzlGG0Wvv/pVyJeJcXxxt
	Pu9hPDHVPtiU8d0a4pwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBCbO-005CtH-NR; Wed, 04 Aug 2021 08:50:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCbK-005CsH-FC
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 08:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628067010; x=1659603010;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SANyoTXEkSZYs9jZZwYAbHPpyzXhdOFIYKmGc0zGshw=;
 b=1leIKgh3vksEAEzzUrFLLOdB2f2F6m+B4thn5Itcn/PLVVLXGu3uGw0e
 vCGl/xjpm9p6rgYobgCHmQd8MF47Q2roQYiTUlEur7hC07+7BJNMKqAB0
 TjNn1ZZTwnvobtFDen7K2/PiYb/1sDTQjhtuOYm5oN4SwSZHJP0mhOBSY
 I427lfZAGd1ey2tNZ96PFIYS4QdvOI5snI8Leb0W14tQI/Z5GiaiVpV+v
 GQ9zoHSY8Cj2zv19EMlChEgO3I2S6srZoJ9+EmENM2WUw80n8FFY6li8n
 vSjCd9fOYLQo4wQFOfBuGTPK1ZVb/GCvoWR8wK7XBuUrEPNT88FNtRVDB Q==;
IronPort-SDR: JnIJ5QtIuF25Imbomp8RfiFz+9kOBrxiW/FVmznWJfXDHZQaFDJKiEC+LPNFgq4D6l9rwuJpWv
 4YBxpvnn7D17uOEmXGjG15VUatOlJtEWkYUpPrSyHBdwi/1oQAJEW/7W8hZsoMOrBugFpX1rs+
 +Ymzgs5lJiUybPrCxlgqj9vxa40QYISf6tqRCon18pkAQUu27ijvz/WaJ4YK+opk7Xhozx3FkH
 yxFEmyh9rPSWNkOcjGJSW68mfx7JIgMEtXX8dfxqhDLjMOvHrm3z1u+f33iB1dRneTc6o8MGyk
 Z+Jh5HzwOdDuiGK7AoCvWs5P
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="64658358"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Aug 2021 01:50:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 01:50:08 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 4 Aug 2021 01:50:05 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: dt for 5.15
Date: Wed, 4 Aug 2021 10:50:00 +0200
Message-ID: <20210804085000.13233-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_015010_635135_CDC93917 
X-CRM114-Status: GOOD (  12.19  )
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
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804085000.fF2bQrmI1cx5EcsGnHamYO_SGjdNxESAXDV2ifMUcAM@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the dt changes for 5.15 which contains addition of SAMA7G5, some
enhancements to current boards and a couple of (low priority) fixes.

Thanks, best regards,
  Nicolas

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.15

for you to fetch changes up to 818c4593434e81c9971b8fc278215121622c755e:

  ARM: dts: at91: use the right property for shutdown controller (2021-08-02 12:34:09 +0200)

----------------------------------------------------------------
AT91 dt for 5.15:

- add sama7g5 SoC and associated evaluation kit, the sama7g5-ek
- adaptation of some DT for sama5d27 som1 ek, sama5d4 xplained and
  sama5d2 icp boards
- fixes to gpio and shutdown controller nodes for all boards

----------------------------------------------------------------
Claudiu Beznea (3):
      dt-bindings: atmel-sysreg: add bindings for sama7g5
      ARM: dts: at91: add pinctrl-{names, 0} for all gpios
      ARM: dts: at91: add conflict note for d3

Codrin Ciubotariu (1):
      ARM: dts: at91: sama5d2_icp: enable digital filter for I2C nodes

Eugen Hristev (3):
      dt-bindings: ARM: at91: document sama7g5ek board
      ARM: dts: at91: add sama7g5 SoC DT and sama7g5-ek
      ARM: dts: at91: sama5d27_som1_ek: enable ADC node

Ludovic Desroches (1):
      ARM: dts: at91: sama5d4_xplained: change the key code of the gpio key

Nicolas Ferre (1):
      ARM: dts: at91: use the right property for shutdown controller

Tudor Ambarus (1):
      ARM: dts: at91: sama5d4_xplained: Remove spi0 node

 .../devicetree/bindings/arm/atmel-at91.yaml        |   5 +
 .../devicetree/bindings/arm/atmel-sysregs.txt      |  14 +-
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/at91-kizbox3_common.dtsi         |   2 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |  18 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |   6 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |   2 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |   8 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |   2 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |   2 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |  31 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |  32 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               | 656 +++++++++++++++
 arch/arm/boot/dts/sama7g5-pinfunc.h                | 923 +++++++++++++++++++++
 arch/arm/boot/dts/sama7g5.dtsi                     | 528 ++++++++++++
 15 files changed, 2209 insertions(+), 22 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sama7g5ek.dts
 create mode 100644 arch/arm/boot/dts/sama7g5-pinfunc.h
 create mode 100644 arch/arm/boot/dts/sama7g5.dtsi

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
