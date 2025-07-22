Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14A827EFFA
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218602; cv=none; b=PDqNwPp1xQm4xxj3VTriG13zfmsukRxa4fD3jqOKLJEKWi5pegic8YWCSMObNcYWJdE02b5pSB2VoK9kUx/XcDl5GZ84wFP3GH7/b0T9Bos4sQJjfa+Lb0InzM8fOUm2G03HsBvyeQrmb/gcwMfAnT9wS/n/WBiiLF9mbDQgiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218602; c=relaxed/simple;
	bh=9t6+tpJu81PcrrsFNQq5q3dIRO6EYj9sSA4SwaHAf74=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cq1EaOr0thW8C6Z0rLQo/1VLXjHYEUXiBfjQLETrFdWerh5WzfnK9G3Trivybsmv4GMwUmjYcjydLj0kjRPzDK24OxvmloX/ZNOF7ixXJnn5pyeJh9SUcnRRsLw92caZ3ZEW1DF/NR5EhxSIttRJXU+NgNpA0djfCsTBzAstDyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdVM5cII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdVM5cII"
Received: by smtp.kernel.org (Postfix)
	id D4219C4CEF6; Tue, 22 Jul 2025 21:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6C4C4CEEB;
	Tue, 22 Jul 2025 21:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218601;
	bh=9t6+tpJu81PcrrsFNQq5q3dIRO6EYj9sSA4SwaHAf74=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FdVM5cIIHQKrdsNvYf6TyjJJxHdtbEvCmv0f4xK1gHPwCHnmOA69D1H8d3Z7gKFIP
	 k9l7bTRqZ5nKa5Rjz3ijPMhAqlE0yiySKKgvFoOGKlZGGEqM+plhYIuSld4sXXjGvd
	 j0pyIn6tXv8HOmuSW9FDukIfP6BMTCVC/KA5IdOgmhruDR5oBXhqvHi7kLslJUh6cu
	 iie7Me1OHTXpqdSNRFvLXj5N8QMEd/tZO1RtJZ5ZqqiMy5jzO5Pc4migMU0r+oVYiu
	 OrMLCvudafUUMOHfLUYEeJSnzdpIIeB9buYOIuOvtSSZIj/zajVdZ77RyVUoDf91t8
	 iK4SRuokjuEpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7213B383BF5D;
	Tue, 22 Jul 2025 21:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321862024.955963.371145399380694949.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 21:10:20 +0000
References: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250721100904.568575-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 21 Jul 2025 13:09:03 +0300 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 defconfig updates for v6.17
    https://git.kernel.org/soc/soc/c/0d0807814b16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


