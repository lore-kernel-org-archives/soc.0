Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1889C77B6C
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F760C433A7; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56924C433A1;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=v1+R0MU+1zAZfn7LQ/95k/5hz8V36PFFLZbxGhHoWxw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oJQmHy+NDYHSVMjGOiOGunoLNKhu91mY5LsOn6L8aJL6WVn13DLI9FK7YpCM2PWup
	 rWlwG0yVnblm5ug3UduqUXTUbt/AT5rwGT6ettWf5NcOiZazPuqJvifzPMzkJoFnXQ
	 zsEKKmUYRnoTCGOFR07Tc5I0WaqkJSC0XAImQI2XyI4ZqM1CF2HcR0TON4rAwiHwxP
	 XC/Me9f8VwUKl32x7JSi17OgVKbtkkX6dpspZ/qDr+d76AK5z9uDGxIi1HqWsqhVAL
	 cLiL9JmCj0dmf5TUjzrq8yJtaPvi6gdREG9O2sd6PJUFMShmVHGe8678PTqVbbRzPG
	 tQ/NWlg9QXe+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 27AC7E55B3C;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 Devicetree fixes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082214.24696.4423866210494473407.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230323141922.1085875-1-andersson@kernel.org>
In-Reply-To: <20230323141922.1085875-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Mar 2023 07:19:22 -0700 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-dts-fixes-for-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 Devicetree fixes for v6.3
    https://git.kernel.org/soc/soc/c/7158e61c6cc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


