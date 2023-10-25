Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F90C25B71
	for <soc@archiver.kernel.org>; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD60AC433CC; Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B84AFC433A9;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698268828;
	bh=JcElVX2YaSW3rbauDcz5BT4ezfz8Dnlflfr1y4Er0q0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HJRcrQl8Qz1x2kK3vXufQBtw7retYKzESO0673Q9KKj4CxklgQnnfh7R74CbzxGGH
	 nGQpGc+IyLczs+NWajx7i+QhYKChKlQEmVMTHEUAuU0RBxrzK73zwyQ3WaeXslXtIe
	 qL+u4/vC0XNTG5P0rRzoU9ptZZcjQFWmU7rhS8qs1ePYVzqTEJOR3LquZMpYz7/iDm
	 mCC9sjvhFR05JxJv8ys0Ge2bFK+4sp1PO/Vv6LPPw213o+902zMkGeyxjcZLBhWgrb
	 7JodBYHCMu/Vh1fcA1N0zrvQzsXZq3kTY9Js7c8tsW2vukwy//OVmS+tJv/mfVtkEx
	 Fg72QsR2fV2qQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92A4AE11F5C;
	Wed, 25 Oct 2023 21:20:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ti: K3: Second round of updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169826882859.12441.12758369116762416160.git-patchwork-notify@kernel.org>
Date: Wed, 25 Oct 2023 21:20:28 +0000
References: <35a3c4c9-5c1b-4891-9ea2-e3f648a9afe0@ti.com>
In-Reply-To: <35a3c4c9-5c1b-4891-9ea2-e3f648a9afe0@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Oct 2023 22:39:48 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> This is second round of DT updates for K3 platforms for v6.7. These contain minor yet key
> features for newish AM62P SoC, AM65 ICSSG and J721s2/J784s4 Display support
> 
> Regards
> Vignesh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ti: K3: Second round of updates for v6.7
    https://git.kernel.org/soc/soc/c/f652f84a9fbd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


