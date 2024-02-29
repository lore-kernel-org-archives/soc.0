Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F95C54E5D
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D87DEC4166D; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C21C5C43141;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=5r973gPHKfdegOojTYrVx4OANfaKsUR9LxpQsOR8CjE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tLrKeO/arI807b90sUm5gbowV+TpCA5fbhmaeVHBZCZNja4AVfByHnVCf+AM/Z5Jq
	 tYrfUe43A4M3Sgpq7EKWq/exirtKfaEnQ9MOsy3gsUfBvo14ji27Ti1IdPPDqA9oUL
	 l4TciH5cI7rjtwWg+xXJXWCNsyx0WaRMCmqwAO+dk7xH26lujKrDxRCsrh8MA9Gsp6
	 mW9PHJzUz5FXC6n6Y2Q4Ak44twm77aK/GXjW6a8cSn5OpUW8DpDYkE412ZMpj9Isj3
	 z2AbFT7MOjPHqQ65Ludr6kokbx6vRa/ypSqwsQ48mn9IvUkCqzWAfgYUMtG/Nbj16P
	 w0tQyhmC9oXaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A321CD990AA;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: various improvements for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612966.13542.4935973705652486856.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <20240218182656.32103-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240218182656.32103-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Feb 2024 19:26:56 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: various improvements for v6.9
    https://git.kernel.org/soc/soc/c/60dfd940ea9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


