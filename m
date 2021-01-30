Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36C0C433E0
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:26:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C1B2D64DDF; Sat, 30 Jan 2021 11:26:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4535264DDD;
	Sat, 30 Jan 2021 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612005989;
	bh=LyAnhlsiIorO4ir4BtES7EnTn91O/Ufswo/Eo3EMnH8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdFTUjp8xmVmciYkSm6bcbQX8RAkIwuuffaO3CoOk9jpphHRtnxMWUejeqMiFsUcd
	 NQ3vo48XcIxgPyLaOMDkpbZyPCE6jjoii2GXR8gCQKGZDPzKOZ/iOFtM6XrcRyHs2q
	 4VnWTh9CuDE8GY4mBxQwi3ZBsHshNcGuSnfiLEyjS9zrV6+sBuDYcE1bF0o0VNyLjZ
	 p0Jps/0RuIfoue91l4PIEavnFZiABcU9edfGkIpgL++eB/q3NDDvYtV8dQmI2xt791
	 o0PyQTO0xffiys9fH8UjYRVSUHb7oUZQFafJNTlBw4ZToNAHviM54DqGoqFa88q8CA
	 R+4Nh6TXATEow==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [GIT PULL 4/6] ARM: tegra: Default configuration changes for v5.12-rc1
Date: Sat, 30 Jan 2021 12:26:24 +0100
Message-Id: <161200598057.2029918.993524285173980816.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129193254.3610492-4-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com> <20210129193254.3610492-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 29 Jan 2021 20:32:52 +0100, Thierry Reding wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm-defconfig
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 69e39bf1668e69ea5e1a15ac97d7dc11c367b791

       Arnd
