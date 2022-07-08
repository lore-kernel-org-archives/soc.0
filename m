Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FA7CCA486
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1022AC341D3; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEE32C341CA;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266615;
	bh=8854Cta5yY2PHcNSnEQWmHZD4dpSIzsJlCyPudKwp0U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iwQIF3sQ2msh0vEIzR3E/n6W+qRMoRGsBXeLBh/XFmC9hxwqUJByeibEgXPAnyw9C
	 kuutXaGENFqkISFq2wxOyKDgz3or1Hytjko4Es8eok/qdrI4uCfvMPY67zSE+DG/g3
	 lWa8x86GBvHVhDERIZRW/w+jqqIkG+0BFbaieucSGMLQT5xsGE8pZbdhrOqgIdNZ2I
	 IMoHJgY+yeM1cUWEButFLys//tNMV5t4RhvESnpUViOk+6ioBAqg0EFTwGgNeBMHth
	 0XE8QbXLNxWs6AkGrEx02WkF/QELrZU80fm6RAMOjs7HiHb1XBVIDVBRUDbC2xCKyU
	 jqTzv6dMfr+cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7A38E45BE1;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661487.10888.6544398057265096799.git-patchwork-notify@kernel.org>
Date: Fri, 08 Jul 2022 07:50:14 +0000
References: <452e8c68-b63b-f4f6-a937-67f65c64a8a0@monstr.eu>
In-Reply-To: <452e8c68-b63b-f4f6-a937-67f65c64a8a0@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Jul 2022 16:30:15 +0200 you wrote:
> Hi,
> 
> please pull these DT patches to your tree. The part of pull request are also 3
> patches which targets zynq gpio DT binding. All of them are reviewed by Linus or
> Rob or both.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.20
    https://git.kernel.org/soc/soc/c/d67fe5e3b2ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


