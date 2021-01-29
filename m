Return-Path: <SRS0=NtjV=HA=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B4FC433DB
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 09:00:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7253C64E22; Fri, 29 Jan 2021 09:00:52 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C3864E20;
	Fri, 29 Jan 2021 09:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C3864E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611910852; x=1643446852;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b6vV06zCZmgKZ/7BPwxq3c9K7YNtOdwxJzxTQOWp68U=;
  b=gbL3/Hoq+VKLhvrEJQGW2O7WBkB/3yfT6yEtsUHl1DqRgvDw0orEbOll
   z5vYKRtw8a389QhgM8dCSZl2W0NxCbIJygihOTxRfFgRZ995WB0kWBr9d
   po535MWcTB8gip5/ZsaYGi2gk69NjLd0l3xCqfC1No4KYbfJt+fCa7plL
   ZKQUnWOERWENQ9kGvNHF1rP+jMKl71MWNR8aL0DA/ywks1PfFIhPDQgMx
   rn2hjeaTkR/Ub8MdPdDHzrxZ6qqHcL5KQh+ij4953q4NZKPPQZasxkXBU
   1YVoRW9fZA2Q6vEWwVmkzhszAVEmVLEG7Sb+B9jjl2VauKrB3tiO5Fodl
   A==;
IronPort-SDR: Y8Pv7I4JiuAuAUr1Oc07mAGISxUvodaHAuOGNbtUXVctw1jNRmwnG9e18PLIcD9UpsjdzUhhod
 EyyS6o0LCJB+TKLjLZZF0gnDRfvE14KwTW2IDsAYn+L9GXqJcbsrMcLh/UQIZU+Xpxk8zEsp51
 J4YtvSydIfYQwP5Twjd+LHMxxS9e4NF3np/4hxhsIlhtKYOzUr1KORekjvz1huauA+T0KWOheg
 oUg7f6aRu+CsOzMeSRQkoMxHVziulqyNa+cArYMRQs8KIA7U+lOuEITMAd7x1oobUsvY/RDMSK
 fIU=
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; 
   d="scan'208";a="101890434"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jan 2021 02:00:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 29 Jan 2021 02:00:49 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 29 Jan 2021 02:00:47 -0700
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
Subject: [GIT PULL] ARM: at91: soc for 5.12 #2
Date: Fri, 29 Jan 2021 10:00:30 +0100
Message-ID: <20210129090030.26976-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the second batch of soc changes for 5.12. Actually first batch was
consumed as "fixes" following our discussion here:
https://lore.kernel.org/linux-arm-kernel/CAK8P3a1v=_4E40cZjZ-ff7vs84XE9XaxwdoGW7Rf+LYiA+TCTw@mail.gmail.com/
Note that v5.11-rc1 is the root of this Pull-Request so the 2 first patches are
the ones already taken as fixes.

The fixes are now in Linus' tree and this branch is merged in linux-next for an
handful of days.
However, tell me if you'd prefer that I merge the arm-soc "arm/fixes" branch before
adding the at91 soc patches on top.

Thanks, best regards,
  Nicolas

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.12-2

for you to fetch changes up to cd9168b4377932a6494d464db1ddd3f63e41fce3:

  drivers: soc: atmel: add spdx license identifier (2021-01-26 11:25:08 +0100)

----------------------------------------------------------------
AT91 SoC for 5.12 #2

- addition of SAMA7G5 identification to soc.c driver
- enhancements to this soc.c driver

----------------------------------------------------------------
Claudiu Beznea (7):
      drivers: soc: atmel: add null entry at the end of at91_soc_allowed_list[]
      drivers: soc: atmel: use GENMASK
      drivers: soc: atmel: fix "__initconst should be placed after socs[]" warning
      drivers: soc: atmel: add per soc id and version match masks
      dt-bindings: atmel-sysreg: add "microchip, sama7g5-chipid"
      drivers: soc: atmel: add support for sama7g5
      drivers: soc: atmel: add spdx license identifier

Sudeep Holla (1):
      drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs

 .../devicetree/bindings/arm/atmel-sysregs.txt      |   2 +-
 drivers/soc/atmel/soc.c                            | 240 ++++++++++++++-------
 drivers/soc/atmel/soc.h                            |  19 +-
 3 files changed, 182 insertions(+), 79 deletions(-)

-- 
Nicolas Ferre
