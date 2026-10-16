Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFB054EECD
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170614; cv=none; b=R3LU+c4GQAmM9Md74lOwVigRpFuqRSCR0BmD0sifNHxkop0m/iQTaOrcoiZPe/Dp3RrX0xRAQe3d/UB49b8dRXyFjyNubQdOuk4A2XDpn5pUgZ7V0eyGRm9bjyYW3pd8I8fcQ5ugsO1oGevNGthTi8+i5JxpW1uevxyFGZRsmvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170614; c=relaxed/simple;
	bh=MmkdWas6sTp2ZTa0/UaHFepjnS4kRezCKFlN8xOqzts=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gLsCIRBSqw70Qikz9Vo7dOg6MEbU+/FdD6E0/hCqFeZPGF2iPCzwG6lsriEQuvxbgl7DIefH8zG8JN4RcgtCvTF6Fi6jVSMzI4rXUs40nec9ANpGbpBu6JOGk46TF3HIZXv0AcRsMuncdHLXNI6C8/tHMPgLTaqOr/wgw6XW+l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISC0RkS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISC0RkS7"
Received: by smtp.kernel.org (Postfix)
	id BBD051F000C6; Fri, 16 Oct 2026 17:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57951F000C5;
	Fri, 16 Oct 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170613;
	bh=BtrH+rqHwja7GUARLXh65dkh2dn9J6OO/RO6KqIzl2A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ISC0RkS7mpGbu0iKMzn6IE/n2t/zGVSGJQKb2XrIHbWTybbMat2zXOU4N52lq+TMY
	 lNH6Hxcw092ZZNWHRMo8Xs/sMZBD/8caM7B9mvzMVu6GZr6ud5Nrxd3FKlFYFHr7Ka
	 XgErbEJN/4mPVeyiHI5a6E5pulj4joW1lmfMd1e05bE95XyY2oTdnNQjR40jWQ8HAY
	 jSLdoxJYl6dI/vRl2ioltWSG0gG8ZEZ6DlfNEJLg7/0JP2NmpPGBmuDDYmx/A7unlk
	 xPWSfzM55s12Zba7v5/MeUp4y0ot+NABr/kPldzP7B/H66PwdeTxmL9YPv6/rCDjn9
	 hBSUu/2SzxOBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 99F18380AA52;
	Fri, 16 Oct 2026 17:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL][1/4] RISC-V firmware drivers for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179217061235.880342.18188905035146344677.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 17:10:12 +0000
References: <20261013-defame-busload-7eeb111f35ce@spud>
In-Reply-To: <20261013-defame-busload-7eeb111f35ce@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Oct 2026 16:14:18 +0100 you wrote:
> Hey folks,
> 
> Might be my last mini PR here, since the RISC-V SSE driver is coming via
> the actual RISC-V tree, so there'll almost certainly be a much increased
> activity here going forwards.
> 
> I'm a bit late PR wise (sorry) but I blame conferences and a busy week
> beforehand for that...
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] RISC-V firmware drivers for v7.4
    https://git.kernel.org/soc/soc/c/7c2871861461
  - [GIT,PULL,2/4] RISC-V misc. devicetrees for v7.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


