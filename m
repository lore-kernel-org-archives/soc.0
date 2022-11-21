Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6FC47088
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEC3DC4314C; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8124C4314A;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=+iWzQSnXbsCx0MzFydU5rmZ2OOdGOPZhJoz0y8u6OVg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u0zW7O4/PmpBmkMiElQ5T0P+KGzmroLJQbNtW8RpnPS6CsuifdcerUJ/pZhX13dGg
	 RcjimyYjl68hq97k0kJNiK1G/ZWhH/k0wXK4ujmAjpQ1z6CmK6Ims1ox94P9DZhMv1
	 jx8/KKJEKDv1D1+ATCETgZ7pbKipmm9qDF5K0SWnxkSN1RPGVz9JdhHheh9Cir8CEM
	 GP5x4Pu/k7hB8uCr4KSglG9symXp7NIoMXs/I5TfBPrEpsz2Nhu1zV+0LuI4EAqVGx
	 e25Cwr/wYswXkMNyB0ZHz4/oJuu/iVVSXfA0c/fIgP0o86KCpxlfVNA3RM04wp08Dc
	 8rZOcSAJ9ViAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7C3EC395FF;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] HiSilicon ARM64 DT updates for v6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234368.4359.1568998053938428194.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <63744D38.9010700@hisilicon.com>
In-Reply-To: <63744D38.9010700@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Nov 2022 10:38:48 +0800 you wrote:
> Hi ARM-SoC team,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] HiSilicon ARM64 DT updates for v6.2
    https://git.kernel.org/soc/soc/c/4614161b0667

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


