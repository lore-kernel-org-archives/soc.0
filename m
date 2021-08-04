Return-Path: <SRS0=6aPj=M3=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B0FC4338F
	for <soc@archiver.kernel.org>; Wed,  4 Aug 2021 08:20:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 635DF60F02; Wed,  4 Aug 2021 08:20:31 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218826056C;
	Wed,  4 Aug 2021 08:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 218826056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628065231; x=1659601231;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Z6uCYiJDMPmIaY0H5P/HrvjIUzv/p6tap6NAIzcPXoQ=;
  b=ooPQHqslDpXexNH4CNpZTqlStilXzUU817xfbKgd8XfsOnMF9QB0gmrv
   xBSh2aFe+TLV0GumSSYXDlCzUgsCUEnN7g0ByKT1YyiDrr8yntx9RqqYV
   Nf5Adwk5h52YhujrlBqgqtRwzsrr4jw3wwkf0k3U3r+952EAF6yjnMr4T
   7VEbsESrD7JYoDmMT1XURYrOgSJDW8kufsVxfPWNUe+rbprH3cTzoSdke
   DF97OIogpwedI3Lt6sdVNkNglJ+JUq0XGoqNUsQUirHyH4o8RHmy9+dws
   ZW+pLd3bo3fdqhIpKz0QAbx5sv9eGAWHbZnEYxlkPViOduEf0H0Qbc+0H
   Q==;
IronPort-SDR: ajr5qO8VLkx6Ag0+Bqu3hVg8ZYWrygk+vCKrE0QqemMJvKQHsR2g39dkchOvfom7zZ18zCP3Dv
 5rFsX6Hwj0s0tQWQgn0+nxWlUZT3eCjbB1+Q1j9JPDf4hbA2/5TO5uoBIIuYb40+xy+xxH5PAm
 pcOj6QiiQuxX99YiJFncLBW7mf9yy7m82THBQLLw415y5tj+pBWe1tCpf2uipXKF/plW6pNgwQ
 CKWPfNMYFxiblWMlBC2EnzQaVq80d07WzEtnbARJqq1mlUBJSNO5sUV3DliPuM8ec7YrKGiq+J
 7IBumt5mZXlQy9msKCw4+Bo6
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; 
   d="scan'208";a="138752739"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Aug 2021 01:20:30 -0700
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
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

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
