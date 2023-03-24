Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E0EC7619A
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B4B2C433AC; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DC41C4339E;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=MTobqJf//fo43ZQoAK1+pVVkndaUbjra8wHVWWmSx2s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qsBFW3r0BJDr6TY+nvEtUO1lgiQfaPRLsigYygJ6jVayGebHOzKp5Qtbq2rL4nfVM
	 EqZpFUUOV68WIDJaWyKz+ZOl1C23ql393ukOBYbhAZy60o+S4uM/6ACqi1q2z8G78L
	 QVxUpPfG1b6BWFOKZ0cW5ib5FDnP+O25y/RlGrU3GWaQHzqLGnHiTErGLfOwbOQeC1
	 6yXA3fdDStQAbtMyWYL/w2AWCYlu/J+/BKoGefxe8nafSIWCRTcyZ0/GlS46yfPmWT
	 je1m2kikcVDUJ+lQK49ZCmRPxT2xtVH4OmKpaQidd3jEUAtva2XWyet3xEk3qkcaeq
	 ayYgfhxfKglSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1CEA9E55B3D;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 Devicetree fixes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082211.24696.13335030443678213503.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230323141642.1085684-1-andersson@kernel.org>
In-Reply-To: <20230323141642.1085684-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Mar 2023 07:16:42 -0700 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 Devicetree fixes for v6.3
    https://git.kernel.org/soc/soc/c/f42ee7c45764

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


