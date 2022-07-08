Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EBCCA47B
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9884FC341C8; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80259C341CB;
	Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266613;
	bh=Qk+4cEkW5oIi6n+JIn2dUVfS5SX8QXmwmPpEH67wfCI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=P89utB9Jp1HQTn8LEqgLYcSQtfJq4AXs3qcfSbzzFnmQReKLterRsrwOGgF+I6CsP
	 WdZjUZJ7sCyUo9X6H2O2aOWx1FBmvUmmP7bf9ENSpU3g5KGpdTxL4BTyf86dseFeGT
	 7t//kTeTmXbNE60NBBMx/zijb8uRuhKGKVRaEQDSI3QZmy+IjoBvcYrxN9LcItFPsx
	 1shmqPNjve8l/IgN0BTAqXv2yM89WOWE6/c7djiZD56cH+4ib97fqApY6pN23A7IHW
	 /nJwQlKoUmPxf/uft7bs/AH8OWqXU8I5TmfQ5nors6+/dmXEyKqWznTFYdpimbiL2R
	 oaUv+7NYhyFTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C391E45BDB;
	Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661337.10888.16108308275291665597.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 07:50:13 +0000
References: <20220707101344.3329314-1-p.zabel@pengutronix.de>
In-Reply-To: <20220707101344.3329314-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  7 Jul 2022 12:13:44 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v5.19
    https://git.kernel.org/soc/soc/c/a902fa8eccaf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


