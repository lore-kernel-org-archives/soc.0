Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0622C3F6B0
	for <soc@archiver.kernel.org>; Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91E8AC433B5; Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7856FC433D7;
	Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660162814;
	bh=mOO2oSOV6o1vHHC6fjdwxwZPMOsx7YqQ4XJxY1RWD0A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fs1FWd+oD3Ti1L3exnyxaN9TG9cC7gl40I+rY+3SSHjRIolJM8aj8P58VGJrRhHAy
	 k76aP/fndocwkJBkjUgQVsnWVYMmPDLKtU+jZtQNusU6v58xZIX7ufpw3Wy7MU3UDm
	 40DDgXaUMv6X3Yi8UCDudsPg6gJOwMDmZ6zGdw4z6Q28lWBa87jYDCncBz1MUR/Vg6
	 MFGuFoaqZPp2lHHZN3XIfGc3QgK8gT7skPWC1wOyYSKUXuKyPBYIHQQYIB7KZjDnXQ
	 jhIqjbCCrbCFGiI99tcDMQh5WNtzVtPytNXIqAez5yfrgELExrpqBQy0dnPXUmbQ9K
	 z76txTWXPnomA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56426C43143;
	Wed, 10 Aug 2022 20:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166016281434.21460.9070185270208127288.git-patchwork-notify@kernel.org>
Date: Wed, 10 Aug 2022 20:20:14 +0000
References: <20220810140243.2685416-1-conor.dooley@microchip.com>
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Aug 2022 15:02:42 +0100 you wrote:
> Hey Arnd,
> 
> Could you please take the following two patches via the soc tree when
> you get a chance?
> 
> The first is adding coverage for "my" dt-bindings as suggested by Mark.
> I CCed all the subsystem maintainers on a V1 a week ago & I've added
> them explicity to the patch text this time as CCs. Correct me if I am
> wrong, but I am operating on the assumption that their Acks are not
> required here. Hopefully increasing the binding coverage is non
> controversial!
> 
> [...]

Here is the summary with links:
  - [RESEND,1/2] MAINTAINERS: add PolarFire SoC dt bindings
    https://git.kernel.org/soc/soc/c/fd7cb3e4684f
  - [RESEND,2/2] MAINTAINERS: add the Polarfire SoC's i2c driver
    https://git.kernel.org/soc/soc/c/3cbd67384677

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


