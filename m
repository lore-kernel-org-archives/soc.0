Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8766FC433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 587E2C34604; Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40625C34606;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639581010;
	bh=6wG/WASSUf0n7GyuiV7dhEV0WksAC2uwMtzzw2WDmJc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FowPoPZ/jaL0dFoCPCGF1SUAJjoQ9GUE82Rq4vlInSxPvUMM70PKUoAvZlws1wcju
	 xm0hAtekHl2S8n4uoLHo68KZmDf41GR5w47KsAam+BzD1EmPLfyvaDdIzVg28ZBtFz
	 scdDjL4G2XSL55Spe3CQ+kqoG34bS3qBLIkb6887zP+DAlC8j5KD2JmDFmX59C/4pg
	 Ubhcp3i8OkXWjq/FiZ5MVmtd2nj7MQm3mQIPWu1aH4x/n34Y2OlSlsiR5QXS98ySrv
	 1YL7pIUWYaBKNQpkP5ORi/xlxlse0W51fi64SPK085u3aDU/j1rbopyckDDNiZ2A9o
	 dRJyn1AmLrA2A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 21EB760A7D;
	Wed, 15 Dec 2021 15:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC DT updates for 5.17, v2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163958101013.23013.4826565785529307190.git-patchwork-notify@kernel.org>
Date: Wed, 15 Dec 2021 15:10:10 +0000
References: <a24faafd-f2ae-c3a7-5327-b27da7d9e34b@marcan.st>
In-Reply-To: <a24faafd-f2ae-c3a7-5327-b27da7d9e34b@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 15 Dec 2021 23:17:58 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these additional Apple SoC DT updates for 5.17.
> 
> These mostly cover some cleanups, changes that go along with the PMGR
> pull, new compatibles & minor binding changes, and adds the watchdog
> node.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC DT updates for 5.17, v2
    https://git.kernel.org/soc/soc/c/5f424ff299ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


