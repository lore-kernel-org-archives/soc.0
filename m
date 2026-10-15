Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ABA3DA7DC
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033834; cv=none; b=eGMoBlCsIEJH5quoTFdGSRDmubwjzyCWlWYaT1PGMNTZkCc34woRAeBvWf1Gp/SEl/PP0u+1V5jFhH/LepIj+Ei7/nUER53nMFy7D8qYPEGcK2x3U9mKodLcAU4OmvGBhNlx9vCpQ51JNiMHb0IwWWVwBVwcuRsr9mgKcrYM8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033834; c=relaxed/simple;
	bh=eywbngLvVJQn+Gp2sNLJiN7pIRRLKn9etiNiWUs8IHQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nSS0Qs8MBeCFWmmsfqOywRVeSEpAQDity89PQCLeOJW09MlqVr06JFvupPr5/o3sSxf/3d+zNmJRCDUV2xJISVp3SKB0P3R/BzohWTNVz2Aa5VQJnicgh65oi21i8ncmPMFzSvOM6RoJX9HJ81L+LwOtOzyqD+c5yXsgtpsRT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKE+gYXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKE+gYXX"
Received: by smtp.kernel.org (Postfix)
	id 974481F000C5; Thu, 15 Oct 2026 03:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8134F1F000C4;
	Thu, 15 Oct 2026 03:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033831;
	bh=piSvLlGTVLZc8ML1+ZYJtA/yez1DdF9Rjt2OFuZARzE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hKE+gYXX1ov2ZT1jNQ2D6fyY1Ull6dJFXtr660jHQXP1oPPeKCkrfOP3nDrQSRH3Y
	 ccxtxdO+NaXs5V3AJ42k3Ss8tuqTgb/xavdW1Dv0Wx/Z1urnPSfNu6VTxeEnsPpimh
	 yN/pGK/t/Lqey0LBAu28syhrmWcCTXgxeWXVmFax3ODveGuI2SIzOjggRrO8bypbXf
	 BojN/Qu6mJOoZUW8nuOt9p3k0f0D0Ih1mRq6+SwcDm5JkkA+l8XJwJDlfjxx+XoZAp
	 EOfUxln0zNXWaMd+x+sfCnsAYbMSpe0JEM0rMd+O7W1JuVXctIARSd0tMF69Af0qZm
	 x436pi3DtyhsQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 77343392E992;
	Thu, 15 Oct 2026 03:10:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.4 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203383001.3155468.5973974324816709839.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:30 +0000
References: <87qzi56wjp.fsf@BLaptop.bootlin.com>
In-Reply-To: <87qzi56wjp.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sun, 04 Oct 2026 22:27:38 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v7.4.
> 
> Note: the syscon "compatible is too short" dtcheck warning is a false
> positive (pre-existing nodes from the shared armada-ap80x/cp11x dtsi),
> so this should be ok to be merged.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v7.4 (#1)
    https://git.kernel.org/soc/soc/c/fb21aba38693

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


