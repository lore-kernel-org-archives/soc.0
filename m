Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB6EC6FA95
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56985C43149; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3832FC43141;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=v7bxoC6xzRWj+R5hzpJyDNBvXbe6deRiZK0NkLDz2uQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oDggnKr9Xdy+hfudVsCW0pz2FEiHsrccISfk5Rj82XeZDFVMdkTcLkLPv1UsdEk+s
	 +tlw1EWLmszk9KqCm0aYCkDf+tr69GXfuDQPFD9hd1ZndWiICQ/HCeRZ0MLdjXNnIc
	 HLWT8L158FrMUF+D8zW9YwTiWcXATVYqeJh+7am8yZvzdvxS+aK4RhG0p9pJG+nCr1
	 CZuP10lBQbGjE6vwXRu5jGKaxOXrdfcLRgXLdU9VqVUGHf2xLOuerbo44hzSyqWdaK
	 R4uILqbwgcz0ASiHK459bprO8wb9A8mJUu47UgTW9u7/96MPr33m9dKaKT6AyXD4y1
	 zSS0mmV8yRa0g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 225A3E4D03B;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: MediaTek updates for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472813.12526.1938571182426612519.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <3b915692-c8a9-c508-5a4a-0fdb49355e99@gmail.com>
In-Reply-To: <3b915692-c8a9-c508-5a4a-0fdb49355e99@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Sep 2022 12:50:14 +0200 you wrote:
> Hi Olof and Arnd,
> 
> unfortunately a bit late, but hopefully still in time the updates for the DTS 64
> bit.
> 
> The most important updates are support for the MT8186, up to now only the EVB,
> but I hope we will see more board with that SoC later one. Apart from that we
> have a huge update for the MT8195 supported IP blocks, especially tied to the
> Acer Chromebook Spin 513 series.
> Apart from that we have some more support for MT8192, especially for graphics
> support.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: MediaTek updates for v6.1
    https://git.kernel.org/soc/soc/c/9cc2df424a95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


