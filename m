Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88245C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 15:49:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6082161139; Thu,  8 Apr 2021 15:49:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CC061158;
	Thu,  8 Apr 2021 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617896994;
	bh=SK63wqZYU3DsXQuWRf8x+2cEIgroaltGmCMLkEJA334=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbVX0LONVMuHtM0a1Dr4WSfvzdNh7FRvwHQoHHSGIPFUGKQb5n4GXFtCMErzF3t8o
	 zVgTG472yQQSduCqCIMU2NDDsx8x3gJo5DByGZh67tW/8wAQ/PWxvSO5kWMplPPcQE
	 Y2sypgqjlJZSJrz+0G+riaoO9jaQ0K2NHGnfSzU34EOnK58/Z8jYjo0yKohcmc0mdN
	 dwsNGQljNBL6PgGPpZhKK52lYpcNHflQTMce2SCCD5glP2MAhl94zORS9wOJ721Zkv
	 TR6f3iB6b/wVcGSyTTCkx3Wsp9X5hsQEpMgEb1qvfPLyqiJ3IeoqZHNPsaG41E1k0u
	 bgla666f/isPQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	ARM SoC Team <arm@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [GIT PULL] firmware: arm_scmi: updates for v5.13
Date: Thu,  8 Apr 2021 17:49:32 +0200
Message-Id: <161789693280.1636044.5523561185670345817.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331100657.ilu63i4swnr3zp4e@bogus>
References: <20210331100657.ilu63i4swnr3zp4e@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 11:06:57 +0100, Sudeep Holla wrote:
> Please pull !
> 
> All the drivers files have been acked by respective maintainers.
> There is a conflict with IIO tree in linux-next with right fix there,
> we might get same conflict depending on what gets merged first upstream.
> 
> Regards,
> Sudeep
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4be3f47e1bd5c9be4c4b95de5f3531f062a28a66

       Arnd
