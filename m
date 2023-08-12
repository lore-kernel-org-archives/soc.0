Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA24FC04A94
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5108C4339A; Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F66EC433CB;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691835627;
	bh=ipYRpBV5pw8E8HIboZDwyEOd36zcsPPkAQHthTNDCPA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ju+OtTveBYEvRP1XrnwOR4U1YGfYjBsy8RragaVzpsqrD38/rmiQiF9TCftnueUD5
	 O3kSMWxA4OK1xLEGenLhK3wiGmJ8KteMCaeBBh6ihpTZR39gWK0tAOG71hsLCBLoZ2
	 W0qRJutNwTWsKlJ3KnhFP6LsW6ndDh1ht/RErQiICKJs4UEV4NW4izNY5KUpiswFEI
	 5H+YPUtJCp9byQhaayBNLM13sgCbQ/tJBW4kiUXKYHpKi8HuKkcF3L0KbZlRWtnDav
	 YX7GmyLkE7a7asJgbbkkE6XW+7ESaKB4ZB2itFoa5BkFM5zT5Y0lYpuo0P4U8S2cRz
	 0Afz9NRxWuUrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79237E3308E;
	Sat, 12 Aug 2023 10:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic Drivers updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183562749.32343.5426892758439843331.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 10:20:27 +0000
References: <77e328b5-0d47-36e8-f62d-c745df06fb87@linaro.org>
In-Reply-To: <77e328b5-0d47-36e8-f62d-c745df06fb87@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 15:26:00 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic Drivers changeset for v6.6, including merge of genpd-v6.5-rc1-1
> in order to move the Amlogic GenPD drivers to the new directory.
> 
> The PR contains:
> - C3 Power Domains support
> - include correct DT includes from Rob
> - NULL pointer dereference fix in meson_sm
> - Merge of genpd-v6.5-rc1-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic Drivers updates for v6.6
    https://git.kernel.org/soc/soc/c/f1c047c2f7dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


