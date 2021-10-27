Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360E0C433F5
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 13:50:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EB68F60F5A; Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D4D0C60F38;
	Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635342607;
	bh=R3LA3RepoyfzzHNN8/7g2yHp9wEIg3OBUq9f4HedJDM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=g3yBvqaoq39QSverXud6IicZJ+AV7Qinl04xwv1MFXlI8tPInkjpcsI5RbRgw6ggM
	 VfqQo/1MwSZA1BTStzMOLp1LeHwM85VFV0Qm7TA4wRash5bRVgKrSc638HaCWKczL1
	 0DlAG/OG0NY13w0ZfM5mJMpxOLBX72gqoU0rOCYFMtdJ+mwRX6DsEzhQIz+LejzvtT
	 FKA2CCYvTjKsK8M4qsCpeUdzoRt9byKmnpGaj/hHGS+VE+kyfuzv9hdSsEqPfO+PJk
	 GYNnRaoRFVMFOqd4JsahHMOTUu/C9CDajhkdVd6H1YHoUGFkJvzTG9VPKimUNRwuOc
	 tr9b1j4rpLARg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CB10960986;
	Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for 5.16 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163534260782.9048.116684476868555343.git-patchwork-notify@kernel.org>
Date: Wed, 27 Oct 2021 13:50:07 +0000
References: <f62bfa4a-3cc8-c568-be78-c5fd6919bc74@marcan.st>
In-Reply-To: <f62bfa4a-3cc8-c568-be78-c5fd6919bc74@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Oct 2021 21:30:15 +0900 you wrote:
> Hi SoC folks,
> 
> Second try at the Apple SoC MAINTAINERS changes for 5.16. Sorry for the
> s-o-b snafu...
> 
> -Hector
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC MAINTAINERS updates for 5.16 (v2)
    https://git.kernel.org/soc/soc/c/a56c75d62c94

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


