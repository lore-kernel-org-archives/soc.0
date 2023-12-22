Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CA4C47DB4
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B02D1C116B8; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FD9BC4936D;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=HNbY9UYllxQzP6GgJw1yup4kHu8/5hr47roE1D+RkYk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EyP39qVErWfCCwAlxTi9yXmq4ZTLwEyJVZkFTi6FmNA6fgu2BIQvjyRrq8grx+jMV
	 dYlEdTdBkUJbow0t3w4O7PkX0V6kKU3+KgX1YoQr3czf9q14nqoeb2vn/Lw2NPqMUS
	 KvWrfgpe/8PfU+UGhiwjvftOyAzrncgd/FoRzkxqVus5z/qoaRY4RWfzyeVbe+rguv
	 XbgvhhOUdlneY80DKPByLTBNH5MAk3xb5V8eEQ8Bij6hpU6zs/inqNReIxXp6FdTbB
	 AaejGsT0HbRP+xlf/C1hoTwneVS3uTql7Qp3nwD9Pe1GNNrvUGZfOtvWlH0uDCwi6L
	 Tr5CQqfMslF5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55442C41620;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers change for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646734.10550.7115090957510921138.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231216064605.876196-1-shawnguo@kernel.org>
In-Reply-To: <20231216064605.876196-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 16 Dec 2023 14:46:01 +0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers change for 6.8
    https://git.kernel.org/soc/soc/c/e85c036c9906
  - [GIT,PULL,2/5] i.MX SoC change for 6.8
    https://git.kernel.org/soc/soc/c/fe0a6cebe9f3
  - [GIT,PULL,3/5] i.MX DT bindings for 6.8
    (no matching commit)
  - [GIT,PULL,4/5] i.MX ARM device tree for 6.8
    (no matching commit)
  - [GIT,PULL,5/5] i.MX arm64 device tree for 6.8
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


