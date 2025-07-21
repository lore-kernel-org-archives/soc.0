Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A3DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111900; cv=none; b=R5wAppibZZsSfGC+2s79eQp6UbJHuqNzVqe4/jWuJPqUPK6+7uKqwxnIf/Jf394yXLeHHBZZHh3cUhEtc52C6ngxIATddvjtTnkTOKxrdYRjWDTBYgbhrdWIInXcCLMgmnTJ9Cyk+SqTtSC6BMIn6dr94dT5PO+8SoVg/f7jLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111900; c=relaxed/simple;
	bh=cHxTgfV+tBhQnUIPXi/6wj4swmtjfxGC3fP7maRxsck=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=URjI0dmQUOmkKtfQgxTZYTUK6E7ggLDRVC8eS737WWy84slvXp5QhcjZKIhoDYEr+PhVlI110gDzuWwXGLHAHS4dweghkoGOFEN9OTUvQ6/Sdj4meDNhdcVNNheZmz9WifLri7khZnBAkc+qz5yBQssc3GxEcgYb7rIri/j1KKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4bEY/DT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4bEY/DT"
Received: by smtp.kernel.org (Postfix)
	id B946BC4CEF6; Mon, 21 Jul 2025 15:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBB5C4CEED;
	Mon, 21 Jul 2025 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111899;
	bh=cHxTgfV+tBhQnUIPXi/6wj4swmtjfxGC3fP7maRxsck=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o4bEY/DTzr+rv7mrVSwx0yjgVkA5pB5XSQenKxTRbNWfFo33f3w0MPgcFyp6iYS4p
	 LzCozXyUC+GlS3UN0PlKxxe4KH98dOqPhJrgiCLlxZiDTan+GpPvAsI87N2OXLMjBV
	 cw0uiIB71ocqec+d9UKrSykwPz7/BER1V3vOZlMl/3SawGmjCxzdMv1KRuIeyFkxb1
	 +Yb0UuVtg4p5VkJ78kmhGLm87YTbALiO2WOSQFLUbnuOUBUMuRWDBXkbRo44N+fQJ3
	 WN3JqoybcwkchySptw0SGU9Q98cXZZER3be2OgV85HvuGPB+66QTus8V8shMHDbD0Y
	 lHnUZgKETFf5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0E5383B266;
	Mon, 21 Jul 2025 15:31:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v11 0/9] arm64: Introduce CIX P1 (SKY1) SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311191832.94241.4711119632260392724.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:31:58 +0000
References: <20250721144500.302202-1-peter.chen@cixtech.com>
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Jul 2025 22:44:51 +0800 you wrote:
> Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
> Orion O6 is the Arm V9 Motherboard built by Radxa. You could find brief
> introduction for SoC and related boards at:
> https://radxa.com/products/orion/o6#overview
> 
> Currently, to run upstream kernel at Orion O6 board, you need to
> use BIOS released by Radxa, and add "clk_ignore_unused=1" at bootargs.
> https://docs.radxa.com/en/orion/o6/bios/install-bios
> 
> [...]

Here is the summary with links:
  - [v11,1/9] dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
    https://git.kernel.org/soc/soc/c/960dda6eca2b
  - [v11,2/9] dt-bindings: arm: add CIX P1 (SKY1) SoC
    https://git.kernel.org/soc/soc/c/69563d502c5a
  - [v11,3/9] arm64: Kconfig: add ARCH_CIX for cix silicons
    https://git.kernel.org/soc/soc/c/aa4bc2850e67
  - [v11,4/9] dt-bindings: mailbox: add cix,sky1-mbox
    https://git.kernel.org/soc/soc/c/621d7d081d18
  - [v11,5/9] mailbox: add CIX mailbox driver
    https://git.kernel.org/soc/soc/c/fe2aa2361ddb
  - [v11,6/9] arm64: defconfig: Enable CIX SoC
    https://git.kernel.org/soc/soc/c/4cd122a4f642
  - [v11,7/9] dt-bindings: clock: cix: Add CIX sky1 scmi clock id
    https://git.kernel.org/soc/soc/c/2b752ae0231f
  - [v11,8/9] arm64: dts: cix: Add sky1 base dts initial support
    https://git.kernel.org/soc/soc/c/80be23bb20ea
  - [v11,9/9] MAINTAINERS: Add CIX SoC maintainer entry
    https://git.kernel.org/soc/soc/c/46f89a0d1543

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


