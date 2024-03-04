Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971A7C54E60
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B073C4166A; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54E96C43601;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=F9vQlmuGVLwftEhteYd5LrVGCg6g5hsDXGxUJ75HS0E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=phJH7P4uufVBX5yuUv3N7Jqwb35UTLOpDa7PmuC0hssnauiPuVDJnPvQSynRCVS77
	 isqhzeEexmlRRzXbd4/R/381vbByI1kAzcqXn6uCu4JQ2tGlfFP9EhgKI1xF224ug3
	 G9XfQaxanbcVliVhwFB0Qzr9S/ff83yBqkTiW58ngSRPPrU03BU5XIlzqSESZ0xJYm
	 ZsPtaR2gbucJk2DpS+ts19WTCJ2z5ZCT8wUQKiZvEjgKY+MX37qCpulCFMYgpqapvT
	 6eFfayYBt2+W/XvyKpRpbxWe7VG7PWGXKbcAjGSZsV71D+D1W2+P6YhWKCiCwkbk+D
	 ku5Ucw0y9PQUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2555AD88F8C;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: ti: keystone: Updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403215.23732.7260676849876704484.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 17:40:32 +0000
References: <20240304133843.e6rm5va6w4oavgoy@posted>
In-Reply-To: <20240304133843.e6rm5va6w4oavgoy@posted>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 4 Mar 2024 07:38:43 -0600 you wrote:
> Hi Arnd, SoC team,
> 
> Apologies on a extremely late PR due to unavoidable personal
> circumstances. This is very minor change, and would be nice to have in
> v6.9. If it is too late, I can carry this forward for 6.10.
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: ti: keystone: Updates for v6.9
    https://git.kernel.org/soc/soc/c/cceac3f06fb3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


