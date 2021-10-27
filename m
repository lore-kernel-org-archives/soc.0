Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B42CC433EF
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 07:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E2D6D610A4; Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CA91C6109E;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635319807;
	bh=a5Iwlp/2ssucpzjpwFcPSwrCNqZtSYGrc1L6sC5eivk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qgAKVUK73Y2X6351g0B2HE3Tb/oCg4ISpiXMw0zKTDQKkWNihU3RRtSBRPTqzXggw
	 oMNzfxQkuopMGuGrDKqWt8BTSTasXSQfGTPZiQA0Bpq+eF4QtGN0vDXfkeKBbeyRJ9
	 GmH3HAMHogqtvesagWVsf7We8Om7ROcqtZdyVNV7Ok/tcpcQnCNHm61ekf5H/txIVa
	 mneiMb/R6pSkFDzFB5naJid3iO1FI+GyrMZs9lU7rEoNy4Cv5rBxelfho7GETpFefv
	 Ih2I17ylZroXG3UhY/4iYO2XT85qSIqMEaE+Q9Z67LTAZxmEX3JcHQ1XMmBHioRBcN
	 xhFg8ZpB/a1mA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BF8A0609B4;
	Wed, 27 Oct 2021 07:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for 5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163531980777.3831.9989061471318260026.git-patchwork-notify@kernel.org>
Date: Wed, 27 Oct 2021 07:30:07 +0000
References: <748d5e4d-9ea6-cf50-cce4-7a7e9267c76b@marcan.st>
In-Reply-To: <748d5e4d-9ea6-cf50-cce4-7a7e9267c76b@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Oct 2021 11:50:58 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these Apple SoC MAINTAINERS changes for 5.16.
> 
> I expect one merge conflict when this goes upstream, as the PCIe binding
> MAINTAINERS change went in via the DT tree (a3b539fedc0 in dt/next), but
> hopefully nothing else.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC MAINTAINERS updates for 5.16
    https://git.kernel.org/soc/soc/c/27c81d4f08e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


