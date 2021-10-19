Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CD4C433FE
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 22:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3B7D60FDA; Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8752361156;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634682014;
	bh=/++ciIvv8DOsp2jKbgAAT7QbF2UqWA+tlRYjQugD9Y4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Sqx7W5qWXEIH5+TQkyJ0YqWCC8nMkraGS1rsAOsq3fR9sJV/OswUn1AbwYRjcC6eh
	 drGUublpw30qjG+NRuBNzxFjHhqaKjch5rP5xh4f5YFx+M5qRz588u/voIE/ALpP4B
	 3mt4fE8UsP9pjjZQsOGfrCV4fWqmdMpu/u3j7y+1GJpq2oCdApfZ9P05vqW1lEQZNu
	 qKBEFVsmu5cpEpSy6jUJHEPXSulyiVzFfHVMvlENJWKVQDncD77QUDl7ZiJAJE3uJR
	 iaUYHViCKAQcZIFxgY5Asqk3yDdfFGrocPAWNNORnxlZeKaJhvpN4bBwBMxixq68aE
	 mrvSXuz5sEYjw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 76A39609D8;
	Tue, 19 Oct 2021 22:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas ARM DT updates for v5.16 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163468201448.1188.3374883404187429930.git-patchwork-notify@kernel.org>
Date: Tue, 19 Oct 2021 22:20:14 +0000
References: <cover.1634298094.git.geert+renesas@glider.be>
In-Reply-To: <cover.1634298094.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Oct 2021 13:44:30 +0200 you wrote:
> Hi soc folks,
> 
> The following changes since commit 732e8ee0351c59ded4d88106437a7ad1cff4cb83:
> 
>   arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets (2021-09-28 09:59:26 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas ARM DT updates for v5.16 (take two)
    https://git.kernel.org/soc/soc/c/f97ee3e963b3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


