Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABED5C47074
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D2EEC4167E; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62112C433BB;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=AI97+cTCFtBrCSDMvf2bN/moWMfsgvtbDg1xD4iBEtI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h8WOqIxgfz6VJxVDDHrGbJKidKUNdFCuqbtepHCEQ1Af2gjwAGNyr5tbAaaL/xkuY
	 +Nz/hFp4Na+FWauUo1QdsqoATdqt5tTtncTTN3xLwc5P2jQp+vUTkVRqqKwrXyi/ln
	 j5edMPWlv4xP8gO73e3ItK2hQX36u5PtLJeSU4JNMF7FcqQ84vSdz5+fxqKc+NREdz
	 gRXnrkTyBV/+I6xLOqa8A0q+eNrTIxYzrHQTwTuDaq93rDSDvr2KGGH4DEoaLLmkby
	 8Z06ZNCNVVqWwzngD+zAi5YztJx7pvuQIf4eBC0iSBgc72PKg9V2UvZxcPa2QL91W5
	 K2tGug75pUb/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 398B3DD4EFA;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646723.10550.5301299025773784616.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231219043307.732781-1-andersson@kernel.org>
In-Reply-To: <20231219043307.732781-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 20:33:06 -0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.8
    https://git.kernel.org/soc/soc/c/81f5afc68bfa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


