Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C3740D589
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 20:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037015; cv=none; b=VbxsDA2KHxC5j/hefMAMHl2xVLvVBvxlSu6kI3+A/xlx5u6GQk73C8ln+jNgj1P8eNdWQRrQ7N3PyyJ3yGRP9uSHRWQZkv/9W91AN8qy79+rHH7XjrW7k84AIqBmKRfvUGFj0esZuQXgfbSALOzPtDuQRyOc1vLUPA3uR9934to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037015; c=relaxed/simple;
	bh=bWjkpt9shOUeK7c4hwNhf5FI9aCzpfWkMy265+atabc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DchcTLEDQBj3XUHEWn3gHpAUGQ/+BuXnXU2/fDVNc+BwyXbrAhw458WXPOgRxaHxHJyghGMnVllcF0ibP/tSF4FtNT++O8tqOCh0BovPHPkXE79ZzuRhOD3N4pDJ9CR9LokHuLi+zc9wBifpZnHAkuZorb+YCrfv3Z+kQmF3PvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqeXVJuz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqeXVJuz"
Received: by smtp.kernel.org (Postfix)
	id EBBD91F00898; Tue,  9 Jun 2026 20:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B0D1F00893;
	Tue,  9 Jun 2026 20:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781037013;
	bh=YDY5U+gm1dZDUN1uIh7d4UZVPFawTbu28Pog365Bujo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=jqeXVJuzVTMMXCu0wY8gIxvdqRysLrlpHCuRkTVYYjfgkWVrbZSGo2h3sMx6mNJHs
	 qkgkA6fy81t9x6HbCWH52GZkRTsmipVpjxiCyNclCl5/WS3jDYniv2p5w8ctBUGEcB
	 pgcNCJUe39CgF+khhoI6McfTULB1F0xKxk0Bj+0rdPQRXr43OM5R4gVxt7qvrT71rf
	 HsllX3xvvpftvbxN/E65K0srPQr2+CK45azzbDhxPFEPu3wn08Jt9kUWrcYWXWTD+q
	 +QyfsUTeSwnpj/GaH+uAWvoj0J7MG3kLu+CJAqKc61+nGzDD4TKz5rk8e3OcSwEQV/
	 1oo5nXF+h4PTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568733930A09;
	Tue,  9 Jun 2026 20:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 0/4] Introduce ASPEED AST27xx BMC SoC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178103701187.2631762.10360100169430529303.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 20:30:11 +0000
References: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
In-Reply-To: <20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 9 Jun 2026 10:47:17 +0800 you wrote:
> This introduces initial support for the Aspeed AST27xx SoC and the AST2700
> Evaluation Board (EVB) to the Linux kernel. The AST27xx is the 8th
> generation Baseboard Management Controller (BMC) SoC from Aspeed,
> featuring improved performance, enhanced security, and expanded I/O
> capabilities compared to previous generations.
> 
> AST27xx SOC Family
>  - https://www.aspeedtech.com/server_ast2700/
>  - https://www.aspeedtech.com/server_ast2720/
>  - https://www.aspeedtech.com/server_ast2750/
> 
> [...]

Here is the summary with links:
  - [v9,1/4] dt-bindings: arm: aspeed: Add AST2700 board compatible
    (no matching commit)
  - [v9,2/4] arm64: Kconfig: Add ASPEED SoC family Kconfig support
    (no matching commit)
  - [v9,3/4] arm64: dts: aspeed: Add initial AST27xx SoC device tree
    (no matching commit)
  - [v9,4/4] arm64: configs: Update defconfig for AST2700 platform support
    https://git.kernel.org/soc/soc/c/512cef2af615

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


