Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A614884C
	for <soc@lists.linux.dev>; Mon, 27 Jul 2026 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142245; cv=none; b=nbKLJoQqiipPBmwjeT69Lz7IVk109uAHroOinw7+UYBLLPeGRskpFwLHTCZgnBYgY8FmEnq/L3J3c1Zw86YP3zCtRZiqI/YeyuRISyswL0OfD+orKT44pn0pPjhVmFT4NZA6mlq7CydqqLyWE7hVpBzwLT3kWJaDggRCL/Rf8I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142245; c=relaxed/simple;
	bh=7J4uMZnte9wJXllaU/HxgL2EXbhfFQWrMHqnNno7u4g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tF1fkhkO8o1uj+h2hO+DLgSiGF/lpTfX6CFdgVqCUAa5c+wcNjSOL+kUl27qnSZ+ndT+MPE748mUAoV9p9xWZgz+bBtP+HuKo7uFB2ZsEaPr9Y+kPl+N1EIBVAOx53dec3KwxdFkkfAuwK0Za6CL6GrEhs4Rily52YQykY2ApZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLfBQIfB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLfBQIfB"
Received: by smtp.kernel.org (Postfix)
	id 1D9781F00A3A; Mon, 27 Jul 2026 08:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059C51F000E9;
	Mon, 27 Jul 2026 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785142244;
	bh=hywrnbLprZtymi23HltpNgVZTMwzNyzoqMOQIxToaQ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aLfBQIfBm2rlMfTqhynM/XZxC7ao5MeT4KdfqNYw19HvHgodXGCIs3RnsFjTWHcRM
	 RdCDv80kraexigjhKYVeNlguU685lA353jtbRZvt+yeB+WJm3jwULkEVbuMUllqw7J
	 83jSA6iNo2bzYr0K2ODG1r27fZO09e/dLqopiu9L9/8a6nCrUlA3tN6yRZ/tcVYR+9
	 kxmbUxDiSniuxGXjZTllsrjHWrGMuOvwFSaZsxOcKNadFkhpgi2iU9mtzwpY9Ivt5o
	 /wdrB8Lq/0cSYnMnVAOoyS0WhYhY8W7svAWoRxoptIKQcTB56CBRRd+a/MQagc8RMk
	 IHdzD4yxVtfeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09623809A0C;
	Mon, 27 Jul 2026 08:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178514220938.691241.995205630540271473.git-patchwork-notify@kernel.org>
Date: Mon, 27 Jul 2026 08:50:09 +0000
References: <cover.1784194401.git.geert+renesas@glider.be>
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Jul 2026 12:03:40 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v7.3.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM SoC updates for v7.3
    (no matching commit)
  - [GIT,PULL,2/3] Renesas driver updates for v7.3
    (no matching commit)
  - [GIT,PULL,3/3] Renesas DTS updates for v7.3
    https://git.kernel.org/soc/soc/c/a4bc8e323ddc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


