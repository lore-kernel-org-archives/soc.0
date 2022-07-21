Return-Path: <SRS0=3TtT=X2=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76D2C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 07:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6E08C341CB; Thu, 21 Jul 2022 07:54:45 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 42685C3411E;
	Thu, 21 Jul 2022 07:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 42685C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658390084; x=1689926084;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UOHHQZrAvuoH0wwF3Sv9euWGBdLrmtfd5KyYatOB2q0=;
  b=1ZeN92LurEqtSSw8p8rcPO6DoUJDKMhgXvQJFcv9uOWep4npT1APgyUc
   P8P28JjBak4b3Fea0v9U199iTuCd8L5QxZbJSHJ7CjabKn7d4KfmOvLVe
   dxT1FERtZLXqKK/XIkBbv61fJMf0U9tRd1TQBDZbcCpZjvuHvqzeLig6T
   MUH34LagaSCm+7OojotG8CtPQQIM+fI2c7dyaaCbnHjs+Fod4n2sDAPqv
   K2eC9jMc/n/cbDjev0oRCWucD76tvup5/sV053EvRNScnqnlnjnwOfKXB
   oqtI5hjVxSy8euzFkKX3q9catBYlzdm07HFgD4/dXhluRgN0cr7739TzP
   A==;
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="105475920"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 00:54:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 00:54:40 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 00:54:38 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] AT91 fixes for 5.19 #3
Date: Thu, 21 Jul 2022 10:57:05 +0300
Message-ID: <20220721075705.1739915-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 2fdf15b50a46e366740df4cccbe2343269b4ff55:

  ARM: dts: at91: sama5d2: Fix typo in i2s1 node (2022-07-08 17:44:33 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-5.19-3

for you to fetch changes up to ef0324b6415db6742bd632dc0dfbb8fbc111473b:

  ARM: dts: lan966x: fix sys_clk frequency (2022-07-18 09:31:22 +0300)

----------------------------------------------------------------
AT91 fixes for 5.19 #3

It contains one fix for LAN966 based SoCs fixing the frequency of
sys_clk. sys_clk is feeding different IPs so having proper frequency
for it in DT is necessary for proper working of different drivers.

----------------------------------------------------------------
Michael Walle (1):
      ARM: dts: lan966x: fix sys_clk frequency

 arch/arm/boot/dts/lan966x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
