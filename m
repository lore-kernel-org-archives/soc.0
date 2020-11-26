Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35647C63798
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:17:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B205F221F7; Thu, 26 Nov 2020 21:17:18 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0DA1221D1A;
	Thu, 26 Nov 2020 21:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425438;
	bh=u7BH5L4eK0u62SL9mIlU3zK5mJXaMoRqQvowEE7Quls=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UR26oyB+rjFuzsCB2vcev8xkFrFECltLmcIUPDjwfTjs3Chh7QeRifrAJcigQFaBd
	 h9VcssTNMYZwZzI/8jHEj4BOnJaLNNVxU0EXLLrZtXW1/E9xuTr1OqcxUaKx4RrYL/
	 9GJ/cH+MoMW6LMp9dPUTTc1N2ryhFNu0JEZf4EaE=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Li Yang <leoyang.li@nxp.com>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	shawnguo@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] soc/fsl driver fix for 5.10
Date: Thu, 26 Nov 2020 22:17:11 +0100
Message-Id: <160642540713.1426580.10622135995409567904.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125165922.15487-1-leoyang.li@nxp.com>
References: <20201125165922.15487-1-leoyang.li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:59:22 -0600, Li Yang wrote:
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

Merged into arm/fixes, thanks!

merge commit: 3a18293e4a0fa75366087c683bb959a8ff55111b

       Arnd
