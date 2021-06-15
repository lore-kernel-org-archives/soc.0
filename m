Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218ADC49EAB
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A0D2A61874; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8611A616EB;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=Kk0Uw7C25Y8IhdgheGJbEVZnBVlVGk8VAgOoN/DWCZk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=G1MgAk6nezMc1kWaKyDyquKRryYZtEdntwbdOVd3MXmf7b5BWn5A5joIUb9ZVvVUE
	 dHzoMS/+iJyvHgmFElaTK1UalAt27BefRGmYNki2/cDfkmatKUSzUdLTZrVBioYHlb
	 3nh/333nv2pvgZXUwRqCHf8hbKgZUoB9J8t0EmT15XmO8xQyW8c6JucSjCFyQAw5P8
	 W+z8oH456ab9lwTLhd4bGMsy9ZV6+YQqjo8gY5O8aus72gGX8AXGMJo6dOxBfXKfKW
	 7BcJSgAga7XYeN7aYmlF5aO+50Eu1snXubl/lrBu7jmKjOW4vr7yYsgCavvUJutzW+
	 M2lJrmZRCXDLg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7B2FD60CAA;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281350.17464.17224410848243714988.git-patchwork-notify@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
References: <20210614223712.393096-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210614223712.393096-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Mon, 14 Jun 2021 17:37:12 -0500 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm ARM64 DT updates for v5.14
    https://git.kernel.org/soc/soc/c/2e2ec371a421

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


