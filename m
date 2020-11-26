Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB94C63777
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:18:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C663221F8; Thu, 26 Nov 2020 21:18:47 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8FF1621D1A;
	Thu, 26 Nov 2020 21:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425527;
	bh=P6gIUcQnKh0pETuUpedLXRB3poCI5K8TiEfJbbVqea4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d82b3R7qEywoZg6fQViz9h5rEEMS2AHpoK2cvcFnSaGPK7BoWVtxNBO7pLjiD+HJ1
	 3DfuHEN72rSeWWFjVFVirWfnOJxdzI2adc7ers9R93htU4oRTxtSwKFcenpZa/Droe
	 GpKeBg01emLibdrPp5vFyX8anjmbHKP22XB/84XQ=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org
Subject: Re: [GIT PULL] soc/fsl driver changes for next (v5.11)
Date: Thu, 26 Nov 2020 22:18:38 +0100
Message-Id: <160642550445.1427126.16824828882938559324.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125165913.15441-1-leoyang.li@nxp.com>
References: <20201125165913.15441-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:59:13 -0600, Li Yang wrote:
> Please find the pull request for NXP/FSL SoC drivers.
> 
> Regards,
> Leo
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: ba622a3e74a7fc05e648dbb34483d74852f5ff86

       Arnd
