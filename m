Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A5AC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EE764E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 12:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EE764E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L5OBNirKpvzLFoV4QWTZ0KxCicBNnvaTIzX+/ju0v4Q=; b=UVvsEeQ3AgIyzcsPsHC9ktWdsR
	VyjA9li8miLyN5+cUsdcHvSaTPaL+wK50wYYJLWkpy0jZbvLgkEr0m92eguRSoYBsQRQHHL/MFt/y
	qNdnlDLhn21lquEWnb4PUDvNAwM0W0YZb/LMl3/DipIPcz6uDCXgdbLatWLIC6YS4pJWbRVjPTNxL
	KLwMzlo/ICvvAhCUmTTmpAhh6TMYbz2AtkHYyL3DfD42pSB6/cNqesBhrRICaFiC1o5wDk4zGZnCd
	oEi6YFQfAlopPm7bnaULcWnrWX3BkQqS/ah+iwn5+C4peyYVo0UC58qNH+C8Vm15OzxqY7lykOGE/
	ickdxbxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l95F2-00051D-Pd; Mon, 08 Feb 2021 12:02:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l95F0-00050n-Me
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 12:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1612785726; x=1644321726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ktQ5H8JYp5ZgySkZR4VfvzwHO9Mgrs/mBdNMLYeZkxM=;
 b=SKfoYlwV8SzX/4eCZle5xTDTbjwb6E2K/X7YalNfYb60syO432+hdcQu
 DTj6+8nxc4kq6warVzedkDLTyTI4Mnfb1uLEeaKxvs73J3ozeN5dDt3bk
 qqxCYzAlKnamJKGYSGZA6X2q8qkVL8d4U3TKx7EefHpjFrKcIP2ZNHIRK
 wWT9+SHtYWUKvBOdYLUTyei7PpMlC354LfA60jABbKkwmud7i1v41aSoX
 zSmwGpCgWCZn9jjnBXi+nrnS5FxfGjOHCAUdTMqiYn4EeEq+oi0HjOzjx
 k+BjJEI6v1bU2DZcLRnBoPVbMHrhWsKsGuhod9/iFS52gHmzBryBsSF0H Q==;
IronPort-SDR: rb5GGXYKJ5kzLbBo/stIFUeaIMnmsV3zR5j4y77pvHVeAUZvBwQkajr3G6WGASlqK5CiWTM4Qw
 aSx/gxlnBcnwD5emNbzpDgy9iDfxgOTelfv+qU8J/p/QJcXKCm7ncyPSpD7JialLK7EwAHzkvu
 IQ4HNNTlwV9fL/nmNvaliYycyGSTZG03dQ6+G7bD1lfay2YFQV9chkW0Az/RDXtl3Hj0l7fEAY
 RRZ6sLAjBl5Rzhf88TOb1E3qFPklbzFGZJePc02r22Pxhna/FjDbm7ZqVdnpoWAg5nA6qjx0Ku
 C18=
X-IronPort-AV: E=Sophos;i="5.81,161,1610434800"; d="scan'208";a="105816294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Feb 2021 05:02:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 8 Feb 2021 05:02:04 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 8 Feb 2021 05:02:00 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: defconfig for 5.12 #2
Date: Mon, 8 Feb 2021 12:57:53 +0100
Message-ID: <20210208115753.54730-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_070206_869326_D6490C7C 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208115753.DCfstLjQt_yvRsVIbdeWSjzgW0UNW5MAlALkYeq28gk@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the second batch of defconfig changes for 5.12.

Thanks, best regards,
  Nicolas

The following changes since commit 00a1aa475f507454fab82f02c6230c8fb2312a12:

  ARM: configs: multi_{v5,v7}: remove ATMEL_TCLIB (2021-01-02 14:06:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.11-2

for you to fetch changes up to b33f4da7b3efcb7521399d5e18cdd15e60ab34df:

  ARM: configs: sama5_defconfig: add QSPI driver (2021-02-08 09:55:00 +0100)

----------------------------------------------------------------
AT91 defconfig for 5.12, part 2:

- only at91_dt_defconfig and sama5_defconfig modified
- update to match current options, unneeded options removed
- missing drivers added, some are on-SoC peripherals, some are helpers
- modify legacy ATAGS or DT options to match common usage

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: configs: at91: enable drivers for sam9x60

Nicolas Ferre (5):
      ARM: configs: sama5_defconfig: update and remove unneeded options
      ARM: configs: at91: DT/ATAG defconfig modifications
      ARM: configs: at91_dt_defconfig: add useful helper options
      ARM: configs: at91_dt_defconfig: add ov7740 module
      ARM: configs: sama5_defconfig: add QSPI driver

 arch/arm/configs/at91_dt_defconfig | 17 ++++++++++++-----
 arch/arm/configs/sama5_defconfig   | 14 ++------------
 2 files changed, 14 insertions(+), 17 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
