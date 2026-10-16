Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B104391822
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163432; cv=none; b=tiYBFvQlQnfX8PkRAt+RyKOpl29khHkNblVDUMklA7uHDrd6qJUXNuOl8t9P4pZ1sS8SqrTF4oCzPZlXTAAzol2+lq7e24l7iaSDl9agbMlfKLZCDXph1oL4Sx6J8LSp9iuWPu9qSeClGashV7FqF6GSlztLJFzUwkDfAWX4eH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163432; c=relaxed/simple;
	bh=pM1Rr2QaBfyWysK+Jbx1mLfnSVkSirXFuLIpmuoNLPo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bVYmwjSBC9bwZ57fc8bi5dU4yTtUS7Y8eliOtsRsasAf2zhSAV+G+7/wZHZx+qnMwgrJ9ZCY+0Lub3nMfKtVxrB8l1OMyaei/keGb3QgRdCejNdDpvkUFsDPOt6tcOgsTHX217LBtePd4sAVURfvOM7FwJofcOsGzIZyfS8zGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4wLbtrc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4wLbtrc"
Received: by smtp.kernel.org (Postfix)
	id 1EC4A1F000C5; Fri, 16 Oct 2026 15:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E91F000C4;
	Fri, 16 Oct 2026 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163431;
	bh=mTYnqi1sWf0M2sZRujmibhPrs6ajlbP0G5LsCHoWTHQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=h4wLbtrc1Rcd0Eyz/Fy9fLMFNEiY8Sr90eXKYWRS6p7bnXmImZLSTQwL5472uENG6
	 pz+vR479rXAZmmtNRsivJxAqO+M+wY5m8WD5SZltTmqW1KNoq/4Au3D5GE/nNGkzVZ
	 tRWA3TYzCkYnKWBAtNO6CDNbN/NwanoTwbNoFmI60l91nJXP39e5xxo5p+JzLq9Tu1
	 6sFKduaQfT03vhBlqZ37e204MCuTUOOhvRmB9tV2GcVXLInyR/4DR5n1jwxFZlyhUj
	 MixdsVbQngV0fSeORtLVTLfMZvBTftEpqP2ubVQCqGxwp/Q4zbSw/cVGOSXSUg3HjQ
	 gscnbcb24lvlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14AC380A966;
	Fri, 16 Oct 2026 15:10:30 +0000 (UTC)
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
 <179216342951.806834.7723188251587696860.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:29 +0000
References: <20261013-defame-busload-7eeb111f35ce@spud>
In-Reply-To: <20261013-defame-busload-7eeb111f35ce@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

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
    (no matching commit)
  - [GIT,PULL,2/4] RISC-V misc. devicetrees for v7.4
    https://git.kernel.org/soc/soc/c/928fdc6ff69b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


