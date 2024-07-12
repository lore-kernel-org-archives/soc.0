Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687C1C3DA4B
	for <soc@archiver.kernel.org>; Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 448F5C32782; Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27EE3C4AF07;
	Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720788031;
	bh=R4CCohioFr63sZT6rkKYKZ7NvU5sWd2c6ThDaAGsZ30=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qiffFWc57HCtxmhB1uuxVCU5tqG3TXSjb+PWKl0eSX+RqknCEE/eJvg7vaaqDgB/H
	 e0eJDedbSGR+ttV/+TlyQZV8SxylWI0M4nt9OLChygprqRaDxIMbpaKIoQ0RFeqjzc
	 j/M6iRv+PgbJv22viFq2TWNqlapUDFJpJx+oXyK4xbhkXGUo8gwsbVYhlMCmTl/3pM
	 D9xLxeXZjY2/ahblMMxQou4abKt848678UhB3+YpS4173KIJELITtYWoMJiGAaGB5D
	 MgOlRaU5V4ggyd+VXZc06iFuKdyUFmexSeLv/s4mIalCFH8LFXEsl0pdgYSvO0Fa/H
	 P6HcZ05wRaPNw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 181D1C43153;
	Fri, 12 Jul 2024 12:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Update FREESCALE SOC DRIVERS and QUICC ENGINE
 LIBRARY
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172078803109.14799.13174045916286235035.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jul 2024 12:40:31 +0000
References: <b8dfd52128dfc916e9eb917c24f9b36e0b96bbd3.1720782462.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b8dfd52128dfc916e9eb917c24f9b36e0b96bbd3.1720782462.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Jul 2024 13:14:26 +0200 you wrote:
> FREESCALE SOC DRIVERS has been orphaned since
> commit eaac25d026a1 ("MAINTAINERS: Drop Li Yang as their email address
> stopped working")
> QUICC ENGINE LIBRARY has Qiang Zhao as maintainer but he hasn't
> responded for years and when Li Yang was still maintaining FREESCALE
> SOC DRIVERS he was also handling QUICC ENGINE LIBRARY directly.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Update FREESCALE SOC DRIVERS and QUICC ENGINE LIBRARY
    https://git.kernel.org/soc/soc/c/6fba5cbd323e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


