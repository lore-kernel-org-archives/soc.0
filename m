Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C67C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:19:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7196056C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC7196056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bLk9XUGrMZT1Sq9sJHyAdCbpNsvisCdnPxtUEuIzzPc=; b=mUFAw/bmLV5D3v
	HwPyRNJ2fHsDX8bX+J9gWAtDskOBksLkZ06B05qG5ieOYdrNXWgxk3/Pou9IQiaaZupywGJ/jJcK8
	QWr1ZAfpakoM1+uU4EW1HJQgCb74yZxYdIGagiHzJKzVPKP+67cIhI1N9H3+4QKDYcW7QgHNGHcAt
	Lv+9i39mwjEsUJZh4yfGc4tM9EwOxmTvB7FIs4POS78MiJeA3nS0WSiALRnNwr48yiSHjjaGQcNNP
	2lafFedKGrRD5Vew2SjZV3yOpvEiHRLYUqMOsuNXTmPqjrkvIhsuj2fGVnOJW0TcnOoFfdAbhcu+C
	4E3bug8XC5WsTgs770WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBC6H-0057Lb-98; Wed, 04 Aug 2021 08:18:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBC6D-0057Kk-Ut
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 08:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628065082; x=1659601082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cISOfZdpIzxP9sgFljLgRKSvTcjwqZfCPbc2qQw1C1Y=;
 b=LnwMWVBiHhCuuIZKNKgHnhPc0cNIbk9FrOuvZrZh9U5uXf0pRUl9Hy48
 65IA6P9Q/tFhBl6FUEiYcBoc312kTyvscoORrBOXQgpBrN5w4OIOm32oa
 vAIAWHOrEDYM7YNb8GoHoDa9WzCGlyPFvrFEswsMCAAWbpANSlxraEi0m
 X3F9Y4StmgsraXsPYFwl3znxMmA2v2halfmmj8dY7DFyqE9y9j3C1SQnN
 e/KXaIBf+ubNLj22RyW4GYLJH2/nTyJyrcqz7H0JavD8Y7OijGJ+5l1jN
 OYLVmTe3Zx/QxzTI30jKTZlAd7+gsUIGMOyNlkqRgWcl451nmoPcCfqua w==;
IronPort-SDR: MevOYCoExy2zLGIHnJL995+7Fzf6mDlBmOESYfE0lYAeef6gNOexkMxbX+7ayumH5zNvtb3xvu
 OM0EVeDqLOTq5WcLdSiSkSgNNNI9Be3Dxnb7ICXcVT0rhqDbnZW0dVlY7Ga/1k+3uo+bDX5xF9
 Txk+j1GMSMVnGqptdDl5FEP8OI4oES9BJMMmHsd4fCKlL2usL2E+XENToOGexZtjCGH/Ytko5v
 dv1qupeHcHOB+2Z0ZRkprVNchkPhcF0XD6ZMkj2NekTuRcIW/cb8cfIohFMGpVMj8XWin+AbG9
 61+VwA4ECPMBSIAE91SBBjIw
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="127044258"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Aug 2021 01:17:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 01:17:57 -0700
Received: from ness.home (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 4 Aug 2021 01:17:55 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
Subject: [GIT PULL] ARM: at91: soc for 5.15
Date: Wed, 4 Aug 2021 10:17:21 +0200
Message-ID: <20210804081721.11093-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_011802_152257_ABC6A978 
X-CRM114-Status: GOOD (  14.78  )
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
 Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804081721.7Bq3F2ZCTefHeRFbmQaTjejW4izXTg9R-AThwqBrC6M@z>

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the soc changes for 5.15 which contains the introduction of our new
SoC family: the SAMA7G5.
Note that one header file is shared with the clock sub-system. We synchronized
with Stephen to make it appear in this Pull-Request.

Thanks, best regards,
  Nicolas

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-soc-5.15

for you to fetch changes up to ad9bc2e35cf575644064284943aefdde426644cc:

  ARM: at91: pm: add sama7g5 shdwc (2021-07-19 14:32:13 +0200)

----------------------------------------------------------------
AT91 soc for 5.13:

- Add new SoC based on a Cortex-A7 core: the SAMA7G5 family
  - mach-at91 entry, Kconfig and header files
  - Power Management Controller (PMC) code and associated power
    management changes. Support for suspend/resume, Ultra Low Power modes
    and Backup with Memory in Self-Refresh mode.
  - Power management association with DDR controller and shutdown
    controller for addressing this variety of modes.

----------------------------------------------------------------
Claudiu Beznea (23):
      clk: at91: add register definition for sama7g5's master clock
      ARM: at91: pm: move pm_bu to soc_pm data structure
      ARM: at91: pm: move the setup of soc_pm.bu->suspended
      ARM: at91: pm: document at91_soc_pm structure
      ARM: at91: pm: check for different controllers in at91_pm_modes_init()
      ARM: at91: pm: do not initialize pdev
      ARM: at91: pm: use r7 instead of tmp1
      ARM: at91: pm: avoid push and pop on stack while memory is in self-refersh
      ARM: at91: pm: s/CONFIG_SOC_SAM9X60/CONFIG_HAVE_AT91_SAM9X60_PLL/g
      ARM: at91: pm: add support for waiting MCK1..4
      ARM: at91: sfrbu: add sfrbu registers definitions for sama7g5
      ARM: at91: ddr: add registers definitions for sama7g5's ddr
      ARM: at91: pm: add self-refresh support for sama7g5
      ARM: at91: pm: add support for MCK1..4 save/restore for ulp modes
      ARM: at91: pm: add support for 2.5V LDO regulator control
      ARM: at91: pm: wait for ddr power mode off
      ARM: at91: pm: add sama7g5 ddr controller
      ARM: at91: pm: add sama7g5 ddr phy controller
      ARM: at91: pm: save ddr phy calibration data to securam
      ARM: at91: pm: add backup mode support for SAMA7G5
      ARM: at91: pm: add sama7g5's pmc
      ARM: at91: pm: add pm support for SAMA7G5
      ARM: at91: pm: add sama7g5 shdwc

Eugen Hristev (3):
      ARM: at91: add new SoC sama7g5
      ARM: at91: debug: add sama7g5 low level debug uart
      ARM: at91: sama7: introduce sama7 SoC family

 arch/arm/Kconfig.debug               |  10 +
 arch/arm/mach-at91/Kconfig           |  18 +
 arch/arm/mach-at91/Makefile          |   1 +
 arch/arm/mach-at91/generic.h         |   2 +
 arch/arm/mach-at91/pm.c              | 343 +++++++++++----
 arch/arm/mach-at91/pm.h              |   3 +
 arch/arm/mach-at91/pm_data-offsets.c |   2 +
 arch/arm/mach-at91/pm_suspend.S      | 827 ++++++++++++++++++++++++++---------
 arch/arm/mach-at91/sama7.c           |  33 ++
 include/linux/clk/at91_pmc.h         |  26 ++
 include/soc/at91/sama7-ddr.h         |  80 ++++
 include/soc/at91/sama7-sfrbu.h       |  34 ++
 12 files changed, 1090 insertions(+), 289 deletions(-)
 create mode 100644 arch/arm/mach-at91/sama7.c
 create mode 100644 include/soc/at91/sama7-ddr.h
 create mode 100644 include/soc/at91/sama7-sfrbu.h

-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
