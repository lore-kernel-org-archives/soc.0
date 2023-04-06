Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5204AC7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39922C433A0; Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2266BC4339B;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680816631;
	bh=b6K84tncDbGHpbDcJkxUUst7b7BPY9wWHjci9QUgjQ8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qJuvwvPhe2pbEaXou+cI53TJH+F2+Nk+N4WdERSvZBYk0whHgBoHY2SsK1rZub6E0
	 FTmaaFzXNkkuXQkGcyG+z5DX9SyLNf6bHCG5zkmuZmn9qImpAzDdwu2arChZaG41k+
	 gzjI+RG29pkJlzLy/Qmr4OSSZOGzdGcLIOs8bBxQwSD+F/SsQ0NotEX1ly5x2K46QO
	 EWIQTuMlZkSEoOMStI/xyxM2ID3y0im5nrguKZ6lg0Gf6IhbV0S8qsmw8QXLhcVmYI
	 Gfz03302ox6fUq9CI9SGlM8yzC4Ok8swqnblQodVTHcA+pzDBlMbFjrTErvWRvTBRB
	 hhVUMPphWocqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10AD0E4F14C;
	Thu,  6 Apr 2023 21:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.3, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168081663106.18696.10036369106974881239.git-patchwork-notify@kernel.org>
Date: Thu, 06 Apr 2023 21:30:31 +0000
References: <20230406021602.GP11367@dragon>
In-Reply-To: <20230406021602.GP11367@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Apr 2023 10:16:02 +0800 you wrote:
> The following changes since commit b3cdf730486b048ca0bf23bef050550d9fd40422:
> 
>   arm64: dts: imx93: add missing #address-cells and #size-cells to i2c nodes (2023-03-14 14:55:17 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.3, 2nd round
    https://git.kernel.org/soc/soc/c/a425efcb6e07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


