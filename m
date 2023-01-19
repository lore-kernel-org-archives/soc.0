Return-Path: <SRS0=uQx5=5Q=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607A0C00A5A
	for <soc@archiver.kernel.org>; Thu, 19 Jan 2023 11:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E1BAC433F2; Thu, 19 Jan 2023 11:23:15 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D447AC433D2;
	Thu, 19 Jan 2023 11:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D447AC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674127393; x=1705663393;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pCZqOWFWxN9pR4lG64mFw2AxGvarWtbhjB2aDMaMuuU=;
  b=blW6oR3ZJAyMJbnX5lPffMsBIsnfK9G22LrymDsTn+hbIQ1Vk8sFJ/0m
   uaArVxjc4hHlk9fp36yQu8rMmn02PTX1zbUAKQuKUUKF1Ra0zO1L8GpID
   2pmZC/2HlZXZcrRDOG+CwpHZ2KMSu+NXEUQnvpDAlrTZppY4RmIyOkoAT
   OY8GuO07F+WM0/nYcTrPCMd8Vk4bCEdG4HcgNwh9M72EIK+DLIPqgn6bs
   D5rOxgVkDFOkWFmFLiTgFx9Mlmm3sqaO/eg+0BLIpGo2cPntwsOCtv94k
   8L/zKn966Q+apDj38fIJscNAsirdB3mZUI0trL8wjzwcqJq3T/F5f7cYd
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669100400"; 
   d="scan'208";a="192970992"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:23:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:23:10 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:23:05 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 fixes for 6.2
Date: Thu, 19 Jan 2023 13:21:01 +0200
Message-ID: <20230119112101.42045-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.2

for you to fetch changes up to 9bfa2544dbd1133f0b0af4e967de3bb9c1e3a497:

  ARM: dts: at91: sam9x60: fix the ddr clock for sam9x60 (2023-01-12 13:45:49 +0200)

----------------------------------------------------------------
AT91 fixes for 6.2:

It contains:
- fix the clock provided via DT for DDR controller on SAM9X60

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91: sam9x60: fix the ddr clock for sam9x60

 arch/arm/boot/dts/sam9x60.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
