Return-Path: <SRS0=3TtT=X2=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F44C43334
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 08:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEA31C341C0; Thu, 21 Jul 2022 08:56:30 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08202C3411E;
	Thu, 21 Jul 2022 08:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08202C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658393788; x=1689929788;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z+wj7PyJ7esNFZaw/liY9qjVEjddIUftwWXVYn9whvI=;
  b=aX/Agg7reQLBzZRGtHXlISacOnyEC/o7+3rpa2teQS+tApISlNoLX7iL
   reuqOB/H1pR4qf6NF5WUNxNNjBJgl6FVDals108b3E7WEzojrcTfwuk06
   6WOmQtmYezQnXBrM/xEl9TE5zEorBVryzu3Cpu1bKPek+UBjUWwdOZy9X
   vF2tNea6c8Pn7eZ88oda8K2jLsYY2pxaNYgEdDVhI0W75szoF9hsx0FfH
   8hsJmBRWltvnYvkbABjoxNPxqB44QkcmhYzUtd4TGriT+z5T+2QgVkuLG
   zQuysevNQrC0ny93I8tYIaa+lQbfsZBTSs4SSi22DnES3nhxUZnUH3wM2
   g==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="173229374"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jul 2022 01:56:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Jul 2022 01:56:27 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 21 Jul 2022 01:56:25 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <nicolas.ferre@microchip.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 SoC updates for v5.20
Date: Thu, 21 Jul 2022 11:58:52 +0300
Message-ID: <20220721085852.1740924-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.20

for you to fetch changes up to 3b5a7ca7d252b96e9623b262414713828b2bd68f:

  ARM: at91: setup outer cache .write_sec() callback if needed (2022-07-20 11:05:48 +0300)

----------------------------------------------------------------
AT91 SoC for 5.20

It contains updates for integration with OP-TEE by having a
dummy outer_cache.write_sec function to avoid triggering
exception when Linux tries to update secure registers.

----------------------------------------------------------------
Clément Léger (2):
      ARM: at91: add sam_linux_is_optee_available() function
      ARM: at91: setup outer cache .write_sec() callback if needed

 arch/arm/mach-at91/sam_secure.c |  6 ++++++
 arch/arm/mach-at91/sam_secure.h |  1 +
 arch/arm/mach-at91/sama5.c      | 16 +++++++++++++++-
 3 files changed, 22 insertions(+), 1 deletion(-)
