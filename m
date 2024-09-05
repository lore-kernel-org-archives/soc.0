Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4094BCD5BCC
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32C82C4CEC7; Thu,  5 Sep 2024 15:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1B8C4CEC3;
	Thu,  5 Sep 2024 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550841;
	bh=gqoVEIeKllC4du3YGFG/dC59wgHqftmsx5/fzarxtrI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fzxm7nkdUObHoAqpWYiqeBawVhyRQdi9o0/df0XVA9cTodh1yyLJQV/akrSa4ARWu
	 DlN5Y0zhnWI4qkJrjNVRGf754RPU+wEwU8wRfrvnLQtHHVgAaHHP+6SxCTb4PP0C7p
	 eh26PZiUR1Ef+fRPAP//2PVxgUAimVVzWBZPcMoxww+V6Aj54era/3m3mgAOfqsNq5
	 Awc98XtwA43lWUmzqti5pkD5u+xjvHVZ2BdFzmzr2UFzph9GWK14BzIWMqbIV/NBfK
	 YGMrBSQj1VjZpv1++7+OxZSRqfjCwD7gTAOr8mXTHgz2nDiVumpXX1/lfynK8mP01d
	 nUTMvCsZGrpJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D343806651;
	Thu,  5 Sep 2024 15:40:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555084198.1737985.11012394951354493850.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:41 +0000
References: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240827121638.29707-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Aug 2024 14:16:33 +0200 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.12
    (no matching commit)
  - [GIT,PULL,2/3] arm64: dts: samsung: dt for v6.12
    (no matching commit)
  - [GIT,PULL,3/3] ARM: samsung: soc/mach for v6.12
    https://git.kernel.org/soc/soc/c/f166da5c9dcd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


