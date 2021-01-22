Return-Path: <SRS0=ad0e=GZ=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB8DC433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 14:40:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6BF7B239EF; Fri, 22 Jan 2021 14:40:05 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E2D1239D1;
	Fri, 22 Jan 2021 14:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E2D1239D1
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=Nicolas.Ferre@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1611326404; x=1642862404;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UzBjEzUyX+OhZLxv1R0FMq/3yK2+AUe0cH8DHmp+984=;
  b=l6aVrgtW1c/Kz83uIo1oexTo40XnoUjpJYIxU9T6yE2ePWPN/EYzHppE
   L1KRTHLxKC5kVD5nqqNJKSPnjJExMvI7HN3tGqnn6kZ9HzTJ3y+YUM89W
   +Q4a1Hf69NKNpfhQp2BWFKF45Sp/CfRydHXGaRrPaZFgRBN8hmgvnq4f4
   uT1qE4PI3w0V5b2O9+F0N1s1krv5jnw00+edNB0P43m6sjIl9DoDYuy3a
   XcS0Fplz5QeJFZ88kLl+/XfQH2q2hE9KFFaiQCDlSWhoKzj+2B72m3lLj
   CJo55hNdEXMYJaENIAqrp9XPoVz6Q8bTJr/1gbQtA+9V+UzO7g7K3f/XY
   w==;
IronPort-SDR: y70wBAXEcE+ubfOPxa7y9LJJ9qfp5O/FvKnvdg/oCm/nu5ZWSZU8BwcLk2/xn0Ify4b0uRDvq7
 d6xGrCKK/JPed3qQ52nJ6SPIyYof83qu+P/2orjhF4OCJX+5YsZilKuC4HKZ4aI0shGpoqhgWv
 KnNZ4yL8a8eOMxpRx2CFBQTrY2At+FDNx41EtDV7R2zA70sfl6R2zDcuiX/1Vo4rko9lKyQxDB
 2a3BiEUaBO4t1fA36JrYhbUAJ8c0xzL6DTVu/kGXmhMc2HPKSrfo7E0j//ruGZzG/33fWnIkwa
 XZE=
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="101051917"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jan 2021 07:40:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 07:40:02 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 22 Jan 2021 07:40:00 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: soc for 5.12
Date: Fri, 22 Jan 2021 15:35:36 +0100
Message-ID: <20210122143536.168833-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

I'm taking back the lead on sending the pull-requests for AT91 and hope that I
didn't loose the knowledge in the meantime. Tell me if there's something I'm
missing. Thanks a lot to Alexandre who kept our flow steady and very
predictable during all those years!

Here are the first SoC changes for 5.12 which contain a single patch for multi
platform kernels.

I plan to send another pull-request for the SoC changes related to new sama7g5
that Claudiu sent to the mainling-list recently. I'll let it mature in
linux-next by the beginning of next week and will send another pull-request by
mid-next-week.
Tell me if you see a problem with this approach.

Thanks, best regards,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.12

for you to fetch changes up to 960ddf70cc11024e6e9dac206316d0160e00a77d:

  drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs (2020-12-28 17:58:20 +0100)

----------------------------------------------------------------
AT91 SoC for 5.12

 - Only call atmel/soc.c driver on AT91 platforms

----------------------------------------------------------------
Sudeep Holla (1):
      drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs

 drivers/soc/atmel/soc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
Nicolas Ferre
