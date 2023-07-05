Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52D2C0015E
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 778B3C4339A; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D8F8C433D9;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=L2+kyYt83uLVMgkvNYcfI7/UOKclRiVNYUWYbRlYMDc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HgiyjOmW8wjlEjDGX8zqTEZQuvIUrHecPpVR+4N37VVzrqf3CxxZzxFWLf8VjrBbj
	 5XPTZbWkQfYrljU49o3qZ7VqMMv/LZmpCVVFBUPlxaSQD/2CHmC+kwUaS/fOzQBXZR
	 q+4YUrvNU91mkLJ/12RrxdQBYSRaiUpVPftg3xkffNgNOVGJj+d+lZy81/4dj8at1V
	 VDXqOUdLTZUvEDRXveAdfmAMqdyQWDcTof9wB+zRF+y4zrXVl52u5/84+pZRu5ybVD
	 kkHUEihfsn+ry9CXjjVhyQJUYHxUO8+iDRbj/Bk/YB7G/8vTAY4L/6deCkpEipB0S7
	 vW/HDCzp0KlWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3774EC561EE;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972422.10612.1710967993948363831.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230628-left-attractor-94b7bd5fbb83@wendy>
In-Reply-To: <20230628-left-attractor-94b7bd5fbb83@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Jun 2023 08:12:30 +0100 you wrote:
> Randy reported build errors in linux-next where XIP_KERNEL was enabled.
> ARCH_THEAD requires alternatives to support the non-standard ISA
> extensions used by the THEAD cores, which are mutually exclusive with
> XIP kernels. Clone the dependency list from the Allwinner entry, since
> Allwinner's D1 uses T-Head cores with the same non-standard extensions.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Link: https://lore.kernel.org/all/ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org/
> Fixes: da47ce003963 ("riscv: Add the T-HEAD SoC family Kconfig option")
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
    https://git.kernel.org/soc/soc/c/2fa4139f3e48

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


