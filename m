Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DF0C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 12:58:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7340161029
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 12:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7340161029
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1PG6Twd9sOFn6jNeRqHfszQ8AOPgrmG+2T2Rl2hrI9o=; b=DijWdHySPhdUwZ
	7aGOHjVCTeIMQv6fPbT1VTBEClkyksqWRe0az+UQp+mP6R1GQgpjSK/eq46yCuXvqpr7y7dwgUJlh
	EQ/+yfKr2Rv/c1TuEGpQlwES0TlHf7T5WdRWWgYizQFOFTjIW1+xpJIn+sjr85Eh7CrOaIywKSnVc
	O9+jgp4tf5CbzvBn1vgsFAiVbZUhlAfrsfwQPniu+NRne6krw4Lx3B6xdPXg6BOlKxkhFwpoE4JkS
	G57xQYioSIdCDOwCinjhxbRCcGV22zFJdQRdol8L3KQ1E2wL2dZw6s+FZ21Ph2jasor6/xIKue0Lz
	4Xmvjs+dTIJN1p67ojEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrgik-005Kbf-Ja; Fri, 11 Jun 2021 12:57:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrgih-005Kax-0U
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 12:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1623416227; x=1654952227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dZmDcLeDM+mKZKjjsmFu5tdV39OQUBI69egq4Sidx8s=;
 b=X0qPJaDqpPqBa0QKAIC827EjTbGSSU32WGD7RUytc57ro8FXNoqzQ/Q0
 JQhGM9LpPTvlapgYgpoL2HhH6WDFFoFDayMCVmdFlMYwuXw/TZXynHKiL
 DJVyT+lJqc3s7G5jSm7Vpeexu3MxZc3U7OV8JPVHSAEb4hU1XPqVWIlT6
 RhAcKdbd/EB/TweJDrp/otZBLSAvZBOS7FOXUhphQxSL3PZLVlJhfTgFf
 7Gp2ZkdPXckbE6McD9QMwlVbMJSTLDxBvQ/r7I6dQZbY0JfRtizHJ4Qpw
 0S7Y+IN6+460yWDjWly/J6ix3RL2AtWqCDmr2YOAnqUoKxzqTTEKSAmtb Q==;
IronPort-SDR: qxYOHCM/hY9V0HbXUG+Zh0qzt9aHe84/UhcY9AlVImyWeLX3VwAH2D3HJV2IZf5xaTGbtJJ1cP
 J672d+us8qFP+E5/mDVkQ5iuGYqT73MJ8NR54nvXU676i1oOm1kJNDmjtVnNhaDbDGA7/V5q9J
 043E3GC++hjEtRBoh7YQGsbAr/FaqwJvoTBrPap5La/dArfaeicZDWMYJPGcR/K2JAUgxMbdK+
 XufpurzChEIrNxlMfUEED6EQmFkL+SPyG5+J+4LX7X+z7IqcM8H2OqMRIMPgvofibe5yyF7Kd8
 +wQ=
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="120963641"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jun 2021 05:57:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 05:57:05 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 11 Jun 2021 05:57:03 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: defconfig for 5.14
Date: Fri, 11 Jun 2021 14:56:59 +0200
Message-ID: <20210611125659.25590-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_055707_142615_FD04DC63 
X-CRM114-Status: UNSURE (   7.07  )
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
Message-ID: <20210611125659.io1bMWkug-V0T4DkAhwJ070VhU4GfX-pUO5SuK3Qeog@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Only one patch for this PR: take as a patch if you prefer.
We have other defconfig patches in preparation but not ready yet and as it's
getting late, I send what I have now.

Thanks, best regards,
  Nicolas

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-5.14

for you to fetch changes up to b249d97825ff461747421a5009794f395e99a032:

  ARM: configs: at91_dt_defconfig: configs for sam9x60 (2021-06-07 12:02:36 +0200)

----------------------------------------------------------------
AT91 defconfig for 5.14:

- Add the use of tickless and HR times to ARM9 defconfig

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: configs: at91_dt_defconfig: configs for sam9x60

 arch/arm/configs/at91_dt_defconfig | 2 ++
 1 file changed, 2 insertions(+)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
