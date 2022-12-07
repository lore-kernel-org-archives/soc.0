Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBD7C6370B
	for <soc@archiver.kernel.org>; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 816A2C4314A; Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6544BC433C1;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670448029;
	bh=mmAHJhHHDyAIZsi5mHCzjmWwudYozfI0Iv+oxpZ8m9o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IxOEPBGno3zzN3ddWOXYEbU17O87d+WanABcNgUws3v3Ga3LOMGBLN72uZjGiA0n8
	 JKPKl4EJeGz+GyUN50BEgHZMwWo7OjBgR8fuuwV5UI7xawLa2Et5FcuVRej5qr9j7u
	 GfbjPYqTf8J6sTBT6N0G1gDOwSDHHPbGHKDN5tpbSaHHUZvKJNAEBk0TyzWeS4hVMc
	 pPPnMnzYgCJaUz9Ig4IXABlnJMYpueFBmzMIrWFhKMFDmWSm1v2uT5ErpGRYi1BPmP
	 xDgF3ycJdUAMXV3AeUiAUCC++p9pFFjk+ZzWivbvZFnPwJ1cvU8O8meZ1eckFncnNH
	 aSOQJxi3rxsVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29790E50D9B;
	Wed,  7 Dec 2022 21:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm DTS updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167044802916.32577.16742952549321149297.git-patchwork-notify@kernel.org>
Date: Wed, 07 Dec 2022 21:20:29 +0000
References: <20221207153201.3233015-1-andersson@kernel.org>
In-Reply-To: <20221207153201.3233015-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 Dec 2022 09:32:01 -0600 you wrote:
> The following changes since commit 37b5e8c48b9d295aca92caf0fdd3f4b85cc662bc:
> 
>   dt-bindings: arm: add xiaomi,sagit board based on msm8998 chip (2022-11-15 10:58:02 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-for-6.2-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm DTS updates for 6.2
    https://git.kernel.org/soc/soc/c/da060ab86eb0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


