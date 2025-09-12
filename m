Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C122A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693416; cv=none; b=An4NshDTEnTyYxXIEZkUW8jfZES8RMDJnr0HcXbqDVB/RnIiIccttPgRGpPWXJGPSy0Z6TIZjvHH8LA9AIEMiG7aMiLUgOCNtGrIizICmPS3nL5zw/EtQBdzsBGFash2wt9eCyE/8HgDsT0zi+OVaoUUPb7VYfRrJExzC+Xrcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693416; c=relaxed/simple;
	bh=YCqYJwm5TIXnGWiD3JGKUSc9lMESLdQyU10n5kTfMtg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=il1adrwcd3AcM8PeU3UtX1sGRNSpgtgaJGQ2j6LH+Q6mGUf9bI6lvOTPQ4QacdDuHaPHpIfNrGgcwYtZ0cLlhRYhukSMqlohwLaIMcrLClKMY3mi29E7vTa4NsFE6nfoaNHT82tVvsC/WQyJZdbJnUaOgrmJu+lJ+noX7cVDeOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtXjXdiF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtXjXdiF"
Received: by smtp.kernel.org (Postfix)
	id AA16EC4CEF8; Fri, 12 Sep 2025 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949C5C4CEF1;
	Fri, 12 Sep 2025 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693416;
	bh=YCqYJwm5TIXnGWiD3JGKUSc9lMESLdQyU10n5kTfMtg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CtXjXdiFkYBEiTA7rF/DRb2TOn5VM+U/MOusYjlN/4nut6rx0ze50CkvGo69H5I26
	 EhB+Rapfen69AcP2KJpTnwGVzzmuDW6h6Gxom+8l6ZNiCEExFY5Pgh+VqwbNS4A2Op
	 n3KHwjFUV0M90+4gz4cvIxqJYk3YhA6v3GkSXeBkNoLdKlZocz2oSO9Qkz0PgUhkc2
	 DQ7c/I794X6ns+oy8yvGj5TSyNJlCGtwHGSJHFXhX834iizZVVe5HpXjhtI4bb6ab6
	 OGwldnNntFHgw39x3yLtLT9QxagYxf6R23FVTw2cQvcWi0t41c4DiKWhPEeg+ll7ab
	 riXtK/P7Snn4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D4B383BF4E;
	Fri, 12 Sep 2025 16:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769341873.2998972.12308676910175350037.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:18 +0000
References: <20250904153345.2374313-1-p.zabel@pengutronix.de>
In-Reply-To: <20250904153345.2374313-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  4 Sep 2025 17:33:45 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v6.17
    https://git.kernel.org/soc/soc/c/bab62f5bdce4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


