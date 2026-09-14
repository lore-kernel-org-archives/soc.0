Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC9496D4F
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398672; cv=none; b=D43YKdy1RKaVxGNq71XuIYj0vCmH8MioHKLusFI9C0ZmWGqJpzR57JjmNC6NcyR/cvcjRci6dMtR2IcMsErH2Gg62L1h2t/oDxtTv5kx/yLESkui7vYoMH2KFA1Nsh7OqbadLKTn7hbrEq8OlZrVBSRWonG8lq/AJSxNRLxJ0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398672; c=relaxed/simple;
	bh=CsVksNbNj7ru+4WgpHVaQMY1yE8kWLeb8piidtTqGPI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=o1ZWKq3336C/HOgHW/A1TXcYcU+5P+Cez+DoCGXL1ymJHaFP91BF/6mpoYL0nUVm2RcVE+bxZhjpW7+Lph0yQydrf7h/CGsyVf81RUvYzJt6VwDrIH5einD4Leav1tQ5tkr9X5htRbS1w7rnUnCzwAC/abuzN4vO0ElfmTJhcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYSMGRkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYSMGRkW"
Received: by smtp.kernel.org (Postfix)
	id 495F31F0089A; Mon, 14 Sep 2026 15:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FBD1F00898;
	Mon, 14 Sep 2026 15:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398670;
	bh=sTN3T93PRb9CIo6P5wlZy61ET3XKnnOdnyEmZTl95Wo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=eYSMGRkWSB00EU45TbxgWfowGopJmA6gbstNz4JLZ0VkOwvfytSM0FvRTXABoxvlJ
	 H4QvUU79z4HVkp7A78Kh1N9Maw5b19uag1rqNg0PuXzIXf+xXHwLaVwi8WkZnXiMXA
	 BqqdwF1AJuqxdO5uceCeYhuqjWMJJP1LyKLkZnv6TOtLWLni9phR7Au/8KGf6EIWUv
	 U6NAqeo6eB7F+HoTxr4++8bT+M8wZodrf8pUtciPiJj8kAvbelTMxSoVe2AP2YROww
	 rC3JGXW7Bi9sy+m6NFD2gO/jhq2lCzGsGTkInEgeAFV6jNlfXX7YxAaczZ0P3/+k8j
	 oqd4/Ieho3pWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93D833924A6F;
	Mon, 14 Sep 2026 15:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939860538.630437.8093332569620464593.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:05 +0000
References: <20260907161952.1148669-1-dinguyen@kernel.org>
In-Reply-To: <20260907161952.1148669-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Sep 2026 11:19:52 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_fix_for_v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
    https://git.kernel.org/soc/soc/c/8c8a0cac6ff0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


