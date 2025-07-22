Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF9728137E
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218601; cv=none; b=WvxszUXyDouZI6ElAmnjGMIh9AMqzpLE+DmO/zP5KQEToamV/eYddSqg+xyO/9hD94wEz5jjVwU8oktsloQ5qJHB8vUJykoXcV/1rHsalAyeGdOrSe4NsGrQO4js+JHpuxMvTEsINStKWGiOPcXELlA8S9ryjHhaylH84CrgQr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218601; c=relaxed/simple;
	bh=YKfEfIp1UIO4m2XcklG9QqWcYBNwsj7idHLcYMdjYe8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TfLX8p+byc9z/hrRi6h7QSib+/7N7iE1dxvWKdq0YWeQAz6PoB16m2xkHrDC86CRaIfUlDV3j4qEK+3NsAII8Z6ORm/yemlios2lt6WAJbVa4ICLnDvn/DmT7HCxuG40R1QAcLQi8LTNjrsD5A7m+KmgXXct2lOGDp6QuqWJv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS+XxjOP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FS+XxjOP"
Received: by smtp.kernel.org (Postfix)
	id A02F0C4CEFA; Tue, 22 Jul 2025 21:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8A3C4CEF6;
	Tue, 22 Jul 2025 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218600;
	bh=YKfEfIp1UIO4m2XcklG9QqWcYBNwsj7idHLcYMdjYe8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FS+XxjOPBL/iROH2kfI/NMFX1MAbNXV0RUTlf7YOaTtuYK+FY0y9jlT8rkQKArmIU
	 L+uChtZambLB4Ju22NXYmrRlrQ0RTa35iZ0nydJRsqKlwdUdfLv4gYSd+ceZ4FFkrX
	 K1DMIXggtOJaOHwXewel22rctdeCsjj+S20O5QZXrudsA7zEnL8srTnLIf4Q/3Xfcs
	 11hvmvRtkN9YDH3ktQ11smCi+iCtxv/6wu1QyHeAQAaSRMDSV0VS572Xjyt1dz34w4
	 8d5TLgfiPESO6ycHHoKBXujBYP4SOUGZpOI/CDhTsYuc+PkiQoItBKM0mZh9bHXkfY
	 APKjtJuTqUYfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B96383BF5D;
	Tue, 22 Jul 2025 21:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321861911.955963.10972739599420385395.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:19 +0000
References: <20250720031134.286063-1-andersson@kernel.org>
In-Reply-To: <20250720031134.286063-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Jul 2025 22:11:34 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.17
    https://git.kernel.org/soc/soc/c/4252ec9ff812

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


