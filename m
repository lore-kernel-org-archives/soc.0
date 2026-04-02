Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEA360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165442; cv=none; b=qTumveCoMnqmr2Gvxiae8IWm61JOB/AjYZPVsOKuc7IK/HZIOAdPuoNohmKsdQvNvbkJo7eMNrGg1Y9Zb2LAud61o5xNYyD+WxRch1+Pxi4Y9xc0jjSaa7Uv7sPPo3zjyg0xXMgfkAU8lrBReNqi+Uj997LOphuIyy8b75Ar5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165442; c=relaxed/simple;
	bh=PQsuDFfSUKztff62PVanpQ5Xttq5tS5ljIqgd+d8M2s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Y5irHCUigs+rdeyEWkgoyli26LT0R9RqyoyXTljZVHFdw+z+YMXZBr9IBWwB1Fmnpax1GNDI9QLC6EwtSBVj5u5VncO8fdt4Xt7+9Zuk3HBhvXCO11tVtgeIJigHG7XYSUbTQ17Ub4UWULfeTFbDMbqlVxoU4fwpiGeD/hbTNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZkrjEQx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZkrjEQx"
Received: by smtp.kernel.org (Postfix)
	id 21865C19424; Thu,  2 Apr 2026 21:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC6EC116C6;
	Thu,  2 Apr 2026 21:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165442;
	bh=PQsuDFfSUKztff62PVanpQ5Xttq5tS5ljIqgd+d8M2s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JZkrjEQxeoleZk1T6mqiPaGwBzFVse0k0xQiMRXLPgIyzX4r7SKQm1aAgOAsyUplD
	 OkiZ0Z0RYzTHJ4UTBzp0Yqs8og7I9xFWJLyjw1k9T8scf34B8O5vegbaMvC4yFnrr/
	 DX7fXEeaYAtT+9H0uWChp6VvwSzcu0WA+bcG+GekNNnXvjepmUaSm5+tsgClI2+bN6
	 wwd4B4cJwCKNiqRfAnqMn3/NXPWz18RbJSIOmCkIjQ1CGnqZiVYwbhww+4RXmYd0tl
	 Ts7t1hts+5sBWgX5x03W1ogLAxYMpAnuVbh3IQu947XhnPjmnW01AmB5TdgXThqzRK
	 C/gTKZPvc361A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF463809A09;
	Thu,  2 Apr 2026 21:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516542403.623252.9667393214343931393.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:24 +0000
References: <20260401082533.214103-1-tzimmermann@suse.de>
In-Reply-To: <20260401082533.214103-1-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  1 Apr 2026 10:25:28 +0200 you wrote:
> CONFIG_FIRMWARE_EDID=y depends on X86 or EFI_GENERIC_STUB. Neither is
> true here, so drop the lines from the defconfig files.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/davinci_all_defconfig | 1 -
>  arch/arm/configs/omap1_defconfig       | 1 -
>  arch/arm/configs/omap2plus_defconfig   | 1 -
>  arch/arm/configs/pxa_defconfig         | 1 -
>  4 files changed, 4 deletions(-)

Here is the summary with links:
  - arch/arm: Drop CONFIG_FIRMWARE_EDID from defconfig files
    https://git.kernel.org/soc/soc/c/757b23c2cb20

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


