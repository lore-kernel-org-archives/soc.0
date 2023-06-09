Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E584C87FDD
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE430C4339E; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1F2BC433B0;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=9j6zgRZ7UXn4mc0W85evs8YXJIWta+XLGZ0e3FFWcsM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cE/uqDrXvt5HdGt2YDqSorAMZONB8o2Sh1tkmiLSMmVfgE0jze9yup7oKX1ObBWiU
	 Y550DhpxX7HvyoG6pwRCgIOYnZYukb84+094eSK2ELkqRt7TyF5CKuiYeNWmBpNjZf
	 9ciFR+ctLlVHlHQJHqBu8QTKj0jopY/Qkbdr+kNmTIMAdJDrRmxtrO9SqOZf0Oqfne
	 aB9gcEEN74sNdj//sUoa+vM6EdCoDAxAELfXqn0oUnH0ebZ/L7sZHPWvBh/t6O7IEV
	 bKSZeHbnfUqEuxA9RzaRkXP8ZugWUXCg5bmdVmhdDSzq3Pdw4FHSlcy5j0/YYvNgth
	 LRCAMV99uAl5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B7922C395EC;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] samsung: drivers for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622774.816.17895969983229259218.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230602091501.15178-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  2 Jun 2023 11:14:59 +0200 you wrote:
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.5
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] samsung: drivers for v6.5
    https://git.kernel.org/soc/soc/c/acaa52bc093f
  - [GIT,PULL,2/3] ARM: dts: samsung: for v6.5
    (no matching commit)
  - [GIT,PULL,3/3] ARM: samsung: soc for v6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


