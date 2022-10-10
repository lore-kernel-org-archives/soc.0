Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2799C433FE
	for <soc@archiver.kernel.org>; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCC69C43470; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6F2DC433D7;
	Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665391814;
	bh=+t78bvwmPnDYErSzkE4bP2VvDEInMmm2H8XPcpqnebE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cJiqXEbrbtbH9LgNDbSjH2FWyvWrF4Z3GLVTihKCwaTU4d0hvL2q655+LZsZCbifW
	 ZICpJtPctlBzS/Qk3ws1OAv3Wiu9d0Hxw3+R3ARud1XFdYj3yegsJjVLry8L7FKYTl
	 tyb2aehH6NP/ENjuNejdV0p/RC2ZIccpwRzbQk+2pB4yt/u12VT+gdKyTJg3NIuLq5
	 FaAGn4KlWrvDQVIlVgRKsGL7Y+/lmidZv/YOVO7SrkGvQbMS69AvFe98QlLKE24wMj
	 gAhc44nc/ZCztE9Av5c3V2W5dm9dO6mN6fXbXa1tbf6WNJp/Bgf6dvd+EVJGvDFTxV
	 6Dhljhx7gGi2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 80B49E2A05A;
	Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: spear: Move prototype to accessible header
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166539181452.8542.5893973846808897587.git-patchwork-notify@kernel.org>
Date: Mon, 10 Oct 2022 08:50:14 +0000
References: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
In-Reply-To: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Oct 2022 09:52:37 +0530 you wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/spear/spear6xx_clock.c:116:13: warning: no previous prototype for function 'spear6xx_clk_init' [-Wmissing-prototypes]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> [...]

Here is the summary with links:
  - clk: spear: Move prototype to accessible header
    https://git.kernel.org/soc/soc/c/9afd20a5a1b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


