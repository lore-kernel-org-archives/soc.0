Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8D8C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 15:14:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78C7A64EBC; Tue,  9 Feb 2021 15:14:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1403C64EC4;
	Tue,  9 Feb 2021 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612883647;
	bh=v4TB7BWrAV44HCkJk2zigmW3d76b60s+c6sWD0flSm8=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLu7sC6qDInGWkejHXuWBxwTGvTVtr/KYR6lksYxgmt3WUS2Op4q1OQsqXLDKg6GX
	 Cb0WiLRdZ4qmM5nc8yZe95iEgTD2+Lu44P4WrOQR/eHu3yWew93J9Zh3VrlqMNFRlY
	 NVpenZFvP7CCM0eDPopoyyhJFyo4whlbsEUmbMza4YrhvwlVwlbRUGio1+iTzMqAxD
	 jrFLtMJHBcy/5X7/Lh3TozHPdomIL4csFXf1MPj/a4ZiAvK53SjRhN5fCPws1jCYoL
	 uLQDo8t1C2zfhvLu90ede6Hf/plmdjN3cFoxlMvKaepGpfw0CVj156jjjC9OIoJyWL
	 deEJD7O5xMtWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: arm@kernel.org,
	Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	soc@kernel.org
Subject: Re: [GIT PULL] Rockchip defconfig64 changes for 5.12
Date: Tue,  9 Feb 2021 16:13:53 +0100
Message-Id: <161288360601.2910447.1012319694875151191.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <4622596.31r3eYUQgx@phil>
References: <4622596.31r3eYUQgx@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 06 Feb 2021 01:01:56 +0100, Heiko Stuebner wrote:
> please find below and in the next mails Rockchip changes
> targetted at 5.12
> 
> Please pull
> Thanks
> Heiko
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 7b9f5793e1f279527e9f155a011e01cd57bccaef

       Arnd
