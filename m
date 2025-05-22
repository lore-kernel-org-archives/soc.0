Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935F236453
	for <soc@lists.linux.dev>; Thu, 22 May 2025 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912799; cv=none; b=WVVfBbHQUPFlmyWKgD9LZLrFNedBIMbp1zI82q4gVOgQvgasgVGnAZ8gWPt9O3Ddzg7GiLnf8m9VxqRzbakbMTYDARUi0aOzApRTAdqNM8rXVum1oFxK4JiaKTFrb/xkLA3qDZCxvC++gGWqBqvuTCTmJ1L8zIUgn6dwWWfxoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912799; c=relaxed/simple;
	bh=NddLXBCdoR2Cc8RzlhFG6p+MC0bhOlFMg645q+UBWUs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Bf2d0Dj8kDSmuO/1kiIciIhWGqgAsHP+VWv0tYY4geQ0T5DXeO6ux2kZ5pEvayBkx2cWvDQ6Pm7lATWRgV9Zo5Y1QbuizMNgwVmeL7jv98XVwSt33roK7UJO/RRFaDy6UCm1uYzGWcB3Z112reFySYfmgXCwC04un6gQX0BHGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgIac/ri; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgIac/ri"
Received: by smtp.kernel.org (Postfix)
	id 05268C4CEEF; Thu, 22 May 2025 11:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCA8C4CEE4;
	Thu, 22 May 2025 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747912798;
	bh=NddLXBCdoR2Cc8RzlhFG6p+MC0bhOlFMg645q+UBWUs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bgIac/rikmvHwOj0xQ3cJFpRxrAKrmFN/xNZGEC9Fc6zOY38MLwyz34xT5cXvQkZn
	 ZXVSWR9HYtQbtPmVJcNrbc/SsoA1O1eBPZCaGXbfrfdbwLhHMXBTeKGm2pdPUNcipV
	 fh11p1p/eYWtVJYBiOLvAyQtLQzrYuD1PZAu8yn8XlSooUwVMlfv7o+g3IP0Tomouk
	 G6dRw79PnVDLeD7g7RdbJfh1HVe73nIiXaZ2XujkumjJA3lQ/TjcEpeVQw+EDWb05A
	 uQ1d/TLbHjcC05K+a64qlvXzQYQK/SyW0wqtrE5G8MpjBVrgKsY0tx1mM03Yr7VhZW
	 e2PHzxMYz6yNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCFC3805D89;
	Thu, 22 May 2025 11:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Broadcom maintainers changes for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174791283424.2837630.1931382759175604993.git-patchwork-notify@kernel.org>
Date: Thu, 22 May 2025 11:20:34 +0000
References: <20250513140808.2047729-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250513140808.2047729-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 07:08:08 -0700 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/maintainers
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Broadcom maintainers changes for 6.16
    https://git.kernel.org/soc/soc/c/16066e29d3f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


