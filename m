Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F25CCA481
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7A00C341D5; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A200C341D1;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658239815;
	bh=ERIcFDnrJkBe3dg1k2L03oA/IKdphq219lNG14v9md0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LdRZl5TCjh9XNYcUE000cR2Fvh3sMWsmNEe0eMXBYirwLqgGbMftTICA8hFbW6a9A
	 MKNfNXiRo7lQbyfewYI3Pwyy6U693E6z7wOdVufR2y+w7c5yenGqzklDJUspRhlQNl
	 BZjEIKoZqrsNAXDqEi2ZA1WZNjuuP5SWgVi5LtegKDu+oxrGFt69I9Ew2J4jsX6QzL
	 bSiZ179vpT5fKuK82CNaJi/YPGz4DIaz9vvaXJmX4vDB5/KX+DKyEyjXtXBLDm43j/
	 DfedUuKjktfSrsvuVRZ7lsIOqvxsRXXLSsOyXOj/D+fthOerICGMy+iL+WTkGE/fWq
	 cTtkcHRT9I+OA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 696D9E451B3;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.20 (#1) (replacing previous one)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165823981542.7750.5900756005438662357.git-patchwork-notify@kernel.org>
Date: Tue, 19 Jul 2022 14:10:15 +0000
References: <87cze1qlg3.fsf@BL-laptop>
In-Reply-To: <87cze1qlg3.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 Jul 2022 15:30:20 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.20.
> 
> As seen with Arnd on IRC this pull request is replacing the previous
> one. Now the cpu type in cpu nodes are fixed: cortex-a55 instead of
> armv8.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.20 (#1) (replacing previous one)
    https://git.kernel.org/soc/soc/c/26c350fe7ae0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


