Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB76C433FE
	for <soc@archiver.kernel.org>; Mon,  7 Dec 2020 14:40:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9739C23601; Mon,  7 Dec 2020 14:40:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607352040;
	bh=+CKXvXc3Rixycrbd5/KL2HXlUNoUtl9ci3lkfw3gaFc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QDiDKaHzGW9vuSy7NOjx79Ta/veLSx2q3tXgtVCfvnvCbVUpWS0iEps8O9x5AwlKR
	 0d1fSHgpfqmwmHhk5LFPh70cpCOC56r18sydcIreelUeG/Vjvsa/jOQl2i1dmqQ4cz
	 QrYV29f5XpjGJe0eGp2Vh7PwvOGQCmsljCqOStuee/jji9KG59XqhBxwiuNwvAM7FU
	 RsnMKUIb3/S5jhMLCdFPwQVMXYfejBRd7tzsYwv8z1Wtj51FUj6rJstt7SRVtqEC24
	 k227qnnrlNKVX4iYowgsiE+l1TIeF3dMJANA6YmD5gNDKx/aef7nkbU/3/34nPzIxv
	 TpvDad3flVo4Q==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.10, round 5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160735204043.15166.731418476939769870.git-patchwork-notify@kernel.org>
Date: Mon, 07 Dec 2020 14:40:40 +0000
References: <20201201091820.GW4072@dragon>
In-Reply-To: <20201201091820.GW4072@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 1 Dec 2020 17:18:21 +0800 you wrote:
> The following changes since commit 33d0d843872c5ddbe28457a92fc6f2487315fb9f:
> 
>   ARM: dts: imx50-evk: Fix the chip select 1 IOMUX (2020-11-10 10:36:10 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.10-5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.10, round 5
    https://git.kernel.org/soc/soc/c/5e2e74024779

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


