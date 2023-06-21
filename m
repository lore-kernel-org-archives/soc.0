Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C68C3DA41
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF853C433A9; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B30B8C4339A;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=oc3PtPDjEogxr+veRDEmHenILm4UIkK3bxsn4MhRRcU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZWzqlRjP4O6XYI3A4BMKVFWIBrUm1RZnNTNciymHXl0h3wTQCR+EMJue3NSv6+bT9
	 iBTsTWva6QQayJ9nnA0F5zqo8yovqxMWnq8ntMXTsB1PqyjMgOA8FWftsSPyIXefrX
	 wpxKCk8aRaOem3pIKllXbFH6zi7dUuuxxdljo5S/34W2aoT8mb2TJleftZLzi81d5N
	 X+pU0GDpdbaDtrI2asPQVCJ61YGCBVqBB0Y2/ltFndDMsHbpKjDpqey70Uo6323ha8
	 a9XuUMu52NCgIyN35hI918jwL1Cl3bG5AYSk3KTEWZqtgkVwz4q7H/5QQvGN9pdrJk
	 vH4ehJoW8Qzkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9EA7BC395C7;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm ARM64 defconfig updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943664.9834.7078316484822313232.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <20230615154119.1460952-1-andersson@kernel.org>
In-Reply-To: <20230615154119.1460952-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 08:41:19 -0700 you wrote:
> The following changes since commit 3098f34977480c9aa75cf328501f1b47ec49fec7:
> 
>   arm64: defconfig: Enable ipq6018 apss clock and PLL controller (2023-05-26 12:17:08 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.5-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm ARM64 defconfig updates for v6.5
    https://git.kernel.org/soc/soc/c/c0ab597fa206

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


