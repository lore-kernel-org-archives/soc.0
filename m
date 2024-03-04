Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669BCC54E5A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FF96C43142; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39B2FC43394;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=4ghiU5nv4k/jUyre1APgeDrGFPUQUUfkLnxpyXchbJc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iTnyJ5UMjr+gVuaAXaF302NNesHVzMT8WH3qTcgUav71158cQ+bkUzpZ59JkQOVPW
	 YeKvychyc68J6loWIaZBOt8VqK53P7/YGe/Uor/Npu0BDJQRvh8AKLvlDdFtxvFRg4
	 SrQ5lQ5CblfVzLB01zy5b3mCreEXOYridZHfTjzajjHd+jskwgmAzVmNKVZJPxmFat
	 Q+MHgkIx/k82QiiePI7+4t7OwRJvht5GU6V/z0MMAarrOUPEnuuwDL6deo3ryu/p0Q
	 7X+sI6pu+Ty+WQR6BXyc5VDLNFhaTqQEew1rdOINF1FTsVfA5oRMCtrXMFWJlO99V1
	 BIwqNUkl8JWfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26682D88F89;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872015.25915.18211935258220531017.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
References: <20240226144536.1525704-1-thierry.reding@gmail.com>
In-Reply-To: <20240226144536.1525704-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 26 Feb 2024 15:45:35 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:
> 
>   Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v6.8
    https://git.kernel.org/soc/soc/c/35edcf68a999

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


