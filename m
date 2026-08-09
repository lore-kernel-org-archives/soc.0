Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79336B061
	for <soc@lists.linux.dev>; Sun,  9 Aug 2026 02:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786241449; cv=none; b=RL36vPT4JzYMe+nx+/JcYaJ4LJ/h+QFPr3D3kfAxPJHZtBX5xap8d1CFaKpiy+x4jSoFH3PpQuYc8q57RGSSswernW1NrXP02SzbVD1z39yXkcp4jvnhVMGpqCZXOx+2xoQQ769Gm/pIxjJU18GUAdxwpj93lkSws45oRiV4KKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786241449; c=relaxed/simple;
	bh=jEnB1l+KEu1WaWNqRHi1A1ycweBr7uZl93JAZZ12Ges=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YCQIGVMos6r1OANcB114fm9P5DZdNzkpBhjKStYTgxvg8khrFeChlc6w7W9vdmDxSwF6G78hiUeFCKiRxL1TICgvQWqwnk+NxaUdQ0eMcTJmwP8i/PkWwjspmvJiKVyMhoMHCr9huUCmmgLIhEIVAiPPX+NcmKlvLXNJB4EArtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ab5AIg4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ab5AIg4Q"
Received: by smtp.kernel.org (Postfix)
	id 3A1831F00A3A; Sun,  9 Aug 2026 02:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B411F000E9;
	Sun,  9 Aug 2026 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786241448;
	bh=KAodOa7d25H9/To4L/DhvwIp/6fgqu3JiCxQE6zpEpo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ab5AIg4QN3YGisDOUC+W1WuTTOHtOS3i3WWTMFYWNF3gJ2ErLaNRic1XOa2j6GFV8
	 Yh5V3Xvo1wdRW49IH3nrf7/utU6PtakJfVb4FVKl0epYNsqSzO3nv3vxj4lnzqkVhX
	 WWkTh24suOHiAX0YE5GkTdVeDm3MGjSOPSc/90PSrTHolS2ILy1h7d0Hf6UJpccyG5
	 t2IQU81YE4xHg1y2mI4TfW7NOrWvlOD5+kdxXliChxOpXlteTm0nXiXUDJfDEHK5QR
	 4VTzIORhrL/V2hCkVzC0SkblNFSQTHinjgpAJI6pAqQ4vPwXTJQvNEg2owb6RJgU4g
	 ZzgpFvfOQ9x5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19881380CFFE;
	Sun,  9 Aug 2026 02:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v7.3-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178624140589.2813131.27669212901936824.git-patchwork-notify@kernel.org>
Date: Sun, 09 Aug 2026 02:10:05 +0000
References: <20260802165148.1259649-1-thierry.reding@kernel.org>
In-Reply-To: <20260802165148.1259649-1-thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sun,  2 Aug 2026 18:51:44 +0200 you wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] dt-bindings: Changes for v7.3-rc1
    https://git.kernel.org/soc/soc/c/36a05549410a
  - [GIT,PULL,2/4] ARM: Core Tegra changes for v7.3-rc1
    (no matching commit)
  - [GIT,PULL,3/4] soc/tegra: Changes for v7.3-rc1
    (no matching commit)
  - [GIT,PULL,4/4] arm64: tegra: Device tree changes for v7.3-rc1
    https://git.kernel.org/soc/soc/c/b981359d9eca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


