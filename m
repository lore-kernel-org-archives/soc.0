Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0952C54E60
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B04AC43394; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84CE5C43601;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708430;
	bh=n63ljZgdjpDPtwSZMCCCCYAr+jVmy+nT/Zs7DCVWcPc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OpnSKKEgEigRZ+YpBAegYpq0lG+VyiHSuBK7AgaAGsIVMWNY5mELkqdgNup0+kItY
	 aglxD1x1IBSWmq7UpzhO/DUMPzUKZF0F5ttuF/EsgI45xqFeEJkeOE0LaX3aGaZIrG
	 he1c7yjNrJ0Rwe/0lEyYGaelIW4MmPE3q+NlZLO4JR5yipGAQSs1Avcql9xrPS4BzH
	 9ZMs7OC7XBB16JdQ7hJ+s3Nbjw3KGFKUQ+KbL0GILiia58BpcXUq9XcKMQuoT3RP4y
	 I3qBNovPkDPiL37naZgLUfV955VGeot3DqfsdJzfsyToc7Gu4hLwwmwYXo9KtTJZaR
	 IlZ7ifWnR8V5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61C25D88F83;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few Qualcomm driver fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970843039.7525.2980302709775446455.git-patchwork-notify@kernel.org>
Date: Wed, 06 Mar 2024 07:00:30 +0000
References: <20240306032120.5036-1-andersson@kernel.org>
In-Reply-To: <20240306032120.5036-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  5 Mar 2024 21:21:19 -0600 you wrote:
> The following changes since commit aa05f47474c02d38d88c32c633a551911c6fdc40:
> 
>   dt-bindings: soc: qcom: qcom,saw2: add msm8226 l2 compatible (2024-02-18 22:52:55 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.9-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few Qualcomm driver fixes for v6.9
    https://git.kernel.org/soc/soc/c/049238d24467

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


