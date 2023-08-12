Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3B0C04FE1
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC27BC433B8; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6E57C433A9;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=OO2BI7TU3sn3ZIa8X66Xzv7rlR9ZrNhT3eOstt0RNqk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BtHucaKfNtcgSHg+g0P4r6Eg0I+2Ysep/hvvmGhic1JpFRZKrBciMD7cZQatiICQ5
	 SqWFeEYUBJKpt7skHFcl4E/9rn3kIBZwyFx5B+cMaJSGAoV3lVWxPsdnNh246kkYN/
	 POg40x9T8EERLXOzALFukK1g7ooSIA07nwUTdw0RqGBcnvs19hsa6NllRqnS0ZuJX2
	 8tm0B1cyEhqX2nrDTkkWXJYQt/VcdF+2wAeVZrkCwaLDeopJK8DmufXaUJ/8GTCevp
	 oaSXAlLTGUB1EAsMqc5rdv5s0/isO6PwsfO5qTMDhZ4sxEGZARDLDxXQpVLQ3K/C1+
	 Dn6CfggWvxzvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93567E3308F;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562759.32343.11152678527905568761.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <20230808145950.3057250-1-p.zabel@pengutronix.de>
In-Reply-To: <20230808145950.3057250-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Aug 2023 16:59:50 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.6
    https://git.kernel.org/soc/soc/c/e6cedaa9025e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


