Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B1ECCA481
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6314C341C8; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD0A9C341CB;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657556427;
	bh=T+Ls74ILLnBBUPG0s4aj7YkaggefLkjzKE64zdQZvjw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=STZ6ah+CjmnQK9OVXTGiiToFANv2H28gXWciqOoSiTx4BVX6Hus8mtOzjJy9xiU6r
	 ngS5YoFOX5efbGfNeO56jUSr4bkTQJiw8oC2QaTvTSPIi9ZC4eEPH4lGdjQqF/W5uu
	 UVE6yj6MgMfeZ6ZJFNfV2yDC608w5c/pl34lyXTKZFpRCPYjJh9OaHq1b+U3xzKsUr
	 JvLUkiC6P+LJWYkSk75wwFUiilfmCQFg83m4QWFfQwNUgqOA3xciHdr/An90vfrhhh
	 AE/i34vHBTidTK/Rks+PCZzRe+0TrDnp03LvkkaX2j0dzb3TZ25FY07v9dvumxWcyF
	 +O+0guMAoVWSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B618E45229;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165755642762.9192.10884207285556932372.git-patchwork-notify@kernel.org>
Date: Mon, 11 Jul 2022 16:20:27 +0000
References: <20220709082951.15123-1-shawnguo@kernel.org>
In-Reply-To: <20220709082951.15123-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat,  9 Jul 2022 16:29:46 +0800 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.20
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers change for 5.20
    (no matching commit)
  - [GIT,PULL,2/6] i.MX SoC update for 5.20
    (no matching commit)
  - [GIT,PULL,3/6] i.MX DT bindings update for 5.20
    https://git.kernel.org/soc/soc/c/8128bfe3d7dc
  - [GIT,PULL,4/6] i.MX device tree change for 5.20
    https://git.kernel.org/soc/soc/c/dbd68eb5baa6
  - [GIT,PULL,5/6] i.MX arm64 device tree update for 5.20
    https://git.kernel.org/soc/soc/c/a59591987726
  - [GIT,PULL,6/6] i.MX defconfig update for 5.20
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


