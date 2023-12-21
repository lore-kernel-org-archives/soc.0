Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD7EC47DB1
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B11C0C116D2; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B39CC116C8;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=NSfHc+8KDPxQDkgFC6BVEHr2ZiWGtu0dRi4Sdthamgg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jqwW208yTrq9CrApxpiOxg1ByvuMY2rMzRTsxeDKLdrSCaOS4zu7YyIVzEIOqwt5P
	 HXHiXEBAGr6FtCEiNocOHDheKM06Cagxgu9qx77v9QcQIP01i2pM+ViqGQa1FFFf53
	 OAOveuBTC6z7ks3YQ4M0UDLE12NhBc8B/S5qdTru6Imogy3ZbZZTv3Ul6me12+YeiY
	 w8avAbqg7gRbSRSaeS/YLVrwAYscnCz3zQSGhQ4IvJrni74GEFW1ALjex+oLyHH2ZA
	 0r6yS2LezctIAFp1T+ddrYtFSGN5aNvpcElF3/vJsRDs+Cr9Lv+RPN1o3nYIkN0EQR
	 K8dQvIrAblRsw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87B75DD4F0A;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM32 DeviceTree updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046655.3302.17462088983794564818.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231219042914.732684-1-andersson@kernel.org>
In-Reply-To: <20231219042914.732684-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Dec 2023 20:29:12 -0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM32 DeviceTree updates for v6.8
    https://git.kernel.org/soc/soc/c/73ec27206059

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


