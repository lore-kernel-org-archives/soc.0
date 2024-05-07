Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D0AC25B7B
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFF1EC4DDEB; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99DE2C4DDE6;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=LHZWkU8Af/Wby4JcBQP8/6YVIORGfsA2q5uBuj8VtjM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ra9jZGkGNKA514XentcGsTZCVZqkSywwKGveIOzUn3RdctKEZaSqnCZ11njrNQQIk
	 XSBl5OOFyI2nZ8EFzn1ZeIdlOrJ8NczP3VjiFwmUaYLdsdUQeiJza7KuuclUqzECB0
	 BjCUdBDkHlBimInCEtOjfZAGbYLx3Uo8Ks0LmqH+lzYGMBzvIgbUozT1NRdDvG37UQ
	 URdy4oWdakI0nKWclVlpGKyrzN75soQwRIZTxsHbE8kwXITNygTFonBK5iQd9bj6aZ
	 DOG+Mmupk67KnI4f7QqlJv05/rJhLlwIAs2FvIFNNu2NfVB1bKumzZZn263+di+lKn
	 +mFku+ZKLNgiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90641C3276D;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: arm for v6.10 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483958.24942.15327636711383759083.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <87h6fcndxj.fsf@BLaptop.bootlin.com>
In-Reply-To: <87h6fcndxj.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 05 May 2024 23:31:36 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for arm for mvebu for v6.10.
> 
> Gregory
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: arm for v6.10 (#1)
    https://git.kernel.org/soc/soc/c/5a0054ba8950

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


