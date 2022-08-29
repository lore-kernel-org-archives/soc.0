Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFC2C54EE9
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 734CAC4347C; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D0CFC433D6;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766603;
	bh=PZnewZ/OrEla5jt39aQSGGw1bl1SCZFZ4Y8hnXC5mcA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jrymQ6awSKgSxTGfgazA2n0AVBmvXCPj8OLrfC+WUFiOQ3uwrlDS1HoLR1zqbl2sS
	 qwnRFjBWQrt644wnW3VOqhK+zPMb2cDpeYZe4jsE+g7IlY5XYn9ft+3ZZwQUD6qctE
	 4Hh9N2gJnqnt4z+3MHyHxhfrEknOc/F0d/uE6en2T6CY8YOX1uN7e6eZudJreJYHZ+
	 XbWKmxJjdv/Qb0ZyL2Zyp0nldvMB+eJCStOW0TcwtcmsYOLbwvbLbghsctLkIoKjZG
	 HcmjaV54eO2COs9SC1AczrZCByC3ztghAwFGLMq//LREU3nYqHDeaF59/iB9mCGiga
	 4PZPBDPnEP30Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3E079E924D7;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176660324.19402.17211449328668710795.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:50:03 +0000
References: <20220823092631.GV149610@dragon>
In-Reply-To: <20220823092631.GV149610@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 23 Aug 2022 17:26:31 +0800 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.0
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.0
    https://git.kernel.org/soc/soc/c/a3bedd242099

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


