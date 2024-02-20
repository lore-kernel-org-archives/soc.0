Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B301C5478D
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CDC3C43141; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 075DCC43609;
	Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463562;
	bh=Deu5uj6UsJN6dlU5AWxFupdpkAWFwRn3PFTRxoIdW6g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hGKNJH1FbZrxiIcBip+44RUOgXz9CZ4oQya3i/KYZZcWBuEhDInyrv1CQv/a+KUcT
	 UEp3uxXGo0ktWGeLwjB9LPw0+qfD7nArAUajrfLNtNhc1e2xBChemtV0kqZD3iMeQa
	 QkaAGjq43cH9Bf2S2RC1Dqh56jlT8Ka213YexujuZ7f48lj+EranSjyRAN1IbzBQ2G
	 rUcP/edESq5sVsxt4S/7jBfU3IF1STVUxGHPRc+Fvq1mgjX6f55akuvpLHAjsOTYkP
	 DoJKD5SHSdzlwdGqLij7Pr/dflKAvm9qanZegpw5gUxJLCAoH7IaF3F3+VHaiziXU3
	 ao35n60ewyi2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E35CDD990D9;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356192.4365.10116068432019556091.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Feb 2024 19:21:38 +0100 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v6.9
    https://git.kernel.org/soc/soc/c/b256c24cf876
  - [GIT,PULL,2/4] arm64: dts: samsung: exynos and google for v6.9
    (no matching commit)
  - [GIT,PULL,3/4] ARM: dts: samsung: for v6.9
    (no matching commit)
  - [GIT,PULL,4/4] ARM: samsung: soc for v6.9
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


