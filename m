Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C57266EF6
	for <soc@lists.linux.dev>; Fri, 14 Feb 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545801; cv=none; b=KdUjSXDJwtSVU0wwc2wnzLyhL0wObBlgJGfesBetHen4sljZmWDQncrbJuVH0LCQu2wXUKdGgtVv4DACMXsMJeuuo0MPov8l3o+XtRpqoeKiyatb+Z4m0J5Ai9/2Oyl1jM6iqIz90F+YDaLu3HgcuAPDOHOm1IM3Fqvd12A1pgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545801; c=relaxed/simple;
	bh=BY/44yifja76EwvvZoz9rMtHQ7++5C6LLAIh6X/V1OM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lpShLmBWCKeJWT8MA1d3hjeHipu6TZbhIH+9V7nlAlPZHQ1s2Ss5aAa0lX96WDIQPNhM0F9yp0xo4a3HU0+Zuu9swKYN6hLGdn3jBOn/P1HgLrgqgsX7pRd+HnoFRqSwSE+S6zp5pIE34jW/enHc1PUkXRmNcWK96D7FeGFz1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCXpNYCf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCXpNYCf"
Received: by smtp.kernel.org (Postfix)
	id 5FDD1C4CEDD; Fri, 14 Feb 2025 15:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49383C4CED1;
	Fri, 14 Feb 2025 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545801;
	bh=BY/44yifja76EwvvZoz9rMtHQ7++5C6LLAIh6X/V1OM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MCXpNYCf2coZ2h638ZrW6xZevPyheO9zsOpCcHOO68w6D0gPh/b7OEhUefZ37k9iT
	 quza02ye+78EH7lkSHpBdFmXdndrt99P3OmKCyiERt7zdmIoXbW73K1tGbNBnrvEYT
	 YM5xHSkTvKoFe1v3CjQUDP+E3opKU6bCdz67SGuvUZigxLyxjZMWIQ9riXOaL9keuW
	 LzAveZBhrv1Rdekh/G+4Pe8UZ2Hjt4PotYP8CoyfT0RDa+Uf81YzRoGFhiHNSRY1Op
	 zT8iXbvctDwjHkhV1bGielGMuhhrhd07VEDtfuqZ14B/t61GWX4uadDX4/th1YShT8
	 nBxSa2hvHNA+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE88380CEE8;
	Fri, 14 Feb 2025 15:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: defconfig: Fixes for TI K3 platforms for v6.14-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173954583049.1980112.15681448200194382966.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 15:10:30 +0000
References: <20250212112857.pm6ptaqbx545qnv7@eternity>
In-Reply-To: <20250212112857.pm6ptaqbx545qnv7@eternity>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 12 Feb 2025 05:28:57 -0600 you wrote:
> Hi SoC maintainers,
> 
> Please pull the following which is part of the fixes required to
> restore the behavior of all TI K3 platforms.
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: defconfig: Fixes for TI K3 platforms for v6.14-rc1
    https://git.kernel.org/soc/soc/c/0d7f66437875

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


