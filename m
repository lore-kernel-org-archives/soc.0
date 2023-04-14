Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0098C77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5728C433A0; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0015C4339B;
	Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681473619;
	bh=PU+Gg6LL2FN1mDq4kXHgCxezYDQc65Dfs3thUOGJVJk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OZkEHaIGKg+m8OM1C0D+8czjqji7l/LZ3q2B2CmlQ2Yk1+fKzseO2C+EYLZjsG8us
	 6Q/51zjOAUZapzyp9fZNZIIdqiJ944oCZsqhh9CkzKLU5Jenu9nsKlfl4PTki1o9ib
	 nTRro511oG7CjfQQYqBrH3yXjporM6bf6Gger464faAJIcfrVefI/q4xOlcaNhOGu8
	 GaDcvvzew6g7rU7CzyAq/TePaO0fVG/NS8s8KlfVUJCjY2y5vHFBMVRHWeE0ELiDnW
	 BG2nXqP/cpDriIxfkOykhCfpg2KStVBE0Wy/y4+zZkO7QlRsk71vqhObW5V3yjo+TK
	 ixzMCHSLmRLPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7FC08E21EDE;
	Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm ARM64 DeviceTree fixes for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147361951.16823.871491518193168196.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 12:00:19 +0000
References: <20230410153850.4752-1-andersson@kernel.org>
In-Reply-To: <20230410153850.4752-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Apr 2023 08:38:50 -0700 you wrote:
> The following changes since commit 07b0883e1f09416d07d25a2158f8cd35b732b686:
> 
>   arm64: dts: qcom: sc8280xp-x13s: mark bob regulator as always-on (2023-03-22 07:44:01 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm ARM64 DeviceTree fixes for 6.3
    https://git.kernel.org/soc/soc/c/d75eecc3d170

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


