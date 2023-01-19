Return-Path: <SRS0=uQx5=5Q=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC95C004D4
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 11:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96B3CC433F0; Thu, 19 Jan 2023 11:34:16 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 263F5C433D2;
	Thu, 19 Jan 2023 11:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 263F5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674128054; x=1705664054;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vV5ICh/gycQ6xM4cT0B79UEBPQT5kYpqorFQJfwGPS8=;
  b=F755F65S0raerDm87xH93+fNQ/Hsiy33EG9hSSLkiO5KaE3RpQnCxmUp
   4LfPb0SCjN1u7Ut0G0PnUCHS643TvmCOGoyHNryMgPl/2o0y55npsWWW5
   ppxu5N87/NmFWX2XBBPPqgQOIvKx0H+l4y0GyayjpyWj5w0qqoHItNOeg
   AoEgFepqoTiLiyCRgmMWNES36IF3FD/XpsP7/9LksiPguS8zHW/FNAiHU
   8CD65rOBk/SjEoj7BmOQzvC9iKQM5kEqFh0+Vclbn4sQA0f4YAk+Cln0M
   PWl/Ttb2nTlOcpmgOReFtfW80+PL2XiRFF2Oc7Ezooua0t1hrlS2XUlsv
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,229,1669100400"; 
   d="scan'208";a="133098221"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:34:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:34:09 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:34:05 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 SoC updates for 6.3
Date: Thu, 19 Jan 2023 13:32:02 +0200
Message-ID: <20230119113202.43543-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.3

for you to fetch changes up to d4ac37916e42dc1a46e54bb7d49d5e39d7fa60d5:

  ARM: at91: add support in soc driver for new SAMA7G54 SiPs (2023-01-09 13:58:02 +0200)

----------------------------------------------------------------
AT91 SoC updates for 6.3:

It contains:
- the addition of SAMA7G54D1G, SAMA7G54D2G, SAMA7G54D4G SiP identifiers

----------------------------------------------------------------
Mihai Sain (1):
      ARM: at91: add support in soc driver for new SAMA7G54 SiPs

 drivers/soc/atmel/soc.c | 9 +++++++++
 drivers/soc/atmel/soc.h | 3 +++
 2 files changed, 12 insertions(+)
