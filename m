Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ED1C48260
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 46B9BC43399; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 314D2C433C7;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205098;
	bh=WBSEm2Zyaj4luaF83SvUwOSMZzneFzlPqk/DCnvm+qk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=s2Ef4gayq1LoAsGuxCwpLBdvy8t/4RZHk1l+uvc6ZYlDQ6deUbDnmAxuuszjfYIbE
	 7rsTgwdZ9Ckwo0PeyP91vnozAGeKJjTdyb9U+Ke/PSvCwU/f726BmAik5oeOXpwC0n
	 xtWRsbue9bwTTw+t0YStcZ3oNf0hqiIAzQ1p7zoqGWpnkGHaJDjSnz1PIvgMkuFios
	 fyjWFsF9sRR6oBcch2HeVgXipkKJm5527X2w599c0YZW8QIf3NSxvkHS4pvLuYl2yI
	 +//hXWdH5XkN+fzwRR+xr0CpL8Q9oXCKJ358Y4Oqldi7FCm3JRPgKPq/YERs23YfnQ
	 YjYpy6lYGxofg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13175D8C961;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL fixes] ARM: samsung: dts: fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170620509807.10279.13155995123998719088.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 17:51:38 +0000
References: <20240125082400.163935-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125082400.163935-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Jan 2024 09:24:00 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,fixes] ARM: samsung: dts: fixes for v6.8
    https://git.kernel.org/soc/soc/c/0d1d824a4ac1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


