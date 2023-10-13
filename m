Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA1FCDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C89BC433CC; Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81533C433C9;
	Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230827;
	bh=aP4hgkyiualMdb0i1vMPK5Tq9Ge/cADk0PNOmxMf4T0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JKTXi1GuH8OT7bfTsqpuqYXaFBnXNucc+nEZQ71tLa0zzAKEs2UP4cpDVbeu0hb0S
	 H1V4wdi6XIFpPKyc24X+cMvwm8+uQdbUd4LmiXZJEkJaq4rsItNgUG45FstVZbgyhZ
	 +rEtNdrr099DgAduH36V+9aZvvu+vF4iLT7yMEVCM9b0sGkYSOlPf4gi5W94cUXpJq
	 KA+BJ+Yl4wGIrBMtRlpb7VhLZs8liG7zrF3RAJohhohdpJYmEWCzThH7vif5rOpUhz
	 ZJdipGI4q8BFiZM4MRBnn0Wu3J0+r+n58VLpKTx1JDZIsV2EkmQRUyDRdclxmzYLA8
	 2/AlHiMkNbtQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 664A0E1F669;
	Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] IXP4xx MAINTAINERS entries
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723082741.14185.15137098705671601259.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:27 +0000
References: <m3ttqxu4ru.fsf@t19.piap.pl>
In-Reply-To: <m3ttqxu4ru.fsf@t19.piap.pl>
To: =?utf-8?q?Krzysztof_Ha=C5=82asa_=3Ckhalasa=40piap=2Epl=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 Oct 2023 07:06:29 +0200 you wrote:
> Update MAINTAINERS entries for Intel IXP4xx SoCs.
> 
> Linus has been handling all IXP4xx stuff since 2019 or so.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Deepak Saxena <dsaxena@plexity.net>

Here is the summary with links:
  - IXP4xx MAINTAINERS entries
    https://git.kernel.org/soc/soc/c/26de14831cf6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


