Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DEE51D52B
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907826; cv=none; b=XIqWjaT5jU4HHv5eu/2nF3h2UFNfjD3DotfuScQE9Z41+OnaYwuLSkKckFTx6lDMFF7NlRvo89Ohmb9CpYibrZjSAWP2b8ds7nFdKaJ5jmm8boBzdsQpk40eEOOYLn95m4Pnu4TJTQVh//HapNRD2+TgprhB1QqFo3K4tnFaRqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907826; c=relaxed/simple;
	bh=a5qYhp0HtXlFeVhjoArhU4ZaXQ68Eaqh8xdPoUgFsXI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lwRVl7syTjt0eygP73Yw9EYD0AT54ZHltVblwJcWK97SLHppPBTsL1mNX6Ds/TLP8u99BKL/FuaJEc/ZX3iAFuLKsvRWyjJViIj/uKjYWRTGcJJnq3WKJvVYJ4yz+rUbWjkajw+AZhlSNCi6nhq1OPqd8w/VTTxBBNoMyZ1jMcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQ30DsSE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQ30DsSE"
Received: by smtp.kernel.org (Postfix)
	id D3E181F00893; Tue, 13 Oct 2026 16:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDF81F000FF;
	Tue, 13 Oct 2026 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907825;
	bh=+8oWP5xNu5Is0NICcP0+wr2Q6qDMT4zF6SIUObRHXc8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IQ30DsSErToaX8jO1Oa0S7MM3yA5SFYPJT7Sg1rKloEHSGjTWM+vgriMuewZpwh14
	 vBGfm29v6iZKGXXxu3sINEYXZ78kO6w1iwEcE63dxp4uH9Ob/mwZN4ReGXZihenTZr
	 hSRtyimcIVIVReGrfTJCTzi+LPrnL+lFRa00ayZr2BAKJvxnTRFHnPuDE3V3AdW6Uo
	 o191apmXShR4VMXyUItS17PDl9i9yissxAQ9gVVpu6O2hqe9xzpY2/9Y/BpQAwbMHR
	 1wLXfuU8Ed1XSCkL7MvqTnt7GSTIeosA2OAsNAHMiLDZ52lJe3Dbq1s5yjw8zu5k3M
	 rrWuSIz1Hs+Sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B437739D5FD8;
	Tue, 13 Oct 2026 16:10:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE QTEE update for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190782426.417156.7349166225974438759.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:24 +0000
References: <20261003142421.GA928135@rayden>
In-Reply-To: <20261003142421.GA928135@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 3 Oct 2026 16:24:21 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small patch for the QTEE driver in TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE QTEE update for v7.4
    https://git.kernel.org/soc/soc/c/a2f5da3f5c0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


