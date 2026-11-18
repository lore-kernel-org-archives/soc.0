Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017629;
	b=P95LY8alra6Wo5+5XLC4gFb8qx21JCHCC8Z4tkc+4nsGHWpgm1Yl3KnXjlghtryG7nwa
	 rhfiKx6HDslhSqZOPFAVSTxf2pgJIWYrk9w0zRGTJRGaYqL/JGMN4NPvIDDo8YGa9Dr0C
	 /rgVN3S48/beT/NW5/3xQL8i5ccbE+weCUu7iSzW4LQU14OYd9tef6tOzE7J0HI3VRr7W
	 MDkNYQST09/ILiLyHhjZ20IdIgq7RQa/LYMefU/v1fVMxlyhQXtlGs8afP5b/4Dqjb+TP
	 SrN8XUsz841LU1YL9p5BTa/1rFM9WpWIGeNOtyFh14gGailZ05vNGRKO63qN+I4/Fnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017629;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=QqUVUBOUYFzqGC/47a5fiDDKj7exHuVc57c9NzRCgpE=;
	b=jXzHP5ga5CpVwWaYvshzF+5LJy7d3ZBLNI7ZM2G7yFv81dVmlhYz1il5Mv2SQEuZhetu
	 cN8RFv7ifirQsvy8En7w3tSWgMjDsGeMs2E0jljALO7cP7IJZLhg1hV9Wipfhxl8BeqyV
	 6vf3XpTfqnz9sPCsXLwwbEdVDYfXvE1Dx0Nr5ZGcS5KQmYhBpgty1b8P89phL/xDI5EUg
	 BwuEQYh/OpVkT85FHDEMyhwVAzu8QkGEtSZv4Rax2a7UVlekR1qQ0JX9sCTdlErPuYl9n
	 oY5Cxpvlu3AJrh7UIxMeRR4ZB2pmcK1voY32il9Xydk5vkgsOv0bkw33ezIWkBQmTiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S45YrbSt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1AE606A333
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S45YrbSt
Received: by smtp.kernel.org (Postfix)
	id 5A9951F000CA; Wed, 18 Nov 2026 16:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4488E1F000C6;
	Wed, 18 Nov 2026 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017629;
	bh=QqUVUBOUYFzqGC/47a5fiDDKj7exHuVc57c9NzRCgpE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=S45YrbSteXPye6IU3l8XbB//FQXUFXKFcJj5u8W3zWI9UaC5CgtO2mQk9I4gi0zyg
	 UcGuWFfOZhfrr4quaW3X1t63qoWiKNF2iekcZq2O93EFt2p95pGhGX8W2g9XprRPoo
	 le3/PbxQoaBKF71a7pF9W1KRilBOCbxO4n7zjccNZIFTyp/Wpwtt7MPRPcfCrbE1l9
	 gLy3T1szkdD4pX9vKC4DQ1ONFWgqWvpIl0S4P96dttP56BqLy1bvH3Bsn1B8tMHqAe
	 18xa+CiWxQxvKym6ATBXpgFKaQ3PM1F4Eh6ZpVbBpb7vPC9mKr8k4vW6V3BicvkBf3
	 MuulKmc5RFn6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A20E3808210;
	Wed, 18 Nov 2026 16:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] iMX fixes for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501762777.1802028.5472995844113305840.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:27 +0000
References: <20261116174947.2957972-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261116174947.2957972-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Nov 2026 12:49:46 -0500 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] iMX fixes for 7.4
    https://git.kernel.org/soc/soc/c/6730eb7d5e6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


