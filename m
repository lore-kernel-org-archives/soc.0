Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B8DC61DA4
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED0D0C433AA; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCE28C433AE;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675951221;
	bh=wasS2sPv/Q0lIk5jJi7Kin9rEwPSl4L1x8goLJ6mbeE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qRlk50kYJPNRK7HUDkKMz4HlQgTHycBAH3o0JTzioIQIpUY/xsxL5TpSAmcZzsN5z
	 dSCm3QDipMvhx7Ox43C4Q/ChNZ9ZiK7hAd491VVnE/lv8RAbfav1YUBM0hl3LfzAov
	 4cjbg1U3NIHDI81oFsXmgYq6CCzC8NFyQ5RrP1hTSsE9JGTVcUPZVb6ZmaqRQORT8j
	 cEGZmcjV/dM4h4FJn2151d1w8LiM2JeQhmhPwT+ENJGjDaYZ4Oum6Zd1ewxT5pxU1Q
	 R6CY1CLwnJC/DDgApEXFuf1SLihCwJZBrEm2aMMxDzSkFvnzr9l4q0vox01L43UeXn
	 gSA68ZOrgRrhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93E4CE4D02D;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167595122160.31919.1255207531221814478.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 14:00:21 +0000
References: <CACPK8XdbffU5yRSZF-zR2xv-+6aJK+hEXP8TOkW=SvS+nNTGxg@mail.gmail.com>
In-Reply-To: <CACPK8XdbffU5yRSZF-zR2xv-+6aJK+hEXP8TOkW=SvS+nNTGxg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 7 Feb 2023 03:51:08 +0000 you wrote:
> Hello Soc maintainers,
> 
> Here are the aspeed device tree changes for 6.3
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: devicetree changes for 6.3
    https://git.kernel.org/soc/soc/c/153927e6f6c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


