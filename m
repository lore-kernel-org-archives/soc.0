Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46E32A82A
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946620; cv=none; b=sVdhnRI4Tmz6W4u7RI3djgAKgSfhiZCqbZ8FQjBm1m8RqkB0/lq3y+7/PHvH1EVQTWiJDRRYM70nOYetkzF5pEjgY+pZe0yWBwmxilWOq9C1lRhgo/rbLl/zgHbvVPTDCnE0xjPKa04aOnJpF2RVcJUjBNRtjLGBsqD/WAMM3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946620; c=relaxed/simple;
	bh=uMCl9x3J65DntC49Q3DAIgQbq71gfDrAT7FfZp60T24=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UF7+B2mLbZuVYaFmostKsoib11dXUBE01QnCJOeNNIV8xb+r6HOV6Dho1Bv/XmszPiSPxYixbpbTyqpl317Lp0hm2AeR6LZm1xYSK/mOxvmuhr6dQ2wu2i3oBnit/Kq8jGWfjU9pPCO4he6ILWlmkIAJrBlHmah+d+pgck7UXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA+r6Ef6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA+r6Ef6"
Received: by smtp.kernel.org (Postfix)
	id 140E9C4CEFB; Mon, 15 Sep 2025 14:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28D5C4CEF5;
	Mon, 15 Sep 2025 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946620;
	bh=uMCl9x3J65DntC49Q3DAIgQbq71gfDrAT7FfZp60T24=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YA+r6Ef6uMuBQ09O3v8uKYZ88TuuepUm9nUsLUByvEDZfpSLN37Gij8qj9EFO91fg
	 cj//AUTTHdUn6Y03GxROZUduFji8/I3zfWRa5BGWnFE9u9wUbAurE+vrOM9OYRcimo
	 jkpDLB4kW1NDFPvUH19xL/32JCR2HkF+tBhTNvHRE6qR5MS1A9Llx694fpDUtDoaZ4
	 c+lH7ku7+ZoKTYAWq9MigiXwCPVkbJ6eNu77V9X7alFM5wXRMgcbqbpVxmKt0mgkpW
	 H6ckM8h7amB/lVUy9if4rQKyQLsRco1wS5ry/53JRQT8mVtCs27W2km8oGw/2fyL2d
	 L7jmweHhc1Trg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC3E39D0C18;
	Mon, 15 Sep 2025 14:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.18 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794662123.4799.11033612295635007273.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:21 +0000
References: <cover.1757669912.git.geert+renesas@glider.be>
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 13:13:50 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.18.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas driver updates for v6.18 (take two)
    https://git.kernel.org/soc/soc/c/68454c6fc149
  - [GIT,PULL,2/3] Renesas DT binding updates for v6.18
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v6.18 (take two)
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


