Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD01C433FE
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 13:50:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFC0560D43; Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C9B1060E74;
	Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635342607;
	bh=owrpMYObCISKeE0lVWU88KpzIDHXATFZqEOgF4uKkWo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gkvR08wdf8z5n092deWzfsPA38jT0UiwpBvJ3czS8Mv8nx3OodPV5tUaoSLCQvoJQ
	 UnrLvmR8d7NZ9SauuLDSf+J26AK/P+rkSkzzEymRUDgOWJKX6rBtQX7IT+WOnWPE5k
	 /WwrJM42hqyCLwhPApkSLorEHWaaN0hnPgJXOg4VbzfkJcTaf3J5dYt4OZ4LTjrxwF
	 IQe33zb+Q80yIeHC5uYz6qSCeiQxvx0UnW7CcoR0OHU6krvVhFJtfNznq3an6yrtTN
	 BJOYng9NLkWx4Z5598Yyqc4Be1ca9mk2WIztA1XZjYhqCSnsLHkIRDG+q4CDvA/2eu
	 0o8eMSlPm7uOw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BEA3D60A25;
	Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 5.16 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163534260777.9048.9056807296331592175.git-patchwork-notify@kernel.org>
Date: Wed, 27 Oct 2021 13:50:07 +0000
References: <6d41b29c-dafa-9b0e-d9ff-fe01eb6dce82@marcan.st>
In-Reply-To: <6d41b29c-dafa-9b0e-d9ff-fe01eb6dce82@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Oct 2021 21:30:22 +0900 you wrote:
> Hi SoC folks,
> 
> Second try at the Apple SoC DT changes for 5.16. Sorry for the s-o-b
> snafu...
> 
> -Hector
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 5.16 (v2)
    https://git.kernel.org/soc/soc/c/c17c7cc775b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


