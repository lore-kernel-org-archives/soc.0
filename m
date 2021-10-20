Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC26C43219
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 13:50:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D810F6138B; Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C12F061374;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634737813;
	bh=8awGB7OP/Kq/Fm8Oo3K0PKhcWQZVm+tj8PZGt5rmC7w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GLtbihrEqtKzDsc7pkDk0sDHg5G3QBtBfepOaQJy+r8BKqV1T52xeJSqI9eaDaVge
	 TwoAkheJ1cd4Zl4y+7U7Rr70XPdavt+S7FkLvRHpu3tI/Ip289NidthCNKiSwa43uL
	 /8OznNT42x4R8Jf75QKcC3sedlvQ6LQ0YIMZ69PZWtXEF9VcEWaNfy4RfF9U1VvoOk
	 h74qurwJQBNpEx09kHml36kd1IMlv+1+ec37XumzwydAbsSHXsqdP3qzXRtVyA21vG
	 zBpvenruFxckqPRVCpldFfrxmWDtoOy4Ql+JY4YVTfJHyd+8o1+EJMhf8ODnoLpFdS
	 D/baxPvXMQGRg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B865460A4E;
	Wed, 20 Oct 2021 13:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.16 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163473781374.13902.13901998052688570685.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 13:50:13 +0000
References: <4536780.s7XYDJ6uuW@phil>
In-Reply-To: <4536780.s7XYDJ6uuW@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 20 Oct 2021 11:26:38 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in the next mail some additional Rockchip stuff
> for 5.16 to go on top of the first round of patches
> 
> Please pull!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.16 #2
    https://git.kernel.org/soc/soc/c/40e7a3994c90

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


