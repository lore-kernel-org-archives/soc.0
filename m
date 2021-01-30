Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C326C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D96964E0B; Sat, 30 Jan 2021 11:34:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9400A64DDF;
	Sat, 30 Jan 2021 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006470;
	bh=c3GEQT6oF9+wQR9UrszOyvn7CwWaAsxfZPnG9Fw3y5k=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uhBSM8+kB3ldiLDr9je46/nAXbfiZbUElDmzIFQbewJccel1VemPA8Uc1y8xF6mZX
	 WLcEvfr8PxNkD9nm5CUo4cNmVZzR8tmBYRNlbg9lpVZkprGntSSVWX8NsKosA3dM65
	 eFOPcvHMfkRoXembeLQj3HW/QOyUsryePS2eXsAmwgwJkpveZ6pmBOp5ttIGXF2r5R
	 W8OaRppiXMBQKwVeOalH0k7gtFfNO5NOj/27iK1n89zy9uSWc8wXMgjhkwcmuDYo3R
	 XSlR64W3yJo5l/291x91PNCs77EL/a4+Q2KnAkOtddj55xLq/ia97KQrGW5VQFWbo/
	 BCjoE7qFOCSGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:34:13 +0100
Message-Id: <161200641725.2316427.6123673465143311055.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-5-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com> <20210129193254.3610492-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:53 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-dt
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3161160c8a1c9978dc8d5ab79f2a467d59a312d9

       Arnd
