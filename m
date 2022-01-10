Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29588C433FE
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E372C36AE3; Mon, 10 Jan 2022 18:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB310C36AEF;
	Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641840010;
	bh=c80vktDEYcsmGw713BIFkVJr5HABbIDyMlOEDaax1p0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Glm0xf16Pmrip60ML0bXFTlyNGnr0DyL8PDxZY+cC/q09qHLc6oIxFH9Y+BZJwXBr
	 XqHb+tac5MCTTwv9mIT0IpIPE2yRu96ofRD1ny/6HAenbU/aus0mFAZH7oLHaX3YOt
	 oKjbIxBXWcMrNCfV0XmA7+gr2OZa/S+dbAgIWg1hAfUdQnxLLzoGYZbx0cc9ToOdIY
	 wCXbCa7oDWU9TbW+rRk9EZuZWXe/m2lps58W5GkBWI/N9g6mslIOF7674k72tlFAUR
	 S2saNKyT1J80FS4lpkAggWc90ga9EVfcClxdTd35SNm2Vk38jap+Nso8GXNEssuR/q
	 PmV4IlQY9hA3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF951F6078B;
	Mon, 10 Jan 2022 18:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164184000984.18694.17996247176167523849.git-patchwork-notify@kernel.org>
Date: Mon, 10 Jan 2022 18:40:09 +0000
References: <pull-1641801310-149268@atomide.com>
In-Reply-To: <pull-1641801310-149268@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Olof Johansson <olof@lixom.net>:

On Mon, 10 Jan 2022 09:55:38 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/65def56a5fa7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


