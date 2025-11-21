Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455CC2D6624
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756543; cv=none; b=FAOHLViWl64mwwLCZsfbnnmrRkSJCnt4vX3N4ckxknVpIEjtGpnk26SteUGkMllE7MX1vpPfUh4ZQSgdhXxPcBzmOA56+Vcajlh7GbWs8SpWHy1qryHGSecr4C+yChzN3swlyROJ6uU+gBVAt5BdNFJiq2NOzy3UoTRCV1owYeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756543; c=relaxed/simple;
	bh=wuysHAg5ngGAOv6p0zV0QxbwlrpngrAQ33rlgysFn/U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nv4ZSHaEIfDmjjpE2+D/9T6VZLOz4P4mIMt4JbRTraZVr5GqGa59EMyzQaFiFV5jQQQVQK8iHDHFTct9ZFKrOkJpSgDvk8x2ayXtwdjp/6XSDFmyTq30uAn0D/rCYBdZV1BjzWDSfbqlqfg/s0rbC0qmmif5xKO3+4AkVQFw15w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOhu1e/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOhu1e/8"
Received: by smtp.kernel.org (Postfix)
	id EE418C116C6; Fri, 21 Nov 2025 20:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CAEC4CEF1;
	Fri, 21 Nov 2025 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756542;
	bh=wuysHAg5ngGAOv6p0zV0QxbwlrpngrAQ33rlgysFn/U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FOhu1e/8ABFwtIaUCYKtnwh4LsTv1gjAkWCsHLs/knUoHcFn31DhyAu7KwSeLgyEf
	 NQ+DkrEhKp0DeZWCZzktBlHCGDMJgeHcoCGYEV4m01Cw3t2CLVj2hR37KuzBCCmbLg
	 d1ZVBa4E0CASBRNCQsYITz0O0fT5aoXqvpX+hpMnhSzUBJnGcfPaGdr1H2uHdmMwZ0
	 1TAw4XNT06YaJ5TWQ0DB0Y8jRixVM8Rbh2s8XIXbiTaN3amCQdUzDXNfB8QI2TzHcT
	 5mY6r3dvWgfTbVSUVSVeU+/7352+5oT3iKT9xr2Q4UVlU/9jkBpN0xjnZao7m6s/3I
	 wQN5evCz6XxhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE293A78A68;
	Fri, 21 Nov 2025 20:21:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: omap: updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375650724.2571237.6825316917899479956.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:47 +0000
References: <7hcy5glgfx.fsf@baylibre.com>
In-Reply-To: <7hcy5glgfx.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 09:25:22 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/dt-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: omap: updates for v6.19
    https://git.kernel.org/soc/soc/c/2ddb010a9e09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


