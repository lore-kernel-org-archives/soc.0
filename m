Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468621E50B
	for <soc@lists.linux.dev>; Thu, 14 Nov 2024 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731542425; cv=none; b=oQtAVTvSjGwvVwa+USyZjCH8oRHVxCYyOuk15OzXVp2QzpUrDhXCWPAaCylu7vJqvL8/kphBAYhZCZM07DRyGLNGboe51aeN4ZRC85EoK4RLhlSGg4eyRbUF6ohLICY4Bve7dJckO3sj7GVz9E8OXk2MDaNHSHRJTWNfnatO+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731542425; c=relaxed/simple;
	bh=ZyFezInXjKK/CesHbZ5AhQF+qqt0HGmv1NY99Hf+FgE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZCLCDgCV3Gui6SO6DThUnGZ+fW7zgt3F2f+olgtGjed0eUm3NjjYAm8rH6niF8TkZsdNS5IGP53KhU9ufeX8Mymp36K+j72eMwkn9P0Uv1LWeQDdRLja8bHKIAiDPyJSfCpKYSwIM0cjjlf/Q8e+T4yhghglxuoE4Ec/fAYtHKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsmFdXmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsmFdXmW"
Received: by smtp.kernel.org (Postfix)
	id E03AEC4CEC3; Thu, 14 Nov 2024 00:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD4CC4CECF;
	Thu, 14 Nov 2024 00:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731542424;
	bh=ZyFezInXjKK/CesHbZ5AhQF+qqt0HGmv1NY99Hf+FgE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HsmFdXmWJvy7848JD4zHd4lRfoctNxzlZIDh2arisICXXoWlY1gLlRWHEO9FrAvPG
	 JfL2JKzqqBmiNqrFGSZnpm1R7lj7Q3nKLlUmAgBF8HmFZ4+h8WN5dHzSfUN1qMQ0Ki
	 9SvBhkdnZvTXs7rLK7fGilAwAE534q8oC5cNN03Zl1cfb2IO8Zf4WSZtabZedWKuUq
	 BVBI7ypR/08CzBnRsKmQ/sYbHCKq5R2u1lacH2RZmLSNeQUQfsHmiX+KN0WQNoZd86
	 cqjQov0lynQvnmy6ohcJ3zKIcHCr1tljNusSIc3neQzHv8QUQMpEqWN8B67npEiG31
	 6HJ1pT0QCF4VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB03809A80;
	Thu, 14 Nov 2024 00:00:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND GIT PULL] Microchip AT91 defconfig updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173154243528.1424393.5849295447965178527.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 00:00:35 +0000
References: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20241113182050.2176500-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Nov 2024 20:20:48 +0200 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.13
> 
> [...]

Here is the summary with links:
  - [RESEND,GIT,PULL] Microchip AT91 defconfig updates for v6.13
    https://git.kernel.org/soc/soc/c/de6dff2090dd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


