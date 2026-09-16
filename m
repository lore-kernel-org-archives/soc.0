Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB363A2E12
	for <soc@lists.linux.dev>; Wed, 16 Sep 2026 11:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557684; cv=none; b=apl9+s668dHJDdaFGFO3mKylAQ3Z3rwkFZO/dWvLw4Y+sUoJysEV7yRrPAASdabRIgs10Ddcy1J0uyAimOJlumKGcbgXg1towEijWgrJ8JAiDi69KjY7CM9y3Zhw6qG5MiudbKz1U020ole6+ZxIZTcAOKYTDKq9MKsXLPq397A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557684; c=relaxed/simple;
	bh=MgoIulyYPzlvgKBI8HXoWcHie9/jYms8KQuXFZaQ87c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gae8bwMu3xx8ghJ9/XScpEfajyjDbE1kIOfe3+Xo3h1WYXhg5lLa+9rZlUwQE92JgAB94y3mmNT+Nlw64Y19lkF1mNr/nluKFrToDEZ+N0IgUaP8VRWB8pyyTCg1pS1luluot4YXh7tK1Y6AC5EPyfAtcdQKoAlQ3iGQ1yhGvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zd1shYC3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zd1shYC3"
Received: by smtp.kernel.org (Postfix)
	id 434B11F0089A; Wed, 16 Sep 2026 11:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB991F000FF;
	Wed, 16 Sep 2026 11:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557673;
	bh=I2Olt9+YjMalQomkzLThg8XEyAVrFSB6MKPtLeM7NYg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Zd1shYC3r+50QTibFGxnsyqv6Im8J38xZ8KKq1oGvZ9o2YCZr7HDeBIEn5cdFFUWU
	 +hdltjKsPS4UKwpydm9cbOBQNVS08XH2R4vbtHPzTLRQvbwsDcFPCibDXaDrCKWuAd
	 2gBQ5eO7P5ujOYE/OFpdnosTdZgwJUv9FkidCeQEccbnc3jBj8a3d5dotZW7TBNjyR
	 AoTMeZ3BEg8LtV8sKQeUm/yn+KlELdfcqEnvG8ASlsOQaofzzVyMOld+CITekDGYvV
	 5lCqlGHHmoF7fD0DoP0PldKEhRtmQo/r5MmDXTSHkyEqhlgeRd8TSd17IoZV7vRRXW
	 7OEvAh2MRhcwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 937AB39D5FF7;
	Wed, 16 Sep 2026 11:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT fixes for v7.3-rc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178955760712.2572068.14336020528261045047.git-patchwork-notify@kernel.org>
Date: Wed, 16 Sep 2026 11:20:07 +0000
References: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
In-Reply-To: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Sep 2026 12:09:21 +0200 you wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT fixes for v7.3-rc, including a bunch of fixes
> for the Amlogic T7/Khadas VIM4.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT fixes for v7.3-rc
    https://git.kernel.org/soc/soc/c/ce55a6545a37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


