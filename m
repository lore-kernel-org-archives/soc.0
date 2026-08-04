Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE0A42AF8D
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874882; cv=none; b=DQnb5ZOPVlMqoBrUiVlx2QcrXwQupW1kchm2fSe2RgwRfSztGcyV7krKDmv8FJywUd4M4bnT9KLB4DqIHE28GHK+2bP1YCfEsP+s3nN/lirshWwnkgKYN88Ffr9HNr3J415wiSBo/BNDjGeCIXQgWRMpqR7JITEJVud7LskNZzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874882; c=relaxed/simple;
	bh=aMDqO95Yxr03IgE8/AUftt112YCzkjUuey9xiBC84ok=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QW3uZoHITEgbAZu8Fk0HpKipaTg4bB8GNa+nAT6H7fOWn8HU70LJr2RK+fbAQ1STHdmviAUo+6GUkLLekUqqsIiKbfT5yAMmdLk98HEb89ZN+MG18vEPqMmClt56yaEdHarnjpzCTKYFS1E02ZWHuXwh6j3XbQXFuKhWYBo2n4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLee+Rtt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLee+Rtt"
Received: by smtp.kernel.org (Postfix)
	id 424971F00A3E; Tue,  4 Aug 2026 20:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4EA1F000E9;
	Tue,  4 Aug 2026 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874877;
	bh=XIkMKNhebaLdbiOFrwWnXia0Pawww9NpR7M/u3oaiFo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gLee+RttML5xalydSHIgvI8aSrG6000jeocHsPfNffTtzfUYxAY2KePRm8xwJpF4H
	 YRdIeYp5DTO0PA8vg02+M4YjLGXNLLeDnNNc4NVkLdFMXPYO0/gVuJwlZgcZIyMEes
	 pFkwUMh6UemUKDndN38YXDkSQESwvJohNjMUSbwN9w3WvHtxSWt1cnRJcxN7cyuSXF
	 /ohOaa5clakYXeQtwIr7JNFruxm/mRUPZez3U3mfcJQ74BLaZyrA4cs0Xc5J1Vs6ry
	 qP+vIv+Q4Q70kedtFjfSqEQtKWt3p6C4/aPZg39kbTx9p0S+C0TQspbk2oObvQt/aC
	 dZLPb7pEuVIcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D08E739263B9;
	Tue,  4 Aug 2026 20:20:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm/omap: defconfig updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587483738.3769923.13198300311614845215.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:37 +0000
References: <7hh5lbjj8o.fsf@baylibre.com>
In-Reply-To: <7hh5lbjj8o.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 03 Aug 2026 08:50:47 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/defconfig-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm/omap: defconfig updates for v7.3
    https://git.kernel.org/soc/soc/c/7cced70f523e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


