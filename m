Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3FC221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848033; cv=none; b=JovdK+UZAR8lAtaRZ4vPT1hFd8n+L26ss2QP7BuuYI+1AHDDp7I/1zAO5yOgDAmdh5dX9MsedUnceJQQYNc2IQ/FiynVqcJLiG3F1Kq8EbtPbIRjiKNrkE/2ubqINFyGbbD3ijxxfP2NP3D06CbTTReBf+aZfjvRlIc2ccsbBO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848033; c=relaxed/simple;
	bh=s5q2SvBbrE1mtGhrS+BK9yt/uOb15qKo+4NFGZgxnDM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D3/xKin8Ap/0Ww3s53Jt6SW3eUFB4JekXurbQ7fBw8hpeybP/ca01OC2xiAKYQZNQ01LARx4bffMXHagUz83VbX+EsBRiTRv2Q9y0Jle9Z+giOntSrYigzrHQFqLAt1z8JSlJ8+9lQtZoCqvtGwaPenSUzcBAAf6mWJveSQzxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTTsu50E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTTsu50E"
Received: by smtp.kernel.org (Postfix)
	id CAE08C4CEF3; Wed, 21 May 2025 17:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58D1C4CEEB;
	Wed, 21 May 2025 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848033;
	bh=s5q2SvBbrE1mtGhrS+BK9yt/uOb15qKo+4NFGZgxnDM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GTTsu50EPPUmL3Y/b/ZHFtZcjQ3JX8AR3DM7rE3dEZT/qbArf1R8CfDNedmU42mdZ
	 +LT/el1IVbGo9h3C4mL0Dr8VUe5FHYlTO31hYC0jgt3VVpYvaW5ZHt1QN0uR3o24LA
	 lUXtIQ/8VL+nAmuYLkC0A8kqET/TqpUsBhDviAgdunsI/rLu0YNOzCYyIgSXap812y
	 bu14bKIjeHUj51jMX6a1TOPRENH1Yb7rjZnGl6I1l9CEzF78GeFpoc9WyFFmv2dAK1
	 xIHZBGqL+/UWe/X+a5HwizEzf1itVKJ9DxDt6QF8UmZDTv8GayVDDhsRwGyYDWTvDP
	 FlbQKTnpVMl6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEDD4380CEEF;
	Wed, 21 May 2025 17:21:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784806924.2163178.15181582967483822147.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 17:21:09 +0000
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  9 Mar 2025 19:55:55 +0100 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v6.15
    (no matching commit)
  - [GIT,PULL,2/4] arm64: dts: samsung: DTS for v6.15
    (no matching commit)
  - [GIT,PULL,3/4] ARM: samsung: soc/drivers for v6.15
    (no matching commit)
  - [GIT,PULL,4/4] arm64: defconfig: enable ACPM protocol and Exynos mailbox
    https://git.kernel.org/soc/soc/c/93b07587bb25

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


