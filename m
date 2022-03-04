Return-Path: <SRS0=arFV=TP=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AB9C433EF
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 14:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50AC1C340F3; Fri,  4 Mar 2022 14:47:54 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65666C340F0;
	Fri,  4 Mar 2022 14:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65666C340F0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646405273; x=1677941273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E3j7SQpok6Ea6NdstnR4CWXDU6IjMCFuF1+JSKHNG38=;
  b=BzxiKsyWgEEw7wdQga4AWuObtfxrSSJDZ9vwj9uHbOtKyharVFsF676w
   USU1fYWRh6QWTdxcnrsY72AxXtT9jhvUbcTUAEDOvpNXtu6c9Wysrphq8
   WjHkJ6LL2DcGy/IM+3SgY/25EcC8cAw6rY1u11C0dc9unWt4ueFv4gs/8
   xb41NKVowh8JWwq0EXj/k6oJ+l5iU0R/bosBE3aKZ4+gJzE3LCsqlkQTv
   j6O1qsRsoxnFoi+MEQnmj530kAysxlOjZipkPMmgFqKnY2FDYfHhdTnuC
   EdmE/y9lcs4kmqV/S9ZtwxTWQ4Tnby98aeSllsPUTz2MnT7yKA6tbbDRi
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; 
   d="scan'208";a="150870895"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 07:47:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 07:47:51 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 4 Mar 2022 07:47:49 -0700
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
Subject: [GIT PULL] ARM: at91: defconfig for 5.18 #2
Date: Fri, 4 Mar 2022 15:47:46 +0100
Message-ID: <20220304144746.23779-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

A little more defconfig changes for 5.18. Please pull.

Thanks, best regards,
  Nicolas

The following changes since commit 2884f2dda70ac8659b2e15b8ba8b85fe7184b9f4:

  ARM: configs: at91: sama7: add config for cpufreq (2022-02-25 12:20:43 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.18-2

for you to fetch changes up to 5f5399843c0ec3bd562dfd533f32e4074ca90314:

  ARM: configs: at91: sama7: Unselect CONFIG_DMATEST (2022-03-04 12:53:15 +0100)

----------------------------------------------------------------
AT91: defconfig #2 for 5.18:

- Add EIC, remove DMATEST to sama7_defconfig

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: configs: at91: add eic

Tudor Ambarus (1):
      ARM: configs: at91: sama7: Unselect CONFIG_DMATEST

 arch/arm/configs/sama7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Nicolas Ferre
