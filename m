Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD824EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96E8AC433CC; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78A21C433C0;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=yWIa4zmdVfcGBOso/YOiqDnaVwJGLPAnd5lZ9x8pv78=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Y9WoP8ns1it2Aqa6Kr+dZD2DBbW+FxU5/AzK6EufAsp+mI0xynRKJ3ClC1/tjAISn
	 K5ydaaFuLmMtDel90qqKqfYPLfQt8Pu4B1sa0HDJ9M+UCcjvs1MXWAzbjIell4aYYM
	 IxLLCUUcDedDU8rwfg/r5FP63+BYQrSCf4kcbwYRf+sAQ9l7cpWWxlKyTQUPrCJ+Tc
	 bCOncZxPulwSMVAkp0U4wgpavjqFw8qZ8sE+4BsNSEdcSfyhJggtVARGBDG7MSRUhT
	 OBAUC2f0V/wG+HEjWqEG1LJ1iA8JCzREbGta1+axyjYhDvFSVH47rRZ6hLR+o7mQv8
	 wATD2p6lAllxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 62221C395F1;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]: soc: mediatek: Updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943639.9834.7914239054494755845.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <1ed1e5ae-6305-e63a-84a0-3c43f69c8f8b@gmail.com>
In-Reply-To: <1ed1e5ae-6305-e63a-84a0-3c43f69c8f8b@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 18:30:51 +0200 you wrote:
> Hi Olof and Arnd,
> 
> Please have a look at the driver SoC updates for this round. The most important
> change here is, that we now support a PMIC companion device as is see in mobile
> phone SoCs in general and in the Sony Xperia M5 in concrete.
> 
> Please pull :)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] : soc: mediatek: Updates for v6.5
    https://git.kernel.org/soc/soc/c/aaeb1b636763

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


