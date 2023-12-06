Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27144C10DC1
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 162E4C433C7; Wed,  6 Dec 2023 16:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3493C433CB;
	Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701880825;
	bh=SctZncXhy46+uUi2WgqND9Sdi8BRbGRkIevDrS8E5wk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=d/YrpNz7nx8fSbxDFMPLw6TnKULiLllmcQVKXYBq0h4TxYs6wgT8fgijiMvkacHvs
	 mgmYob3VAikAS9zzLk8GAvF8tLYXdAbsz4qlHV3HbHeL2RqWS+cs+bt8iP0w2mxrQ6
	 8NNDAEvn4KslacKlO92QulR1rZW4nxg3EvxPcs5a0spIqymyS08VdK0lNJ046YRMdH
	 mtoYzzTelFkMFqr5biTjN0yeOdAWaL3gf79ik/3v/FEg2Agmjz7E6eBkvxtCEZ8rp8
	 mezD2Dkbkhslk3+UszplFOr8F9LGxQRAoEq1kt9xeHwoMdlH1XmGG2zmGkjtyYXt0J
	 esuqimJkk1JkA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C00AFDD4EEE;
	Wed,  6 Dec 2023 16:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: change the S32G2 maintainer's email address.
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188082578.26007.3479953095345926283.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:40:25 +0000
References: <20231115234508.11510-1-clin@suse.com>
In-Reply-To: <20231115234508.11510-1-clin@suse.com>
To: Chester Lin <clin@suse.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Nov 2023 07:45:08 +0800 you wrote:
> I am leaving SUSE so the current email address <clin@suse.com> will be
> disabled soon. <chester62515@gmail.com> will be my new address for handling
> emails, patches and pull requests from upstream and communities.
> 
> Cc: Chester Lin <chester62515@gmail.com>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Andreas Färber <afaerber@suse.de>
> Cc: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Chester Lin <clin@suse.com>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: change the S32G2 maintainer's email address.
    https://git.kernel.org/soc/soc/c/94ea0ed356b4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


