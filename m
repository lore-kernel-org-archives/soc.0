Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1B029B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023230; cv=none; b=awvwFWv1fGxKiN/vz4pNLSJb0zu2OC0b8+4lq8JfqMGWWBTarbK5qQrPjehL8JXVKqmEgsaHgXjqNTnj16MPkIiPP8WU3cZsXV7rjVhnuapr8FnE2bPd8az1w8V5y2pPv7yW6W5Ce2W6IWVGN1pXaOo4zQyNIpNIESKCG5SMDNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023230; c=relaxed/simple;
	bh=iyKvg7xP2VVWbfStREjC8ns25EMyUexP3l9TDIxjB04=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Mv006ZMT1Xt/Ej0/y8eH6WgKaqcSHbIONb14gTECJbqmr19mo5CQG66w/8M5a574f33bQQx6fK5/gzJCl4MAIjrl3JlxXJd1SIPRo1KGa9R9GwWidCdDyBOj47TH65bhLfnjHP14f+VfadgEC3pBGzJl18JtLgecWtgAml3Pz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSci58dw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSci58dw"
Received: by smtp.kernel.org (Postfix)
	id 984DD1F00899; Tue,  9 Jun 2026 16:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BA21F00893;
	Tue,  9 Jun 2026 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023229;
	bh=Zq6Y9IWFtzUcGiapCQip2Ml6pBir8AnbUvrdYWPjjvE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LSci58dwI/beeXVwHW9iF4/aJuYgwrd1G8pK+esfW7TEPgAu+/NWYZzF9ZYXiWCnA
	 FW3mbYceDbgSrcMsP/EeVVW6JDeFaV9OACVDPnVCg3Lx9qe6vl1KzMO7ren/Li0zN7
	 jmCdN5l8J+hZhPjvX6fKf/0NEEcI7U3DhM/q8d55T76/6TCbpGQmh+QD12MORBlsJQ
	 akZ9ABS2MnnmC8RxHex9jmuk72l2ECyn2IZwiqSZyV7ZNGueoWpqXL1UOVpws6ToT+
	 4Fw1rNmE7nMzUdbNEGQxQ9oLMkPtXkoyvq4xOqpwsBUPGHvUWXHOT/KFXpB3sVuW7j
	 oP2DVPEsmidKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199BE3930989;
	Tue,  9 Jun 2026 16:40:29 +0000 (UTC)
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
 <178102322764.2135346.3586982640882265725.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:27 +0000
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
    https://git.kernel.org/soc/soc/c/34efd73379ff
  - [v9,2/4] arm64: Kconfig: Add ASPEED SoC family Kconfig support
    https://git.kernel.org/soc/soc/c/df6f379eb4ac
  - [v9,3/4] arm64: dts: aspeed: Add initial AST27xx SoC device tree
    https://git.kernel.org/soc/soc/c/e77bb5dc5759
  - [v9,4/4] arm64: configs: Update defconfig for AST2700 platform support
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


