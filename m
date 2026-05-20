Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA563093A6
	for <soc@lists.linux.dev>; Wed, 20 May 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273066; cv=none; b=m4K/jyIuGuuy1ReNkPYU793IcGzYxwnjKQRuEdz8ZAJNZfexsfDPFpyQVijFNqV8rEJQaFoliLejSzteB9ijAXrwqc7PGjIsNxtsf2xwZb/o2kx1rraJpzHCVYG3U5pw+lgYFPU/kPGfiZzUCjOEIZUBpLRAVY/Jt0IQL6trVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273066; c=relaxed/simple;
	bh=qaLbgTn+uoM8J2LMrTN7SnmCULEHAmwDluo084oDuMU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MLiPmm9gltu8fU3zvYb/xtCXE+5XDUBmAg0NBoGZAtRnkpWeeZj9yASkGCUu9mkTdiaYGU4XTQGEZSVyhynEMT6mOWGgf4OXRumJNzSWSPUDFLZPGJCuttpb7uYMoiy1nLzXe4+5ZgKcAKZ5rRhKWr0f9RaWfvL83xz8oSEtY1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUs+bKxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUs+bKxP"
Received: by smtp.kernel.org (Postfix)
	id 968C91F00897; Wed, 20 May 2026 10:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806CD1F000E9;
	Wed, 20 May 2026 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273060;
	bh=eLM4MObEv3LnNc5h/rehmsjHTfM3LxZds/DFru+d5yc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZUs+bKxPI0tRw+NLTQ2rId8DzJ1YYRVnLlQLadTv6Yhyv5qL8yvCmxHfywU++QEJb
	 T9fxmESi/XfCa1wmsO3WKXQOP+KiyC3avDYkTqAvEZZ6/YkgvaQRR3udrn6LCYc+1T
	 k86sMJa0lVIXwr6Jj4mN4enCvShF4LjHVCXGgX71AKXm0i1MMSFouau2oa38Bkr8wl
	 fOx/0mPpbUrqh5kOZjqS4UqgZxkQRaS/CZ6pwYVGR7heqJuvkSWyhQkgSrcZc0wOM/
	 hCpzQcofEW/JL3UNwKaSztgG9GPyb/lzgvNZp1KC+Fbt3hgw3v05zHwua/0mLd4MlV
	 DnhRshI0wSCzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569B73930A0E;
	Wed, 20 May 2026 10:31:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/2] Renesas SoC updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177927307088.3101306.4042924903699467884.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 10:31:10 +0000
References: <cover.1779185457.git.geert+renesas@glider.be>
In-Reply-To: <cover.1779185457.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 19 May 2026 12:35:57 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v7.2.
> 
> It consists of 2 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Renesas driver updates for v7.2
    https://git.kernel.org/soc/soc/c/b1700f8d6c80
  - [GIT,PULL,2/2] Renesas DTS updates for v7.2
    https://git.kernel.org/soc/soc/c/ae6bbc1ef58c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


