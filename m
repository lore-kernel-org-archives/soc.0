Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2893EE49B1
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56E9CC43215; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 403BAC433AD;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=qXXPCFNySR0eSWbaSNxSSO7FSg8b2wpLjR1YZUQgR+s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UI+4AE9A4DEWkh7fQGkilSotn4ro2p6eQw0OV3OgMsZTzuH0DiXJDWyxqFgEIuVj5
	 nt/EcPqf7ZK3kzx31PBiq3BHbvwsBNvDjrV0ziNBvlCsLQsCLhqlK6T0OubzDIvYMx
	 TTq4u54AfrXeMjtw/uyFG8SBpBzcmo1xjhZa1Ocdy/iSO+uKAkldqs+DWz0fowYPAQ
	 o0knMaFm0sTVvfxI+0vpejILkkPp5FJscrBjUvL5hxt/jt0URtMQTbPRwGGCYlaext
	 KiNjDwe6cUA3VM2w6X5ZXmYy8mCcCfgaFh7/q+LB4LI44uCxLgCyAIUWn3J1f5QcRZ
	 N7WkfzVO/SKHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1F6D3E21EE9;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147612.32531.13926171560632855070.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <20230818023338.2484467-1-andersson@kernel.org>
In-Reply-To: <20230818023338.2484467-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Aug 2023 19:33:36 -0700 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.6
    https://git.kernel.org/soc/soc/c/9eb33ddedd70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


