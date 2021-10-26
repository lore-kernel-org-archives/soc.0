Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F36C433F5
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DBA4B60EBD; Tue, 26 Oct 2021 16:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C4ECA60527;
	Tue, 26 Oct 2021 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265808;
	bh=CkaH7R26nkxcXZrEJCK325YZN5ehq3pkxOWS/++pXEo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=vGbxNqo0edcYIlM2ts1nafbAchKPyeNjv3iB3PbND9DAVAJ0SmvXjA+E/veHZlzMI
	 KWWlF4guLJ8v0K0QBa2E9TqkkZnGSB9ugXFOMjce6FS1SMW0dHisNrJLK72+K6ZMyT
	 eGpaXsqN/l7ZQ9JD67xFnn0mqmMMc5aK4CYVtLkGvZ6KyCksrggVgMeU1SPf2a9/xW
	 eWZ8+mcJBI/kk0KWKcSLzMMjUshzZluwYv9wSPUjOdZcc3Nu8h65mb53wO9HQY6epU
	 BZ7KEHiraagOqX6Sjo9yWo/Qkze2xDLrEaB3YLATLyD+yJ9uSdUhVLOnVTLluSPKw+
	 bcD4aG8qO9UBA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B6AAC608FE;
	Tue, 26 Oct 2021 16:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] MAINTAINERS: Add maintainers for DHCOM i.MX6 and
 DHCOM/DHCOR STM32MP1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526580874.16112.11360212425163603945.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 16:30:08 +0000
References: <20211025073706.2794-1-cniedermaier@dh-electronics.com>
In-Reply-To: <20211025073706.2794-1-cniedermaier@dh-electronics.com>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Oct 2021 09:37:06 +0200 you wrote:
> Add maintainers for DH electronics DHCOM i.MX6
> and DHCOM/DHCOR STM32MP1 boards.
> 
> Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: kernel@dh-electronics.com
> Cc: arnd@arndb.de
> To: soc@kernel.org
> To: linux-kernel@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - [V2] MAINTAINERS: Add maintainers for DHCOM i.MX6 and DHCOM/DHCOR STM32MP1
    https://git.kernel.org/soc/soc/c/05d5da3cb11c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


