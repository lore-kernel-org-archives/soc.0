Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE108C49EBE
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5F8D9613E7; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 46573613B2;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502411;
	bh=mee5Yx0qrOP4qg14Pf76h+SA29vMlBPHGVNu0gCzShc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tnMPtvOE8X10hMULnLi4Sy1tmB7I3VfzaZR+s6rDz8paXX+jP38ZYTt3tCOjM5sKp
	 ATx45pN+YsGUIVB7/T/OXGD8S9TjmtUX+Sq11V+pWQQJErsZaX9bUL2q7avyDOJlV7
	 L/NOJ6Lee9DTEwa4eViBp9R9xCFP4yhdCPJGNk+XevkMYtBUeRXvNqSdqV7Aaunwjl
	 3IMQjTOfj8tNve//uaT24CNXteh7/Du+7bWfk5N5o/LlXq9Zv5nLJSW/TGMBtM/gsa
	 HL8ap3Sxc0PalrmsOlQ/BWMJnY2788I3L8jpOXTzbT8/CLIf59Afp7XMYW8KF/mLh4
	 aSezyJLnTz+Qg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3861360ACA;
	Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Additional Qualcomm ARM64 defconfig udpate for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241122.24025.7631369527519324471.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:11 +0000
References: <20210621165015.943060-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210621165015.943060-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 21 Jun 2021 11:50:15 -0500 you wrote:
> The following changes since commit e9cd414c1136aa31d34acc04c175bfaca4662f89:
> 
>   arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Additional Qualcomm ARM64 defconfig udpate for v5.14
    https://git.kernel.org/soc/soc/c/e6adbcb7e2d7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


