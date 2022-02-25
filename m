Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC718C4167B
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BBB9C340F7; Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78775C340F1;
	Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645804211;
	bh=XlXrQMUDuCJAR4nTnzkd/k2x7Bsya4pU73hIGUoXTlY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kckS+xy7PJR5UXx73PueY06jbzHa4sXj8eiCQzowES1MFCMch16yjTFb2fC4pkjO6
	 Lu4FQFmb+HuDhzQsDDKr1UARfZ9ro07fAffmIKfnUhRwBjpnkA11tZC63GmS7JVeEZ
	 H8k+v7u5jw2agnVYkPcxexfr9CEava40hr7eAsps/fLZuOplkRefrEOq/2N/NMKRAE
	 mWKAeCUXZYdzI6oRiotf46u0UhmiMHsoM+EZ8QWDCvMUlso0zIJtzgI/xv+angNvux
	 vDiQ4Xx4VaDoXcRUMtHoYY2hGRULOVJjIJjmVwFg98uWVaTsQsYVAVv+kaDGkOR5DZ
	 Ecx4aON/Oaz6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D1E6E6D4BB;
	Fri, 25 Feb 2022 15:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580421131.25553.13852413575112824598.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 15:50:11 +0000
References: <pull-1645606483-876944@atomide.com>
In-Reply-To: <pull-1645606483-876944@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Feb 2022 10:55:39 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 486343d3728be741db13854dc7e983c20cdd7c07:
> 
>   Merge tag 'omap-for-v5.17/fixes-for-merge-window-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/fixes (2022-02-07 17:42:44 +0100)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/f03f10a9823a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


