Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA00C433FE
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A68B561260; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EB0561245;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633640419;
	bh=MDUdyWLAqyLk5mKN5zRTJFQ4uEyEuwaEhDOERNypzNE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ICK9h8d4RU3aAdGJ4VYoWEBU6bH5OR6tJrXdE3ihE935/U4QGihM1MklKXL/iG1IQ
	 hJuR8bJORIYawE4lr960omZlW+gNlBUL4+Yxv8+hBrxscS2COEL74ouQsGNL5YCaeH
	 4aIEyvNPhIAKuTN3lAXuqEgU2EubnswqkDVKJ45oxeZZS+lE2Sjt2WYdVC7XgCzEra
	 VFXA7AGWf8UH4PeRdnCaD0A5hbiAP9HLnMnpNCCtOpWz2n/QfHkNbjC/Ifjqnj6BA3
	 ZjesRpWwE1usVqJXZEZRxuoeMwrA3mWH5Mw9g/gMJ6VNHpk/695LaynNOEqjjJAmP2
	 pk/EyT8b5/Ifg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 846B96094F;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC fixes for 5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163364041953.28878.1577423226278232009.git-patchwork-notify@kernel.org>
Date: Thu, 07 Oct 2021 21:00:19 +0000
References: <a50a9015-0e62-c451-4d0d-668233b35b85@marcan.st>
In-Reply-To: <a50a9015-0e62-c451-4d0d-668233b35b85@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Oct 2021 01:38:21 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these Apple SoC fixes for 5.15.
> 
> -Hector
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC fixes for 5.15
    https://git.kernel.org/soc/soc/c/897c2e746cc7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


