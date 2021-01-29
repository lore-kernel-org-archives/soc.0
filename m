Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E52BC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:02:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270C664E21
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270C664E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wkjkDn59RQrdEx+FglAZF/mcMTCcq/iPp4dt7QtDy64=; b=2flxABygFWzYsLTzdmMSszJj0H
	tOWKrlWLsejostwWwalDn9EubaxSqGtjutCsYeiMIXRKPwtr8Bt6ua6pDwI1V0ZwCuptallsuba7K
	+4MayhBvhT4X+OsBQQyG6GGzTTjkGklkTdhu2xNeNm7V8dMo5Zd+xNmUXUNyDP5qIXQPQfv+I9wKp
	SypYcRSAJf3UcqEj1G6dq3HI8HixEjXACchv1Qs95taTgHysnN4KBY/WcbvtazHuerDYrNT1KcsqP
	dHLCAR+AfLNMY9azUN3DtHswV/MECXvANJ8hk1j0uzRCREee/TSaNOIo1RMMgUyOQa7zq1zFX7WDQ
	PwjALWXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PeG-0002Mp-1P; Fri, 29 Jan 2021 09:01:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PeB-0002LG-0T
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 09:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611910855; x=1643446855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b6vV06zCZmgKZ/7BPwxq3c9K7YNtOdwxJzxTQOWp68U=;
 b=QXJFR6XzKahyNkrot8+R1X9kCdZz6A9oy9MyHtSd8xlpiT76Wfaee8Wb
 TcMJuUTywf0F69NFZBCyuPZErGuc9yo8ONfmais8ovnnCF1VSOKnqBSYn
 DuICNRiZlJ7x93+lOQIp9h+bkBiZV03W963dPh85FYpF8UwVZ3ouk+Y2T
 Yp+pi98SgUyx+0/6wMeYdZHj8tLmv8FUOZ4RTaerHup0+LxcegZdyjcPJ
 eXl7Ssu6by3PWD4aO1Q6ROfAytl1SA1BMarZ4kAsBkL26uLY0fPHZv3af
 2bgIFLNTwiRcllsXo3E2zwyDaBtaj4MVvif2ZEE9zRAeLHog2a8z/xqL0 w==;
IronPort-SDR: Y8Pv7I4JiuAuAUr1Oc07mAGISxUvodaHAuOGNbtUXVctw1jNRmwnG9e18PLIcD9UpsjdzUhhod
 EyyS6o0LCJB+TKLjLZZF0gnDRfvE14KwTW2IDsAYn+L9GXqJcbsrMcLh/UQIZU+Xpxk8zEsp51
 J4YtvSydIfYQwP5Twjd+LHMxxS9e4NF3np/4hxhsIlhtKYOzUr1KORekjvz1huauA+T0KWOheg
 oUg7f6aRu+CsOzMeSRQkoMxHVziulqyNa+cArYMRQs8KIA7U+lOuEITMAd7x1oobUsvY/RDMSK
 fIU=
X-IronPort-AV: E=Sophos;i="5.79,385,1602572400"; d="scan'208";a="101890434"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Jan 2021 02:00:49 -0700
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
Subject: [GIT PULL] ARM: at91: soc for 5.12 #2
Date: Fri, 29 Jan 2021 10:00:30 +0100
Message-ID: <20210129090030.26976-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_040055_266560_622B8B83 
X-CRM114-Status: GOOD (  11.35  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210129090030.EZMyM2nWx5vjh-Ok6soEWB0ZXB6BLE88D08UYvVx4mY@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
