Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1672EC4332F
	for <soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9262C433EF; Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C182CC433D2;
	Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670599215;
	bh=m6tMXLF7xH7ojOXFrE6F3DyZgksUyZi6Ey/wd4zXydo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hxol5agxkEy0tI196gBq32te6Zo33UMrBsmLZJVhxzfDjc8/cTGHI/4KIpXBKD8W5
	 hMWirdfjOX5PyyFs9lKiD5KeqXuFwgp79Rk+fH8mi+KCYxZgG2SZ1i2/a+gcfQ4Sbs
	 +YB6+fe30eEjd6R5L+jj06cydb7WguJWrSTeoPqZ/QZ7NxTQUVw/cpHqevwxFNKS6v
	 rarPZGJkcgl5Uml7BuZK+MSLl4xroaRtxB1LzAK2ZyB6f480L1+7gWL4L4ibOdFZT5
	 PUqai6jHVjDVRTWxGzwjBBD+nc+YjO96ymY3xE4Yr3m4lTSHpJ6VU/5XVMUx2HQWhr
	 gW34mVpe4V7QQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A1A0E1B4D8;
	Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 6.2 (v3)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167059921562.15517.10124816666359529106.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 15:20:15 +0000
References: <488ad4e9-04dc-1774-3bbe-d313ef30f14d@marcan.st>
In-Reply-To: <488ad4e9-04dc-1774-3bbe-d313ef30f14d@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 Dec 2022 01:25:25 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these DT changes for 6.2. One last round this cycle :)
> 
> This batch ended up collecting a little pile of typo, style, and one
> minor functional fix. It also includes the cache topology info for
> t8103, mirroring the t600x change that went into the previous batch.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 6.2 (v3)
    https://git.kernel.org/soc/soc/c/c83ce312081c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


