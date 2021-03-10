Return-Path: <SRS0=XJCD=II=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D19C433E6
	for <soc@archiver.kernel.org>; Wed, 10 Mar 2021 16:10:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B28F64FBC; Wed, 10 Mar 2021 16:10:58 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1730464F9B;
	Wed, 10 Mar 2021 16:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1730464F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1615392658; x=1646928658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O5jeKypV2ExKtHu5QJ2ITrvif4oyKitUExTdelTu/Qo=;
  b=xrQ0Wh6uAkhw+z98UkwBmAookwl7jtPmNxWJcwZCz/5EFitTMfXPO9P6
   lyARoJ3fcPnadxeopucVrKgYxplEZ5rR/COXxSWptdudGhTzsRohPab7L
   1D8UPmLanmpwokrBdoG9YUNVXSx6HEvvrd9J1gc5UhUpXkP5Q8wyPv/Nc
   s5GRbsJ+FYUh1NBAyq2UZdPe/jxjj9nFhQtE9mPnaWauW8E+VP/DGBJEe
   JalbqMWgbkRiu4o5qaAzPdAOqpduer5x1RphUZk/Ta3dCJq+FX/LFXyZQ
   Hx/+8f3k8bCjHAjpCvtjw30OpKTr1D1zsEJCF99PiYG9ggHVRVyVv4jB8
   Q==;
IronPort-SDR: nEaPGjPgYT3WDxBsCTOOdsRUMVINyPtJBcEgKTRUNDp9FEeYRZcDojqs1/h6MdrlEmC0BmQCOz
 gp3dxzKAy+omQxtr+rD/OgcSJ4MbdKHAPQnUzAuGSaP2JxRNi2EJ2djotDRutXic9la4Lf3bEY
 ULgI0r2JqdEjEpkWvHN/auHfDKLmO6KgBnp4cYoAAJTjIFHqcm5F8MOIlSPBPhYaQEyrPBrQ5e
 HTh4Ft5XMYDgQ5SyVjSz65qaCYeXsJDSK0Np+WG5etgvAyD58cB1MiBD+RK+0n+DKqVt97Ho3u
 e2w=
X-IronPort-AV: E=Sophos;i="5.81,237,1610434800"; 
   d="scan'208";a="46983116"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Mar 2021 09:10:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 10 Mar 2021 09:10:56 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 10 Mar 2021 09:10:53 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: fixes for 5.12
Date: Wed, 10 Mar 2021 17:05:47 +0100
Message-ID: <20210310160547.55382-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are some fixes for 5.12. It's not regression vs. previous revision, this
is why I send them early in the cycle.
I based my branch on top of 5.12-rc2 because I noticed that your "master"
branch was pointing to it (and of course the "-dontuse" suffix from Linus).
Tell me if you prefer that I use a more usual "-rc1".

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-5.12

for you to fetch changes up to 2c69c8a1736eace8de491d480e6e577a27c2087c:

  ARM: dts: at91: sam9x60: fix mux-mask to match product's datasheet (2021-03-10 16:38:15 +0100)

----------------------------------------------------------------
AT91 fixes for 5.12:

- only DT changes
-- wrong phy address that blocks Ethernet use on boards with sama5d27 SoM1
-- restrictive PIN possibilities for sam9x60

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91-sama5d27_som1: fix phy address to 7

Federico Pellegrin (1):
      ARM: dts: at91: sam9x60: fix mux-mask for PA7 so it can be set to A, B and C

Nicolas Ferre (1):
      ARM: dts: at91: sam9x60: fix mux-mask to match product's datasheet

 arch/arm/boot/dts/at91-sam9x60ek.dts      | 8 --------
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi | 4 ++--
 arch/arm/boot/dts/sam9x60.dtsi            | 9 +++++++++
 3 files changed, 11 insertions(+), 10 deletions(-)

-- 
Nicolas Ferre
