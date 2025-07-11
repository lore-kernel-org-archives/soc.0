Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3573295501
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234588; cv=none; b=YcQyPkghOmKjjwvkaaHTiJsHdHrgZ6AhSD5Fqy1GcxMGM+/WleKVzGW2djlLLe6IrqF8Iy605MqorW8tDxU/gwXUc3GKZHLqB9d91ftHG7FYBPbsxk6/7DiJcVotYHGnkrlBn/H/44VqA3NBjhcZxsJ9TYJYXjglwBe7sjK4XGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234588; c=relaxed/simple;
	bh=gJksc6W6wFh6Z0xI00UgBL9k/drX8Dc78kY/WpWKROI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gj7SwDlaA0jaK9hOO1HFyCDRXKX7JHjxUxfhGJgYLEn3jOCTIs9VqslYzd0Q4YDaz2Rw7BvNiTlGeZfibBB2PWMc0sAecmIQoVeZkd5VwSTH1BVz9N2sBAw+vW5v/anPlEhjy/FHSTuqqutHOpnGGW/dcoGLoih72q2VJCS3G3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1inphC6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1inphC6"
Received: by smtp.kernel.org (Postfix)
	id 8FC25C4CEF5; Fri, 11 Jul 2025 11:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B48C4CEED;
	Fri, 11 Jul 2025 11:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234587;
	bh=gJksc6W6wFh6Z0xI00UgBL9k/drX8Dc78kY/WpWKROI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r1inphC611Q8Nz6Jx9QRcSY0Re6zUbcbE/LPhCDaXDoIezwl3hNSiclF5dLR045hG
	 KyCDpJ8TpPv6Hvk2FxxIS0sY7OH28nC6qBijufh0xXkB6ZSCih/P/E8DiUv4jcl8SD
	 2ZIIRd40HkP4NOOdDh9HfB92LLSQdHXxxMi5IpIi1NenFKrxfaWaQk2WlELNOrJNC/
	 kwc/orqWRHBzC8whu+wm5qUEKWopk+zfQlCVuPY+vIytKZoBL+A6udMIJzm+jMQg56
	 mx/960NQiavMdJP51CHe3f+KK4UVWQczgDlxVsbN9/2hIJDWeXi+ItXptZf8FfuL98
	 gh1707Rf+gn8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE014383B275;
	Fri, 11 Jul 2025 11:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm DeviceTree fixes for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175223460924.2239616.11480419034368218793.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 11:50:09 +0000
References: <20250710175434.6201-1-andersson@kernel.org>
In-Reply-To: <20250710175434.6201-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 12:54:33 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm DeviceTree fixes for v6.16
    https://git.kernel.org/soc/soc/c/f2ebacd34eeb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


