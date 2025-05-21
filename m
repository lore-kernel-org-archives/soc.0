Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFCB22F744
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863018; cv=none; b=Jh8Z+YaEmiAz+RnbV36bYQDRGzWE4OMULu4h4hENr6qgV3QyB/iHxmg6G/C4PVHhGbG3iWbuNPgS4NbOJ19p0pcPWInatT7Wcl6L1bFxI5ktCGQxVngcLFBd+9mgLhegzbJ1rGrGVfTek63QVHfAoAkstB66Ia68NaL79GCe28o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863018; c=relaxed/simple;
	bh=J4tsXoHoaWs4GyIyR/XPU/Yll8MbC4XoYXWpRlykTA4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SCgnKHmCFdEWCkyroZGa3NTYjA+r2pLK0EAGrBLOw57ot70c2wSJFi5jQL5lPQmvjVSEMtCa7KGDqKbzTQxCmoFNcPht5xVEUr1f4KP29CKqx2zQKUH2Nw3F5WpwuCCMxlbjGmXbwwwkKM60zVJdpCeS//u9NE/g2I2gRsaWMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTAVTrpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTAVTrpN"
Received: by smtp.kernel.org (Postfix)
	id A1AEAC4CEEB; Wed, 21 May 2025 21:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4DDC4CEE4;
	Wed, 21 May 2025 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863018;
	bh=J4tsXoHoaWs4GyIyR/XPU/Yll8MbC4XoYXWpRlykTA4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nTAVTrpN1/L7q5fXYMOP8nzKA0Ley23pknODs6UnOLP6UPKc1LUZorC64W92NYNLi
	 D9WgLG7dnPoJcPdK7pyh8ZTRieZumwceC+wsTpA8P95GZUxFDCqPRnm5cSiFHCFHVp
	 09rm5ZE3P/k2xZGfbT4mAc4Y3QbnfKPvR1s9mGTzHKi7uQWeCwX5zFpZaF99DF9332
	 mTn7LC7yXLpPGgvmakgoh3Sn+XLVG2aTocvt5hwqeHcLrMn8hXHCWQbTKouGWLSGut
	 oWjIZ3LP/cqPlFFtCgpJiSrgQs+gS/VZLCJpWvdJ6IM7Sx1HRFfodP8L+gTmwss/rd
	 t7InOPRLr5bwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E8C380CEEF;
	Wed, 21 May 2025 21:30:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786305400.2284637.15853608150086054723.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:54 +0000
References: <04908842-4c55-44a0-b74c-3aca82a1f204@linaro.org>
In-Reply-To: <04908842-4c55-44a0-b74c-3aca82a1f204@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:25:47 +0200 you wrote:
> Hi,
> 
> Here's drivers updates for Amlogic SoCs, refactoring the clk-measure driver to
> move more structures to const and support C3 & S4 SoCs.
> With Philips' ack, I also picked the A4/A5 reset controller bindings.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic drivers updates for v6.16
    https://git.kernel.org/soc/soc/c/382af529bec4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


