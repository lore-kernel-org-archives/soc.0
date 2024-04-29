Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FC3C25B74
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2ED92C4AF5F; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1995BC4AF50;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=nBy6mpPJ/l4RxPb+mxJ6CMif3lCJCHtJSEJq+xR2XvU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DIYkUDqr3NfJvfZrmD5fazeemz4t1kROHJM9kQ5maOrigh7N2nm4D+tBDMQvEm9j1
	 o12Us5Z4ixsCqx0Lxw995DsIdBjlxUmNe3CrI5WjbYw0dcRS2hVc20oQWDTcVn987z
	 4g3zne3I4Xd6KIF2Rr/NDmkNJp4sTToCGS1B/Oq2Tk9K/Tmq+ISpOE/aMA1AYKJqfI
	 oEgOj9b0tzZypmf6FCh2QAqrZgt3APmSY4DWrzpd/nBlhJc9EU7PGsOIK1wR3B/cWB
	 LrItfzZvBFjHccRQYJekIf9NxxXmJNKAe4XITd4DbiHbIOfn8CmK9BCvRPTlTCZ6eR
	 u9/kcH9K8eipg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06279C54BB0;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: dts for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888801.20509.7584710993345494931.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240425071856.9235-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 09:18:54 +0200 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: dts: samsung: dts for v6.10
    https://git.kernel.org/soc/soc/c/3a2fb1a95c79
  - [GIT,PULL,2/2] arm64: dts: samsung: dts for v6.10
    https://git.kernel.org/soc/soc/c/5ac40fdde32f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


