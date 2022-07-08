Return-Path: <SRS0=QgZb=XN=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DFECCA47B
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 15:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8318C341D2; Fri,  8 Jul 2022 15:14:02 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 516F7C341C0;
	Fri,  8 Jul 2022 15:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 516F7C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657293241; x=1688829241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BzeOzLqO978xxyCov4it/ZgIZwyg61Vim6TdwwrQ678=;
  b=0sLgjXp18kdEDauySt+Pc0HeMMzWRpvvaHMHfwv25zPgT9fHsHLt2cx+
   sG77TdSsw7MsRjmBAN5UKk5XzS8NBf0QsQPcztqsnA8UAAbCFTQhbrlt5
   OYu3gxdhP6GOK3jUIxyWyLebQYwZsAWPi8c0LXqiobKWzoT25A3v49nXT
   3MwTjXqcIKLgU6YvkdOub5s6nILhoXD8ypGStqGi8hoHeFVD+7TiZZEsH
   v7fEAdpOvUoWW4dRRcfraBsiiDCmUq+2uMCUlv2QLrW8jGNIe8sAq6RGt
   72JxFZpD6vT72NxIJDWSmAlEYoHXK5Bdf20+P8/0dus5qGIgs39Kr6371
   A==;
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="167018455"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 08:13:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 08:13:55 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 8 Jul 2022 08:13:53 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] AT91 fixes for v5.19 #2
Date: Fri, 8 Jul 2022 18:16:21 +0300
Message-ID: <20220708151621.860339-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd, Olof, ARM SoC maintainers,

In case it is not too late, please pull these 2 fixes for 5.19.
They are necessary for proper working of:
- I2S1 interface on SAMA5D2
- switch available on kswitch-d10 based boards.

Thank you,
Claudiu Beznea

The following changes since commit 91d60e259c0f58c855f88f3fe5b7909aec563525:

  ARM: at91: pm: Mark at91_pm_secure_init as __init (2022-06-28 12:55:32 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-5.19-2

for you to fetch changes up to 2fdf15b50a46e366740df4cccbe2343269b4ff55:

  ARM: dts: at91: sama5d2: Fix typo in i2s1 node (2022-07-08 17:44:33 +0300)

----------------------------------------------------------------
AT91 fixes for 5.19 #2

It contains 2 DT fixes:
- one for SAMA5D2 to fix the i2s1 assigned-clock-parents property
- one for kswitch-d10 (LAN966 based) enforcing proper settings
  on GPIO pins

----------------------------------------------------------------
Michael Walle (1):
      ARM: dts: kswitch-d10: use open drain mode for coma-mode pins

Ryan Wanner (1):
      ARM: dts: at91: sama5d2: Fix typo in i2s1 node

 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi | 8 ++++----
 arch/arm/boot/dts/sama5d2.dtsi                         | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
