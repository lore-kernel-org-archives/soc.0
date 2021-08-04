Return-Path: <SRS0=0Qs2=M3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C095DC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:22:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A4760238
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Aug 2021 08:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79A4760238
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7FxgUNaCTSJtdjzZlJt35o43XaVQFHplsdEpd9hTnc=; b=qISOV9G66KnphHT92x0JMu603Z
	Yun4V4ij2GlalR9e9UVDo8BpUY0VLS1FzqfDknIkB0TFUeLn0KID44DLDLoIQGOsVjzzLLZ5I2KP+
	RXxgTSXjG9VMRKOc6cVobX2xeC8UZ4nvC1s99mbqtJUqcka8gROp8vyLrAvOVOTuN1t45VAqGnVv8
	/xROb2CuTZKIucmM6E5fwcj4CgjEvidCLSjJf7nwApj428n5oUPJOWyTfT35byrK5CAxRQqVeScxp
	AK2I1Lfcg9UN1EB2HE2OC49zwVMi3kxa9wHbfB2N4fQ11qdAKc6ewDodVeyFUUeKuhdHfKmUFHPcv
	j/lG1IBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBC8h-0057gL-QW; Wed, 04 Aug 2021 08:20:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBC8e-0057fr-6s
 for linux-arm-kernel@lists.infradead.org; Wed, 04 Aug 2021 08:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628065232; x=1659601232;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Z6uCYiJDMPmIaY0H5P/HrvjIUzv/p6tap6NAIzcPXoQ=;
 b=DN19wnOC+JdLJuHbzRF9NIAp+foOCu7sBTrDJoryGrG/qu3GBWL6MORT
 GZIUm1Ba0LjQTDb412NM0XNgS4rblqojWZvU2hyKPQ5hSXOnE/zRfPqGm
 1zJ/rnHInejBivN67w9ZnU1MB/Oj+o8zk4K32q/TW0/SupLMatf8GSAED
 Glw539dMi2oaB8+UlfG27XTFaqB7G37DXyPdfIVdyVY9l0Kxe7AYX/nav
 2lrD9GcuWdCIKU+0oZBsFhf7HdCD3lhDUoFHTtvmIi55PA7vCDO2WGfo2
 /kqGTb3tmkNe0wcFk7LbEOWYill+3M6wt7SmBxhHI57Cb3esvEQHh5hdu Q==;
IronPort-SDR: ajr5qO8VLkx6Ag0+Bqu3hVg8ZYWrygk+vCKrE0QqemMJvKQHsR2g39dkchOvfom7zZ18zCP3Dv
 5rFsX6Hwj0s0tQWQgn0+nxWlUZT3eCjbB1+Q1j9JPDf4hbA2/5TO5uoBIIuYb40+xy+xxH5PAm
 pcOj6QiiQuxX99YiJFncLBW7mf9yy7m82THBQLLw415y5tj+pBWe1tCpf2uipXKF/plW6pNgwQ
 CKWPfNMYFxiblWMlBC2EnzQaVq80d07WzEtnbARJqq1mlUBJSNO5sUV3DliPuM8ec7YrKGiq+J
 7IBumt5mZXlQy9msKCw4+Bo6
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="138752739"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Aug 2021 01:20:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 01:20:29 -0700
Received: from [10.12.73.135] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 4 Aug 2021 01:20:27 -0700
Subject: Re: [GIT PULL] ARM: at91: soc for 5.15
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, <soc@kernel.org>
CC: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20210804081721.11093-1-nicolas.ferre@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <25bf6f36-e6b5-e7ed-840d-3ff635c15d58@microchip.com>
Date: Wed, 4 Aug 2021 10:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804081721.11093-1-nicolas.ferre@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_012032_337774_16E5B2AD 
X-CRM114-Status: GOOD (  25.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210804082026.OzcvboNKxGIgHCN6UJQWvslwNmOZC1RdZmYzYuQhcII@z>

On 04/08/2021 at 10:17, nicolas.ferre@microchip.com wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the soc changes for 5.15 which contains the introduction of our new
> SoC family: the SAMA7G5.
> Note that one header file is shared with the clock sub-system. We synchronized
> with Stephen to make it appear in this Pull-Request.
> 
> Thanks, best regards,
>    Nicolas
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>    Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-soc-5.15
> 
> for you to fetch changes up to ad9bc2e35cf575644064284943aefdde426644cc:
> 
>    ARM: at91: pm: add sama7g5 shdwc (2021-07-19 14:32:13 +0200)
> 
> ----------------------------------------------------------------
> AT91 soc for 5.13:
Error with tag, please disregard this message. Sorry for the noise!

Regards,
   Nicolas

> 
> - Add new SoC based on a Cortex-A7 core: the SAMA7G5 family
>    - mach-at91 entry, Kconfig and header files
>    - Power Management Controller (PMC) code and associated power
>      management changes. Support for suspend/resume, Ultra Low Power modes
>      and Backup with Memory in Self-Refresh mode.
>    - Power management association with DDR controller and shutdown
>      controller for addressing this variety of modes.
> 
> ----------------------------------------------------------------
> Claudiu Beznea (23):
>        clk: at91: add register definition for sama7g5's master clock
>        ARM: at91: pm: move pm_bu to soc_pm data structure
>        ARM: at91: pm: move the setup of soc_pm.bu->suspended
>        ARM: at91: pm: document at91_soc_pm structure
>        ARM: at91: pm: check for different controllers in at91_pm_modes_init()
>        ARM: at91: pm: do not initialize pdev
>        ARM: at91: pm: use r7 instead of tmp1
>        ARM: at91: pm: avoid push and pop on stack while memory is in self-refersh
>        ARM: at91: pm: s/CONFIG_SOC_SAM9X60/CONFIG_HAVE_AT91_SAM9X60_PLL/g
>        ARM: at91: pm: add support for waiting MCK1..4
>        ARM: at91: sfrbu: add sfrbu registers definitions for sama7g5
>        ARM: at91: ddr: add registers definitions for sama7g5's ddr
>        ARM: at91: pm: add self-refresh support for sama7g5
>        ARM: at91: pm: add support for MCK1..4 save/restore for ulp modes
>        ARM: at91: pm: add support for 2.5V LDO regulator control
>        ARM: at91: pm: wait for ddr power mode off
>        ARM: at91: pm: add sama7g5 ddr controller
>        ARM: at91: pm: add sama7g5 ddr phy controller
>        ARM: at91: pm: save ddr phy calibration data to securam
>        ARM: at91: pm: add backup mode support for SAMA7G5
>        ARM: at91: pm: add sama7g5's pmc
>        ARM: at91: pm: add pm support for SAMA7G5
>        ARM: at91: pm: add sama7g5 shdwc
> 
> Eugen Hristev (3):
>        ARM: at91: add new SoC sama7g5
>        ARM: at91: debug: add sama7g5 low level debug uart
>        ARM: at91: sama7: introduce sama7 SoC family
> 
>   arch/arm/Kconfig.debug               |  10 +
>   arch/arm/mach-at91/Kconfig           |  18 +
>   arch/arm/mach-at91/Makefile          |   1 +
>   arch/arm/mach-at91/generic.h         |   2 +
>   arch/arm/mach-at91/pm.c              | 343 +++++++++++----
>   arch/arm/mach-at91/pm.h              |   3 +
>   arch/arm/mach-at91/pm_data-offsets.c |   2 +
>   arch/arm/mach-at91/pm_suspend.S      | 827 ++++++++++++++++++++++++++---------
>   arch/arm/mach-at91/sama7.c           |  33 ++
>   include/linux/clk/at91_pmc.h         |  26 ++
>   include/soc/at91/sama7-ddr.h         |  80 ++++
>   include/soc/at91/sama7-sfrbu.h       |  34 ++
>   12 files changed, 1090 insertions(+), 289 deletions(-)
>   create mode 100644 arch/arm/mach-at91/sama7.c
>   create mode 100644 include/soc/at91/sama7-ddr.h
>   create mode 100644 include/soc/at91/sama7-sfrbu.h
> 


-- 
Nicolas Ferre

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
