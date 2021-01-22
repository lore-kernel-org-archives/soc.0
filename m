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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3E0C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 507C923AAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 14:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 507C923AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpci/Zmu1/6XAlr9J4G91su5/gFZhPyeb7bofp4Bmk4=; b=Kvjo/zpwv4ou+AtTA+PYN3sASe
	DM+RIVTe5xb2sJhxUV1yWER0M0EuA5tR0p5Sp9XqAn5yEYTsRRLAYOaPf2h16WyPAX2dM9MaZaEWN
	tZqWmXgBcq2sTezfDAYA0+cQO+2AnpCBTQHcdmlzjRU48u/4BDk3fWHDaSdKgkwB3ankg9poOwgc/
	Iu/VC8cHaPv8UiA0jYU6YFET9lPv9qOflW47rvzi1+6HBXoqsBFnySlq/gwFRPp44K2ImrB02OvaG
	dBojYRfhmwsVC62a9oaIedCR5zvDco5kgGvkKOe+4EdQxnlxSZGJFFLwOUVarGrRKkJJy42o0Iuyj
	bVcPxi4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2xrO-0003OZ-F9; Fri, 22 Jan 2021 14:56:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2xrL-0003O1-Vz
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 14:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611327383; x=1642863383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMFDc+94Wsg5RvpzGV5Qe8VhS0x4Iib2+kCDP5/tomQ=;
 b=r92hNszNx/gYHDtI8VNLecfinzczz05RVuAripxWKoyKzi5qY8t7RCFW
 htyR7ypvkB3BhkQzu1acdN9rNesjyb1eulN3xp20IqppxnxHiV+u6klqO
 UJEEATJR04NwMSQqi3f87Db4KKoXnIVlZZczgwccNrfeeBQuW3xyoyOfa
 jmN4bq1MmLsTnIKERbwZlTOwmxgh0p7nXf+vqS8CfIk/EyZgYiZLcSNQ5
 GabLDtoIvYmcbs570G5iyzMrAEkKOVcTFXSdOB9l26s0YgaL0vBSJZMON
 pBwVuxXqzoiSmn96/h/xUCPOQrupblYzGSFszVZES+D26HHCGNY7k/Gkc w==;
IronPort-SDR: jKOHfg3FQoUSInEdR+rKL/iifPhrHe8O1cWKQxpUPz/6Ota5Nk0NrMvK95mGuTf2pMomW/Svos
 onQ2EHCZJF3jerBybBusEsj14RkqB4E5vBk/7/VJF0xGqXB+4tvxXkmoQpVm6jmFE5Gpa/TuyE
 Ff55uNH/Jt6ojstN8GzpyYFbrUx+Ttj3G992nWpo6DUgfwaGv8Pk0GXfvnu4hoinU8X8Rg8IUS
 V/UMRqiuMm/sGCDwFwCpJgghlmJeN/Pf70dubqNNWy5hHqhqN88kuMIqOHP2qMUgkKNr/zuKdd
 M3M=
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="106927803"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jan 2021 07:56:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 22 Jan 2021 07:56:22 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 22 Jan 2021 07:56:20 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: dt for 5.12
Date: Fri, 22 Jan 2021 15:50:56 +0100
Message-ID: <20210122145056.171283-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_095624_166755_FF01EE0F 
X-CRM114-Status: UNSURE (   9.80  )
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
Message-ID: <20210122145056.IPDwwiNNSHq3SuAGodgusszId56QCpW3ME2Y6-Aa9BA@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the first batch of dt changes for 5.12. As for the SoC PR, I plan to do
another one by mid-next-week. Tell me if it's fine with you.

Thanks, best regards,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.12

for you to fetch changes up to 53efdfbb3b5f91c3db151243e090f755ee48219d:

  ARM: dts: at91: sama5d2: remove atmel,wakeup-type references (2021-01-22 13:31:51 +0100)

----------------------------------------------------------------
AT91 DT for 5.12:

- removing a property never documented nor used
- adding i2c recovery GPI for one more board

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91: sama5d2: remove atmel,wakeup-type references

Nicolas Ferre (1):
      ARM: dts: at91-sama5d27_wlsom1: add i2c recovery

 arch/arm/boot/dts/at91-kizbox3_common.dtsi    |  1 -
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts   |  1 -
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi   | 22 ++++++++++++++++++++--
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts |  1 -
 arch/arm/boot/dts/at91-sama5d2_icp.dts        |  1 -
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     |  1 -
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   |  1 -
 7 files changed, 20 insertions(+), 8 deletions(-)

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
