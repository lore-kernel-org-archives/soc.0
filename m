Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DB54EECD
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170613; cv=none; b=kgWr4LwvfnpmiDoIT0E7LVirEqZP8/GW4Wg1im8/n7nYjk985LBsYDZFkVU/BOdtArj+XMdak3pdVaqgc3H7IE+U76AXMcA2wPQq4CG/Tmq0quWCNpR6Xn5itI8VSueDG/mh8IhRWkglq80zUGg0sGGcCh5KeQDmkjJdbOdOI+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170613; c=relaxed/simple;
	bh=nf8lpRSz/s6/sz6iOxXXG39xENw0jPWBz4lcYrVpuF8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Zaz+zy16aMs7qycS3WPlcCVV5LEn957cpTqeDoprCDIRda3XpWr6MdmqGlm1qzIArG2JYddxOGHDw83cO207e7LHj279oXk9WYXwrLfpq/PZxiwv1gdEqK7lN21o3k57sbrNuds9fvFw3ICwWnE2pUfbAtMb+Ys9cqgZezaqgio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2r1XM2w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2r1XM2w"
Received: by smtp.kernel.org (Postfix)
	id 700AB1F000C7; Fri, 16 Oct 2026 17:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E4A1F000C4;
	Fri, 16 Oct 2026 17:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170612;
	bh=jcrCE+J04yUcHTRLALGt/KcotE7ZI2IET7fxxaDcXdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=l2r1XM2ww4Cl2hbPa9SxHy+m8cLG0JKC3GtDMT0QsMp4mDs7CQnPwsrdnI74LBZwY
	 7cxmaU7LzzqCnJWCEksNDhRqznsiOWjvfbnJfVVwVO9yHfGFyZ9FYtIqwAw8y1YOpa
	 oi/P9ErmolAE88jSjzlRcBl0kHMbHWwqNAulCFn5YFziAXRRgwwlboer1h1YfhNzwm
	 rw+p/O7XZ6b5KrqpFQAuMO7W+1Qgx1iXy0/aT6ALOX3COAktYe+drVBQ0r2FDWWdBf
	 28NFjgrSMdMcGF+HsH0iKGVGt2EvTS5KkUZSKbZOzQrf/2nZY5Y/vwRLHdtlPVdzSF
	 /ci6NLlWBZg+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 50A4F380AA52;
	Fri, 16 Oct 2026 17:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL][3/4] RISC-V soc drivers for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179217061101.880342.8584293325585769835.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 17:10:11 +0000
References: <20261013-glitter-lingo-dce2f8d724c9@spud>
In-Reply-To: <20261013-glitter-lingo-dce2f8d724c9@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Oct 2026 16:38:28 +0100 you wrote:
> Hey folks,
> 
> Diff here contains a lot of clock bindings, so I've provided an explanation
> in the tag.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/4] RISC-V soc drivers for v7.4
    https://git.kernel.org/soc/soc/c/b45ebc4a7cfa
  - [GIT,PULL,4/4] standalone cache drivers for v7.4
    https://git.kernel.org/soc/soc/c/655e6054acfb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


