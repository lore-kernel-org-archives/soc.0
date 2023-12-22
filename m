Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93FCC4725D
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7CB0C116AF; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B721C116A6;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=rKwcgcOimLbAQtqocp34q9RASGIxR3xxtRBnrNJVkPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mEQcmhUN21xTcPI35x3gJLD/TZO/m7CiTaiQP0DSiVTSNIWho1QIIOITc9L0v3suQ
	 h26uFPL/GzSKdjvYYM6LscbZeQ0rziWpkdzs/GMx3jhWwxvsLrb+brHwIqtkuiVzm1
	 QHOP6F3NjS54Ye/J5DRsKyedk0BzvtDVuXOryCRvD7mLj1dpCVdGTWM/FlAfG9XET7
	 +NhgsDsO+G0SRjegKRuYCbjFk4+3EPEY9FkpH3jbEFRWHCDfkH9jkR/Uwa8qUVU03h
	 9H4INwfAcmNOmjIX6erIGD7DaUgl854+wKActAzgY0wrxuchNOmewQFFNuCNsCbbNT
	 hNGHA/dDjTxMA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EB16DD4EF3;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646745.10550.11827998346345901276.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231213153313.278867-1-p.zabel@pengutronix.de>
In-Reply-To: <20231213153313.278867-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Dec 2023 16:33:13 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.8
    https://git.kernel.org/soc/soc/c/feb69ea40a96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


