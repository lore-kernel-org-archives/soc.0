Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B53C49EAF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A830F61878; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EA6F616EC;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=Wl0pGv9J+b0jhqfbkNpwfUWnmccHH44RIta5UonTFiM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Vsq69HmLSrWeQFyi/MEoaj8CN4bPM/oVxtcxlBDX2S0e0VZmUCKmSTv5usX/sqIu+
	 eKv+FDc6DC+8Kr9LsDD5nABjSPnI2+oJ4CFAXXlJZFY6+BtszSqyfYF7x8pdbNIhGs
	 Uc4a3vAoJ+Yr7V+H7iCPG+TrN0fPqV2eCDlazr5uzC5/561kYWC+9vwx76GXzsdv4J
	 VUJ6XpN/pnKIU4fHJnn/g26Y4YMpfQUQ72ArEGyMWWEHcWG+A1iEHIh+UQDWaMGtsT
	 9DpfYLd2Kvapb3Uvk+1lXmmIDHUI64Boct+AB9iYQ7bQfXu8WDTXcVNkw/MhtLLcRt
	 qz0Jp2aDidWTg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 83BB060A6B;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 defconfig udpates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281353.17464.12103489468174844241.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210614223704.393042-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210614223704.393042-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Jun 2021 17:37:04 -0500 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 defconfig udpates for v5.14
    https://git.kernel.org/soc/soc/c/3e7e3b97484b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


