Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE67C4708A
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44DB5C43153; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F449C4314B;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=oCPj36hAPWvDqTDCuCPc0qhsmyu64dGUP+nwhRWBIII=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JdmiFsFXLLNLHOP3jnAPMbCDtFFKKokuAbxVPv1Vr5yTQRXkyGf5dyFrLSGqtCiuA
	 duUasD/bC/pwx1UeAgif3t3/yZGECtwOYdaVoaOE4O288hkSugmDJbn3zDGqpOQafO
	 8vtOW/kOsvJxisUNvOGuFqvmyyB9OEzaVRbw/uCPYnU9MfUbF/CvJbcp6RtslBge4S
	 RGFx5SNw2yVULSM6hCHX3uuPDHMGHBvd/D5AIKT4DjQySY3eJ60APR4uVxPA0ZYX/L
	 0ne+cleTU5x1dUjQx6KjhH3eiLyVBNKWzPUbsZ1Jx/DQjO/BJnT98fIgjj1nIS6TDm
	 DLVOKrLvBgaOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 14728E270E3;
	Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482408.7332.6382617012481290406.git-patchwork-notify@kernel.org>
Date: Wed, 23 Nov 2022 12:00:24 +0000
References: <20221122203129.1854877-1-andersson@kernel.org>
In-Reply-To: <20221122203129.1854877-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 14:31:29 -0600 you wrote:
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for 6.2
    https://git.kernel.org/soc/soc/c/5658baf2e3f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


