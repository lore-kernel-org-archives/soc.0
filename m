Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E63AC49361
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 63A7D61626; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C794614A7;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=5dlHIEKKDetIU++NQQO85rthTHMzMkjlCnKTER1grWc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cRwpuAqIzxhbbClyEDwIQctq88no2Xr9PnDNdajYxQmLAmsrv1BjFtwDRYEiOEp2R
	 AJtbU5h8BfLTvTib4KVfx3imeexAcbkLn2x8yHzb9cKb3b5EJVM5Vqdc64LivRTnE8
	 8VmgC9axnmrtH67hQOI9NLV3KiSlffSKST0rbFz2YfaPdmZZSCrJw2MBMCfkkd5UC+
	 lMm+sdUy2ZHNpBSU/+a4BuXDQUg1ZEPiYnFle0E2p+u5NyHiYZkR3gJ6lD6MOvmjuD
	 cnxbuIBmXI91Wgc82g0JH83oqIjCYw/F5kv8wA6zCIiNkgUrBqYX9qUdm4XqbmSnX7
	 Hk3AnKrgyfv8A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4415B609E4;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers update for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281327.17464.1679856105403714018.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210613082544.16067-1-shawnguo@kernel.org>
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 13 Jun 2021 16:25:39 +0800 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers update for 5.14
    https://git.kernel.org/soc/soc/c/ec3171d7beaf
  - [GIT,PULL,2/6] i.MX SoC changes for 5.14
    https://git.kernel.org/soc/soc/c/57d459e2192e
  - [GIT,PULL,3/6] i.MX dt-bindings update for 5.14
    https://git.kernel.org/soc/soc/c/bb1a7fcec17e
  - [GIT,PULL,4/6] i.MX device tree changes for 5.14
    https://git.kernel.org/soc/soc/c/970d180b8b7e
  - [GIT,PULL,5/6] i.MX arm64 device tree changes for 5.14
    https://git.kernel.org/soc/soc/c/989e7e357c88
  - [GIT,PULL,6/6] i.MX defconfig update for 5.14
    https://git.kernel.org/soc/soc/c/dfde897bb1d5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


