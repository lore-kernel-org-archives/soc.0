Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6763A3B3BF3
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007015; cv=none; b=k5Ts3WamqRdmb63G+3YKQtWOrHQnkPSzHTuorJL2EgRqBrE/j++oerBrf8Ggu+ThWyLDYwewbVG0fF/JIbNVhaPsjlXDjgS4bU3hlOrsRVQHcGBzAEmz8KaOtP1iVrtPeeaucWSzGwnmlxl7xYVrp21sncZZxdZQwrDL/CM4vQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007015; c=relaxed/simple;
	bh=bbCYoB8qpMTA1wuJ54NrKM1Nf0DOkFqwwH2KNJNILXc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MDHT9WYOy9taI+aWuiUr4uRRJU39GHYRc7lfxhO36Lq/rv38IBgHkgdYWoJnSBd1M6nCnLMlZR6kHkDz3xRc64hSn63ElkGFfp8iJyvJcpdqN4wHCmDa1EKrQUMv0H8UcnvMYie1OXjwR57Bp3K2MWCs6oDqaPiPBRzO47TayWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mggeGZPl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mggeGZPl"
Received: by smtp.kernel.org (Postfix)
	id 091671F0089C; Tue,  9 Jun 2026 12:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74D41F00899;
	Tue,  9 Jun 2026 12:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007013;
	bh=hLQHtrkYYoJ80TC9YPq/P0xcV37C8PivAdyaWEYwJpo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mggeGZPlU9jpD3PL1fcO11cfod77qo21NTU1aEzyW5O1fKQeNNC1yyp+INcO7HTzA
	 JR7O90tLJDlJ3RHaF7I5d0PSgtJzkstqaJrxJiJziwZSyt95TyTMkt8L/ePPS6C2Re
	 WLweYzl1Rz0WNApWMGzAXJv0MJywwd3MXHM9tBLqo0h0/lpGTFSJGQsWjPma0MtJIg
	 EUM3JKEO8NjwfGVmwggzcT0GXvUiOKUdUmvsPV1x96CMPHpYU19aZryYER0wfyHtwc
	 HHwF/2Nq5eYrDltG68kCf04I5KQzrWzTrKnnAEVp2iqx0yxCAeg0zx7ZgCg8+p5BWm
	 9e5mIBY7sZSGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938DC39308CA;
	Tue,  9 Jun 2026 12:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Drop duplicated CONFIG_EXT4_FS
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178100701213.1991839.4734217146618545509.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 12:10:12 +0000
References: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  3 Jun 2026 09:27:27 +0200 you wrote:
> Remove redundant, duplicated CONFIG_EXT4_FS to fix warnings like:
> 
>   axm55xx_defconfig:198:warning: override: reassigning to symbol EXT4_FS
> 
> Fixes: c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - ARM: configs: Drop duplicated CONFIG_EXT4_FS
    https://git.kernel.org/soc/soc/c/ae371a58117d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


