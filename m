Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA211C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:51:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EDFD6101A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 17:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EDFD6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cc2FK4QgR2coYlmydEDwFKi9NSDPIZ3AnHCKP4qHCi4=; b=Bxn2d7BZ532vuGOlIXGG39ed6H
	/O9pCkFSRG0gavn8NISRt/nkS5V5upctvNJdDmQl1h6ttgPWNQuV07awYNZ7uHQdop5Jph8eD79AG
	dVgyBJwumLNpv7U8CRGw8JialcUhUyQZTc3bln21p3hwq/zP5aTY+KCwbBRNNYUgG0q5InFiLmxMj
	DCSW9lqN4iMbARMgl+2gYKesvcV4RWcxyeUKsKmYYM7pcKvVdxlyoW/M7SHOMtQvBkzuAvfSelYec
	8Ainh7AXENu9oTDrfaG1r5ZOsn8hVZiVJQql5OO39m9vyoiZRMUZaSW235u6H/jcGRD0Rw3TI2eR0
	5LhR+RiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS1SE-00Aadv-5a; Thu, 01 Apr 2021 17:50:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS1S9-00Aacb-G4
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 17:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617299397; x=1648835397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t+Damo6lBLTec0MqdYsAZG21XEfwTrUjDwnQIVPgrfg=;
 b=S5Wy0PDPDw2+HBLj90xzeZx/Ihhtz2H14Bym8PISzCaUrj7Ge1lyV0kr
 hhwVkdXCANn9gmQAakQPTgFCT2n5AL3U1/KXqFdJkqSGDWD/Qpi/tAZTG
 lzOTNqzm/AoiwysXlU66WUWZEk9Drc3X2PrSI7KlaSmRhtT8OkyxYFcmJ
 yV+ueEBZNZfKPDeU8/PTFFcMWtMF0mW1BVsW4pI+xj9ouyFsjrpy2Gflg
 7hzg99HBpO2I4IP62NhnuPWcuEaz4feYwAUkq0dx/+aZxg5xV2ExEwMN5
 UhefKExr61izo5ojhbLZBx3eSBYXIXThn73BO4Sg75+AqRKo+LMirse6I A==;
IronPort-SDR: 5Ng5NM1EzbpwR/HTQNvjcYL+q3V6cpSEYUklwZ7HK057B398VMKy7ww3FQCX3PxiL+u3xAMd55
 MXUshv32BekJnKyET4D489sAzSpIGtg6eqmR/LYgGcT6AHFfvCai4HxPcgvH9jkVRiHUF/VIkt
 dapG1mATxs46C4ElHH7FoXFGb2vgTzPrbx4ZDVrZFsWtf9Rl2B7ZyXbTLXgeDXK/GIiVarPOXS
 7aLrbtkGK+ZQOXfye16SXvY8kG+hwYf9n6Pv9gbrVw9Db3edYDVLcvqt7Z6pcSNs0fjKoo+ZT+
 eQ4=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; d="scan'208";a="112171420"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Apr 2021 10:49:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 10:49:54 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 10:49:52 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: soc for 5.13
Date: Thu, 1 Apr 2021 19:45:44 +0200
Message-ID: <20210401174544.32193-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_184958_002095_8CD76F96 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
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
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210401174544.e521jfPJCH2vWmjjSuHEE32MA6QQx7cq1478QI0Lyfk@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

One single patch for now on our SoC branch. Stakeholders agreed to make it
travel with at91 -> arm-soc.

Thanks, best regards,
  Nicolas

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-5.13

for you to fetch changes up to 41dbf4a146a06443d1cbf39e238f02fa1ca9d626:

  ARM: at91: pm: Move prototypes to mutually included header (2021-03-26 18:20:49 +0100)

----------------------------------------------------------------
AT91 soc for 5.13:

- Fixing a W=1 warning

----------------------------------------------------------------
Lee Jones (1):
      ARM: at91: pm: Move prototypes to mutually included header

 arch/arm/mach-at91/pm.c        | 19 ++++++++-----------
 drivers/pinctrl/pinctrl-at91.c |  2 ++
 include/soc/at91/pm.h          | 16 ++++++++++++++++
 3 files changed, 26 insertions(+), 11 deletions(-)
 create mode 100644 include/soc/at91/pm.h

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
