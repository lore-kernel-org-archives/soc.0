Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F32AC54E69
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F7CBC41606; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44041C41613;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=xRhCziV0JuAYlSY2UrmcczYgDANIDT5sBZFEg+2xI7g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DGPCl5bSMC79ynySt7iXIYrsIAvgbOP/d2IMzL//HMvmLE8iMS3qkPtYJQ9hCTRso
	 sm3Xb5+/Ieinmn4JvsIxJ/6GhOJ0fI3E4W9uKXFY0j9H9Flauqq6p5SbtUoOEYpco6
	 IZqNvPv2jv1YkaOM5Ipi1VTGr38gzaP3ny/5sYvdIEaHk5qrc31oRU9waaXpJbdeEB
	 0BPMMFk3V7jswfq8JTWqhlISIX+2rfQ58i4Ie/ZmkD3SxI47am9wPT9Ew89sl19bWt
	 SOiPjKs1y5DtDj62VWQpyW+56CKKs2gCoKAAha/9xzQdpKDByVQumxCJT+B+P4rrQb
	 t84tkTDaozUZw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2BA74D88F8D;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: ZynqMP DT changes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927517.27833.2531525160911529205.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <CAHTX3dLEoFMTGg1Q4+OuOwWYd8N73YBTXki8Vvj3cGHUpLJ0=A@mail.gmail.com>
In-Reply-To: <CAHTX3dLEoFMTGg1Q4+OuOwWYd8N73YBTXki8Vvj3cGHUpLJ0=A@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 13:30:34 +0100 you wrote:
> Hi,
> 
> please pull these DT changes to your tree. There are some SoC related
> dt binding changes and associated DT changes. Also followed by some
> small updates.
> All the changes have been checked against DT schema but there are
> still some older descriptions which should be updated in future.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: ZynqMP DT changes for v6.9
    https://git.kernel.org/soc/soc/c/b797b9cde498

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


