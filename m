Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB0C4167B
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C513C433CA; Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4755AC433C8;
	Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702588339;
	bh=NqqKRJ8tgRDFWyTFwOinLD4XXFbOP33tczO8cyesRVo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PziNQ0IFiqFrkR6jVLm3JNeozwOiLdqzOzvEASlKaFQqnUN+sN2PW49AdzCbzof6t
	 y8gYrJ3Ii0NrjxXwhJ23KYfKm6nOaBPNQn4AzXFtyF7opZmXznKr+WyC6/LEK7fuRI
	 QkyMiWZkEqPHiFDo7yzC+POriLBSm+V+R7qC/BPz6evdFiO/2HnUWplhOkWV6qgcs9
	 Pr4ZVF1FlXrMlp8FeKrzDi7QwpoWakZ2lx5aLel9jLRLkXJg+26rEy4IC9DUNQAMlI
	 GUq3V+OvOb37wqmnxcHoOfXJu+JDyC0gEp+aC4S4Uv5DhkQQEf1DSauaAYxtafTBjL
	 RD23AaAHNO9Mg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33330DD4EFD;
	Thu, 14 Dec 2023 21:12:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170258833920.10180.7471646148135165370.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 21:12:19 +0000
References: <20231213152606.231044-1-p.zabel@pengutronix.de>
In-Reply-To: <20231213152606.231044-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Dec 2023 16:26:06 +0100 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.7
    https://git.kernel.org/soc/soc/c/d73ad797c83b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


