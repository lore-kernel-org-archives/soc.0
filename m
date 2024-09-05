Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE99CD5BC9
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAABCC4CEC7; Thu,  5 Sep 2024 15:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3FFC4CEC3;
	Thu,  5 Sep 2024 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550832;
	bh=BI/iuNsC0u1h3dw6gtaSzCznC/W/FUOY6bP48dawcwE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sWMW11n+X7FR4sCCHaUwHdhUPf4mLdQFsmtgBR0bcLYRRlbRzN7qanpKoAtcuNG+K
	 VnrEr3buE8vbsGlKeaX8jFAThdvw79J5lj4IYN/KOn82wmxWFY/tiF32XrrTL9mN08
	 17e+X46ewBEkG6JB5a3h5B5RVbPX+odoPx+7WsdmUaHz2JjH50pzOkw37R6D2WCF+P
	 nkrkIwHq3/5tjd4bToAKcDVsNs1BYNmM1UV7PW0rFC8gszniNo2dJiB3H+nF3OdOzB
	 upA63Vg2avhEpPbqST3Gu+vHQEJIWK9PtAB3XkSEYzUVkoXBAwuEHq6Ja7zH/2ZNkH
	 nMXYzYnCEiznw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDA23806651;
	Thu,  5 Sep 2024 15:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] arm64: dts: nuvoton: Add pinctrl and gpio nodes for
 MA35D1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555083349.1737985.10711374540145679189.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:33 +0000
References: <20240819035647.306-1-ychuang570808@gmail.com>
In-Reply-To: <20240819035647.306-1-ychuang570808@gmail.com>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Aug 2024 03:56:44 +0000 you wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> This patch series adds pinctrl and gpio nodes to the device tree of
> the Nuvoton MA35D1 SoC. Additionally, it includes pin configuration
> for UART nodes now that the pinctrl node is available.
> 
> Jacky Huang (3):
>   arm64: dts: nuvoton: Add syscon to the system-management node
>   arm64: dts: nuvoton: ma35d1: Add pinctrl and gpio nodes
>   arm64: dts: nuvoton: ma35d1: Add uart pinctrl settings
> 
> [...]

Here is the summary with links:
  - [1/3] arm64: dts: nuvoton: Add syscon to the system-management node
    https://git.kernel.org/soc/soc/c/a957af089616
  - [2/3] arm64: dts: nuvoton: ma35d1: Add pinctrl and gpio nodes
    https://git.kernel.org/soc/soc/c/0dfa542df942
  - [3/3] arm64: dts: nuvoton: ma35d1: Add uart pinctrl settings
    https://git.kernel.org/soc/soc/c/82d7cf56551a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


