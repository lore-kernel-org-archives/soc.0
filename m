Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24E9C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:52:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D3F239EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68D3F239EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l971WUu47vsojizZETkapbu2fvtB1nOnOgqYCIu3bJ8=; b=BqWNCyktWnj5v91AZoBN5bvgeI
	bX2yzHpRetXVQnMk675eeabZdl+ZhJ8Jy8bkTnIQ57CH6jK5g/Oums5vUmIVOupfTOWTg4hotacze
	llNKq1sJjB4dU8KTkZ32ALl/LVEh2QqQHUNHK3ifEBmfeZvTzXWJtCk2G3otISjcm2CKw9Sq4n3OG
	+vatS7mIuDQHD8jxgrJtsvYEK1oYld/2Qbe6t+ejItbdp/+gVW0HStr3e4yeOIMaaV0o1FZAcedpn
	+vAGwAMtiURTKreV51hsEM1P0esUX0HiBYgJS+BZzrMSLItLPVoFjBj+CEzHBsBQFbAfkS7e7WilT
	nALWW+Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2xm0-0002el-LP; Fri, 22 Jan 2021 14:50:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2xlw-0002d3-UA
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 14:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611327048; x=1642863048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KsXcy5y83xCRPNuARdSZENXQpQEChqeJyPUSi+46dLw=;
 b=p8MmXl4zvqG6fBffwIxlIWEgYab7N9ECOVSp3W5xq/xF6cqMsjLiMMxE
 0iL9+tg6QdPY+yRIXTt+FoO4SoYPvori27VSHslewA8xH3Rdhr+yXKxmT
 s7kcXfrIHcw8jw4SL28nhG6unVo6Rfz+3xqwegamoVW659irBJhDHZzOf
 QDL9zOIWI0urlZHxTwt9NwXlaCRI2N9BEstOA+kh40nYf/p9cwVRso40Z
 C1kTAhiPs6a4LUDh1p5ImgEhTlMBekY2FJqqLnlLOAbMzU16umTePqrHn
 BfYig65muX59zzaFKX8WY0jtxu2bgSqDLihq0YZgbvH7tOrjxy67SCV3h g==;
IronPort-SDR: 0rs1KO37lE8cqXN5iAaWUTWynG9+Z/wB1Lksgv6EfC/A2IXAfxJqbDC2WLW7qHenNWJQz3bFGe
 43PjSCXEfbpudDSk6U9Xm2i/BiPO7wzThvVThzz/ssTs7RyG+Kpv5Z7tN1FAeTue7CKcLrAf05
 PujrSBaQfgQz5vXww5pSVdaOxsEoG0sFg2+9ziiGDYl2mjrcVKoxS34/N4CjZR7S0qMttX7WOb
 0t1SA6xLHHGlqt8he0l3QTwDO8VABweDpX9f8NpzQIy2nXxDzopcn3waEFpa52guam9NidNBxc
 HE8=
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="106927510"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jan 2021 07:50:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 07:50:46 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 22 Jan 2021 07:50:45 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: defconfig for 5.12
Date: Fri, 22 Jan 2021 15:46:38 +0100
Message-ID: <20210122144638.170565-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_095049_138534_7C5318A5 
X-CRM114-Status: UNSURE (   9.74  )
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
Message-ID: <20210122144638.jjRv0mA-slc8Ngi1IEC2M_Vr14j5QwWY2z2cgLIdLfM@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the defconfig changes for 5.12 which contains the removal of old
wrapper code that we called tclib. No such config option to be used anymore in
next kernel.

Thanks, best regards,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.12

for you to fetch changes up to 00a1aa475f507454fab82f02c6230c8fb2312a12:

  ARM: configs: multi_{v5,v7}: remove ATMEL_TCLIB (2021-01-02 14:06:48 +0100)

----------------------------------------------------------------
AT91 defconfig for 5.12:

- remove ATMEL_TCLIB as the driver was deleted

----------------------------------------------------------------
Alexandre Belloni (2):
      ARM: configs: at91: remove ATMEL_TCLIB
      ARM: configs: multi_{v5,v7}: remove ATMEL_TCLIB

 arch/arm/configs/at91_dt_defconfig  | 1 -
 arch/arm/configs/multi_v5_defconfig | 1 -
 arch/arm/configs/multi_v7_defconfig | 1 -
 arch/arm/configs/sama5_defconfig    | 1 -
 4 files changed, 4 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
