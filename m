Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95242225762
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758950; cv=none; b=u2azUogwa09ts0f7UfJgQp1GVVImIJmy+gyean6aMamN1fMHca0qzj9enRaqxuSGV73mIdrRjyB8RcFiccg5KqjXDKCmH3EwNNrush6EAKeE2Zpo0TqDFsw9Pe2i9yOCo7sOHQ0J/Bp0GbVd0GYfPK5p+eKtxvR0tOsZJg9umWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758950; c=relaxed/simple;
	bh=lnD5UWp43bLGU6nM/go4jbP4V3h8Yfv48HKwIzv+LMs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tFEgVTkSvwWq83HyERMySpfGksnrQiYiq4ICYfa89VD05LZr9AdKo16YWm92CalhiHFoL/bzzowiPfxUhIV5K0S0fU8Ch7XqjcSRAS+3aUsYy0NVL6fl41MiKnSED9pAEF2YheoySDRqOSeUM94vcUTed2x3L3xk6X49xDBQFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWPdt8Dg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWPdt8Dg"
Received: by smtp.kernel.org (Postfix)
	id 40E91C116C6; Fri, 21 Nov 2025 21:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B49EC4CEF1;
	Fri, 21 Nov 2025 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758950;
	bh=lnD5UWp43bLGU6nM/go4jbP4V3h8Yfv48HKwIzv+LMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DWPdt8DgftzMHVXygO2dEkQJW3FYaZjuvCVHkH6y6I3iV/ajlYOsndj8fdLguaL4b
	 NoMzYcfgd/u4AqUDUyuiJFCreFNwt8yT7Qm1ckamZGVKpYlio+Ycn8Gdu6UZ+FF87F
	 vcL74Zd2/uqfziarLl3+1fO0sQADaLsqzGPKWU21p5Q+TApQe98lyGog0/WdCP7sKm
	 Jv/QobK946jH0uZBW24OwOgNSSkS9L6uPUdP+DeKHjQ/2XzkIOASzwFCnqf/fTYtdK
	 VyRE0Qc0Hb5bdD7oDJ8juKSv8ULETnYSxR7WLLRwlE1COlD1cw+/QU21ST6AaxPjQZ
	 sv5+G0J8nM5mw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF4B3A78A69;
	Fri, 21 Nov 2025 21:01:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.18, 2nd round
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375891474.2583629.14547977746155850994.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 21:01:54 +0000
References: <aRnQK0kiLvQZ9X-f@dragon>
In-Reply-To: <aRnQK0kiLvQZ9X-f@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 16 Nov 2025 21:22:51 +0800 you wrote:
> The following changes since commit 6504297872c7a5d0d06247970d32940eba26b8b3:
> 
>   arm64: dts: imx8mp-kontron: Fix USB OTG role switching (2025-10-28 17:01:42 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.18-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.18, 2nd round
    https://git.kernel.org/soc/soc/c/65c4ba832d09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


