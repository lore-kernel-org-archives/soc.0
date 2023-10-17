Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0AAC46CA1
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01E7DC433B6; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFDCBC433C7;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=wBEApliyjALzZ2Zg2TqLd7Iq4C6SOFHZcjea4LrwHm8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DgEiod62aHYOs3Nqvm7Lgu1Nmgen8bNdJNssOM364tP0Hu3uDEdb4Bxq5Mrd2RdTf
	 CJ/0oE71JFkBL0H+h/hVo6Y4gji9XzdfizlnD5ziyXgLDjkhf6EfyxjAgO+LOC55y9
	 Gq9O6UIeYA+DcicKdlml7My1tgjIMDMxXu7k98kYEznooOTDdeRMcsqaJzIc5SZKA3
	 1cFF/7Xz3FcbEhlIxws9zBSCMWaWMPd18Y058FnaZVmEiAkqKd8HcHIBmrOVyXbXFJ
	 3m/nelvH/HwzxMoXT8/IC4a1oleEvB/1dzi3PmPdbp4xRlpI3KWr1fWaDvP9+6VLwo
	 s9DzwtW42LRiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6AFCC73FE1;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002781.24805.3719804657800907477.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <20231015201812.855218-1-andersson@kernel.org>
In-Reply-To: <20231015201812.855218-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 15 Oct 2023 13:18:12 -0700 you wrote:
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:
> 
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.7
    https://git.kernel.org/soc/soc/c/d9195144e7ff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


