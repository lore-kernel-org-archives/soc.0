Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E71205502
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 22:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460720; cv=none; b=SXXdxWTS/3ERObmf7HHaZQ/t5hR8MqHOg2xq/SWfzVQPPFnrDRgk0UC/T9I+S1qWGKgVknNaEPnhxvr4GWvjWcxUaf+fYV7eKmKnzMbaDGARcm8DhcBUZu+ikW1+icKv+j/sNZNVexGT3EjFA7eXTOnv5auIEbPHg40C60mTDr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460720; c=relaxed/simple;
	bh=rCk/Er5oP/MNAmTVLRsVcHfgjDLNuOsQLBY7wcfv2VY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fFp899WmU2ccyX1OU2rJL/n9ZQ4XR7X7sY3ow5KykoyB/lHRVZmReEW2tFynzUxiMoYhiXH0HkeAqGC4xjBa6890BFAKLj4TvkkpekVEeYZDYMT8GaLB6mMDwMtIxYIfCEt1WlApjnawgV8ssCC/ms7tHPxCZTH1eLISboF13B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMYZeUBa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMYZeUBa"
Received: by smtp.kernel.org (Postfix)
	id C88E8C4CEDF; Thu,  9 Jan 2025 22:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3378C4CED2;
	Thu,  9 Jan 2025 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736460718;
	bh=rCk/Er5oP/MNAmTVLRsVcHfgjDLNuOsQLBY7wcfv2VY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QMYZeUBaWwQAgydSXpNx32WZsnYi6mp4cyBpZGUJNpTb/MZqEOkpg2Meis1rUtDDv
	 GbznCtm9tm8cJHlBx5cyUAae4Acj3Pgco1x3xmfJ7g0+0XG7tYVLOsNc5Hy32k2PbK
	 B1K/zu0hTOlBuO2y/oVTbvX8Y8IqQJTS/5AoBBMEowjW+WI4pFFIxoCkfW+U1EwNSF
	 HF1z2x9wgi9yuWtQLQzAQp5pvhmeq/iDHWMBFeBAiFtT5ySS6/lENP4hKGldmRTbu9
	 K1b1R1E3GtZVefHZGt7Mxk5Dyl9urQOVZqo1/PJDq7HvaYOWCR+bru3F+QM87WcsrH
	 /LW4aQwMxLnCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD6E380A97F;
	Thu,  9 Jan 2025 22:12:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firewall: remove misplaced semicolon from
 stm32_firewall_get_firewall
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173646074050.1523525.3744058414671292822.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 22:12:20 +0000
References: <20241220083335.66350-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20241220083335.66350-1-alexandre.torgue@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 20 Dec 2024 09:33:35 +0100 you wrote:
> From: guanjing <guanjing@cmss.chinamobile.com>
> 
> Remove misplaced colon in stm32_firewall_get_firewall()
> which results in a syntax error when the code is compiled
> without CONFIG_STM32_FIREWALL.
> 
> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
> Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
> Reviewed-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - firewall: remove misplaced semicolon from stm32_firewall_get_firewall
    https://git.kernel.org/soc/soc/c/155c5bf26f98

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


