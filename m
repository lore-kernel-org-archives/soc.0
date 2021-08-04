Return-Path: <SRS0=6aPj=M3=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1ADBC4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 08:46:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 91B7B60F02; Wed,  4 Aug 2021 08:46:44 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1546460EBB;
	Wed,  4 Aug 2021 08:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1546460EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628066804; x=1659602804;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4pYMkRlX38NNd5ekcHCNDs7b0kdlhQPRaRpUCPO9W/I=;
  b=xJaiEuv8VHVoGRhYiNgGnU58wsAmoYOcdFPWcFdIz27ZibMq0e+5U5yB
   IIMpfPVAKTVDFt/bAFEE8PS9gjWtkfyFTer40vzeZCBcfJYjvFWLzcPWj
   5V83DWnHa9L37GoLTB4PZFv+tJ7N3qhim+NBKgNBv9tmdTQgM5H8mSjPx
   m9hZyJ+DAyEVd92Vin5DzAG3W/o6q7wU5wDgXJlHTlnc4BxQjG5Eub7Xo
   gHDUey4DcFNjS8+Q4g0NPv/goL9GS+e5Lvem9N4u6ecbgM5cn+IwZcC8q
   nKtfPCwkL+i4MoViOVw7VmzFPUROPyGqgG8BhYBBWDBNk7lax11wOr8ST
   A==;
IronPort-SDR: 9avkbVS1wlSP3hKoTjJ6W3uD/yjWK22S09qLRA7utGzaXXmCP0bw6hfH7BJmV2sqNGmX7oafEV
 pmguns90+qXB5DlMIiObPHfzro8tyWjUr+ItgPEQ5Mx7uzO9u1JNlmoX7MV5UKnzpB28AmPfbi
 Rc/zJLtWh51iHq9GzePhjYsn2iawwDEkxcDiI+s0+HkFY5/WqwUXTH9EJw8ztYLFZMvezE4mSk
 kMirjDp0sgQefxM1dZlAt4IeDby6D2DJd/zmta6s1TjOEtsKbOQr/6AS6WIkoCvxsYdIgXku0J
 C1LJIjpxZbZUlo7dfOI8DnXd
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="138755645"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2021 01:46:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 01:46:42 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 4 Aug 2021 01:46:40 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>
Subject: [GIT PULL] ARM: at91: defconfig for 5.15
Date: Wed, 4 Aug 2021 10:46:31 +0200
Message-ID: <20210804084631.12934-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the defconfig changes for 5.15 which contains addition for SAMA7G5.

Thanks, best regards,
  Nicolas

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.15

for you to fetch changes up to b62869dcd4bcf341d3750a2bcad9a80c6d5562a8:

  ARM: multi_v7_defconfig: add sama7g5 SoC (2021-07-19 15:25:42 +0200)

----------------------------------------------------------------
AT91 defconfig for 5.15:

- add defconfig entries for new SoC: SAMA7G5
  - dedicated sama7_defconfig to match the needed peripherals and
    dependencies
  - addition to the generic multi_v7_defconfig

----------------------------------------------------------------
Eugen Hristev (2):
      ARM: configs: at91: add defconfig for sama7 family of SoCs
      ARM: multi_v7_defconfig: add sama7g5 SoC

 arch/arm/configs/multi_v7_defconfig |   2 +
 arch/arm/configs/sama7_defconfig    | 209 +++++++++++++++++++++++++++++++++++
 2 files changed, 211 insertions(+)
 create mode 100644 arch/arm/configs/sama7_defconfig

-- 
Nicolas Ferre
