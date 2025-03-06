Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26E2148FF5
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275687; cv=none; b=hOCSM6KMcNjFQm6YjhCiyoueUKFgiyK6F0Box2LE97NOsYwqRmvmktM69KP1fxI54azj/BUq1RKxZO23Mr/VsC90WoVlvO9njNZktHLSkAIIH5XR2nKq1bK3b4OyEmd2tt5kaSe6zxCy9+Lc+I2zi4MthrLlCcMWF+a3ppxfgis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275687; c=relaxed/simple;
	bh=NFSdNRlRXpFbrZyVQJV/lDWfcp6x7QKUKGrb75ObD8w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K+LErUa/FGCuuF8JfSeB+UON/UwKse2g794amiFVtmCusLR1iLZam0rNZq+Y4Bg7u0mH2FwMdGKxdfCBVhW7BoLgGDuqblYn9hradtUPMNPs54ky2ijD2uWaKWmm6E2+qkjm5yQlTtP6IDMKqi3NXQ+uH2BsjEBe/WlFJdZ28e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EstAl0p7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EstAl0p7"
Received: by smtp.kernel.org (Postfix)
	id 84011C4CEE9; Thu,  6 Mar 2025 15:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D00BC4CEE4;
	Thu,  6 Mar 2025 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741275686;
	bh=NFSdNRlRXpFbrZyVQJV/lDWfcp6x7QKUKGrb75ObD8w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EstAl0p7zVEl2kJVu9vbmzXutgG/EqadHXbZd6+lVsI6NAq5qqcZV5jhLg9HU60UD
	 SnJXhaYp23tUh8p6g4RM/PMtIP5o5DOKsa4kxXS6jnpomoWSH1PTl2C/aKM45RDcy1
	 WB65ouojEH3UojTtbS5SPFf96+rY28Dd5Vt7LeeRtd4yZgeulZOATgBXM1KYi8vyKg
	 2VEHVdLQkNZNGNZ59YcrBbTndqNxhWbqy558jkPpdzEJJEnFJ1wEZsX4GUMm8Tkexc
	 +DdFCa9xxRbhS6TRcXE4WlHT5LPXVnByMYa6zBUzSck/5l/T+L+xnTA0Unv3eOPX4B
	 X519p2e/xuLhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE9F380CEE6;
	Thu,  6 Mar 2025 15:42:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127571951.1636926.9757148928978085469.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 15:41:59 +0000
References: <20250205121151.289535-1-arnd@kernel.org>
In-Reply-To: <20250205121151.289535-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Feb 2025 13:11:33 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:
> 
> arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
> irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'
> 
> [...]

Here is the summary with links:
  - ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
    https://git.kernel.org/soc/soc/c/98f3ab18a0a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


