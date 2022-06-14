Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E40CC433EF
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32AACC341C8; Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C78EC341C4;
	Tue, 14 Jun 2022 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655239034;
	bh=5hmNqx1nB/Rx+ybmTmTTtEfeZDApfaNxkKzkUOfXAuA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tfYVgSXi9hNx6OQX/ZJ+GcKUUiMGrwi6370f69AeDbL4WPR1S/EP+ZXldf4Nvtc44
	 TWz9L3j40J1q++5ZvioknJyRCjRh4jSk8+I/jXNdifUCxpwfyFHdxczBAWl7ANTCZD
	 vSLXQqD/Bao+VpKeq7Eqc2RUzQtlPA0sK0bsQA4mmtTnAKd4F4yhzBFGrB6I1yldZJ
	 gh6KylmODXaWjOm/SuiUWebObcNkoSk6/LuiwzxT7Nq4O1w2urf0iyUK0AUSNFSzss
	 gshC9O/2pUL4K1mSrCujOisLWRBJPx2S18SyOqholgd0DPPRXgkmio3YBV9bosnszc
	 yn1ble77910ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0FAEE73858;
	Tue, 14 Jun 2022 20:37:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523903398.29335.4604263805219578938.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:37:13 +0000
References: <20220614095515.GU254723@dragon>
In-Reply-To: <20220614095515.GU254723@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Jun 2022 17:55:15 +0800 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.19
    https://git.kernel.org/soc/soc/c/2916bf223379

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


