Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCC23DDDB0
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249409; cv=none; b=tE9GULfOiegNDJHmbrJDnT0pvyGhDwL6/dVxuyn5nwLBWPsDURzKnuX8+FuIZ6aZXEK01SKiWMnuDHAq51Mz1iRv3068GyPRjSFfgnJVg6O1ZpnU3hPBAYgfzBatRQD+6gfLaMeB+rISoKotCf2cPW7Ia2d9m9g4eGFqiYKXank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249409; c=relaxed/simple;
	bh=Nzb/Gnk9nErTiypQrSb2KNAVr/s2lEU4uy5QbDik8ik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ukFix7aW4FRlMQlpaO55q75M+qwnDU27+rIdCl4QAMBiYfv4qYIRcw34JMgfjXgnmAjNn9/8M2CCQOpRp6b/UmsXAXTgtYw4cgKN8J8mlyuwCuCMm8QRbL+UFjJXlKiQtfYtAQCu0IKHQGU9hgYGwWeulEm8eCV752xskXyqZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRyv9kPF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRyv9kPF"
Received: by smtp.kernel.org (Postfix)
	id 398D71F00A3A; Fri, 12 Jun 2026 07:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224881F000E9;
	Fri, 12 Jun 2026 07:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781249408;
	bh=IdjzTUXgXNvQnzJRAl1d0jSuja5dv4WlVOYhdLxappQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cRyv9kPFwqommD+OfCji0ooYDQ3lCa3DiFTh48DQ0TeQ1bJRG0AjjC8hOwPAiQBA5
	 VNg9BnerDnvWjM54ZBl+BRkHmvzPtT6jylY4iD/aD1qevH4blN93Oxd4bWJlnwFnJN
	 Wow08FnyWKPmerJqOhySsgHFuwV/fA9YVCFG1iHK4OAj584iwY7otaC76zHDfkLBbt
	 bbxhKVO1LCzmbmQvKr1ujVIeEq8WUke/GGccWo2G/uastPrqQmBXay3EJ7Xi2G7tor
	 8u9j/0b+NZuUoJB6XZRWrq2r/BfZykpWoAWW4iB1T1UvkqZibMgaBjBPhYXconSNm5
	 x9t4KD0QLf9Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5681B3931000;
	Fri, 12 Jun 2026 07:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: bst: enable eMMC controller in C1200
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178124940514.526649.8766889787305579928.git-patchwork-notify@kernel.org>
Date: Fri, 12 Jun 2026 07:30:05 +0000
References: <178123037729.455092.8454252669856079676@bst.ai>
In-Reply-To: <178123037729.455092.8454252669856079676@bst.ai>
To: None <gordon.ge@bst.ai>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Gordon Ge <gordon.ge@bst.ai>:

On Fri, 12 Jun 2026 08:40:23 +0800 you wrote:
> Add mmc0 node for the DWCMSHC SDHCI controller with basic configuration
> (disabled by default) and fixed clock definition in bstc1200.dtsi.
> 
> Enable mmc0 with board-specific configuration including 8-bit bus
> width and reserved SRAM bounce buffer on the CDCU1.0 ADAS 4C2G board.
> 
> The bounce buffer in reserved SRAM addresses hardware constraints
> where the eMMC controller cannot access main system memory through
> SMMU due to a hardware bug, and all DRAM is located outside the
> 4GB boundary.
> 
> [...]

Here is the summary with links:
  - arm64: dts: bst: enable eMMC controller in C1200
    https://git.kernel.org/soc/soc/c/6191a61ec9d9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


