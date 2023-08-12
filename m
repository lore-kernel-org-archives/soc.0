Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9770AC04FE1
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56360C433AD; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5BCC433CD;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=5XTz0xf1F+U3vwkzPFSEPodXuDRD2F4xH18IzHV3HKI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WYYkmpCZKqn0O9+jMET8paGvU7C14apARaMFjd2DKxTR7d+ddOe84Ev2d52JBROBr
	 0ATG0/DtK56ASXaIamlmMxYxmxiojIKRfnW0F2pgEfPH+uDSBFT1H3gt0D5MfIOCW/
	 IXVmdn7vLSE6k8SDE9ALn+qFoKdyr5HKgcSo3yUaDLT+0dZ0KbLJoI1+JIVljKh3yz
	 lNC7Bsdw88MfaZwQZEtUV9tNC29Eabb1YunwM5c9Zt+0UvGNrpDUFFKvrTJhaUPZOX
	 OIV8wMRSIRuOqK5ur3Z407XDOVpaD5m33KgjDbiLgYzuIPwIvO5N4Wdr7ZgZxV5gDI
	 4uyopn6GUpLYg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D9C9E3308F;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168911.30475.10210106771979229249.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Aug 2023 17:12:48 +0200 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.6
    (no matching commit)
  - [GIT,PULL,2/3] arm64: dts: samsung: DTS for v6.6
    https://git.kernel.org/soc/soc/c/08caced488dc
  - [GIT,PULL,3/3] ARM: dts: samsung: DTS for v6.6
    https://git.kernel.org/soc/soc/c/75f79ef8b93c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


