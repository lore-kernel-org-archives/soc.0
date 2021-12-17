Return-Path: <SRS0=Mh7t=RC=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36271C433EF
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 199D9C36AE7; Fri, 17 Dec 2021 16:41:47 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 25D8EC36AE1;
	Fri, 17 Dec 2021 16:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 25D8EC36AE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639759306; x=1671295306;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D2h8E/Ug1gRKBcu/bGtG10Pcx4s2TUetykAr0Pgo++w=;
  b=CCryZ1LPQA6d5ZGx7XWWkF/cA2UY3yVTDeuwcH8Mhavs9D0wxyutoIDc
   Zo2RFYZ2gGFN6CYY8qYBjEpC0KS4dDeJtkVz03CC3vEXYdl/L5gQH3Bn0
   xNUtJO4eq/aq06kVfCM1uCAiYfh4ynQVNw88X6vFsjmRgyHB1oiuJEdLy
   eQH1PQ28JU2Q+h0rK0GgIOh37udeEfu2CNKo9nyCrQBF/X6890H4MpKpy
   7x9lNVVj5BV68R6vdenH1iITY0hBNF2oDuhW3sOHyba2Pbrx/vwR82jGw
   c2T7IhiEasG/i84cym659C4QKsBhstlEGyyFekNmIJL4ZAnzWedMcPAX9
   w==;
IronPort-SDR: cIn372YCiFTEjINntpTiI0AT9FNkrHZPoaswS1n8+XBkH7Ck3X9/W39bkHU2gNOsNaAKWpgOIb
 HPqWk7tZeAfohlmI2tTV56pL4uIG8cISgKykBaFT7zFz2ExQn7t5MS5vpLiFSXkMi5ERWTudv8
 YMgt6aveBkG6BI5xAC1cElQXgaG2Ldb7J+UmaOHalCcbHyF1GFgVP5O/3zLYZ1IgDh+kZKFZMf
 n3kbHfdsWPhEK/cKukYIXqk+GCC6tFmOO5bpu14DDrPcNcu8/AnZ7hP/m5lNJTFRBIgal1Ua3q
 JdCo2vwct0gWTx0uW7sD22by
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="155902638"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 09:41:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 09:41:44 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 09:41:42 -0700
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
Subject: [GIT PULL] ARM: at91: soc for 5.17
Date: Fri, 17 Dec 2021 17:41:34 +0100
Message-ID: <20211217164134.28566-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is one soc change for 5.17.

Thanks, best regards,
  Nicolas

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.17

for you to fetch changes up to bb29e4091079dd7ef5bd488bd7625965cdfd2c12:

  ARM: at91: pm: Add of_node_put() before goto (2021-12-08 14:01:16 +0100)

----------------------------------------------------------------
AT91 SoC #1 for 5.17:

- one low priority fix about of_node_put() missing in PM code

----------------------------------------------------------------
Wan Jiabing (1):
      ARM: at91: pm: Add of_node_put() before goto

 arch/arm/mach-at91/pm.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
Nicolas Ferre
