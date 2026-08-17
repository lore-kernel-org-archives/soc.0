Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344F317144
	for <soc@lists.linux.dev>; Mon, 17 Aug 2026 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975254; cv=none; b=UcEQtQGMRXYf5NdyUhij8N9jlH4tLsFSCcLwiKoxgn/eQWPc7BXhxGExuFFBCtU7h3pF3YbdG4e++owfInPDdWp+tqkGn0p/fpGorxXGYGM82Z4b6G30edsCzUso9DRpgvEowXdPWTYImeuOkGWn3Lp/EW3IjPaUstD1DeXOdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975254; c=relaxed/simple;
	bh=gSAwnRYqlIusvXnklkVrGPvtI4rHfacJlr6nTOHfoFA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CEWv+TPLzSKRPyIpp7oR8p0lrmyeP0CVTMrSYZU5skvDtNTPtL/GF0dU/ItmfH+VJRXC+gA0WEw0b4AzUmvtKtJwVJzvrPR0xtK43jhJtdrhihziMnyTUrwCEN9kF50mRfun+wtp7GiyBO6d2AYIa/a/NuAgyIoJjj0rl/oKK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvebxVFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvebxVFA"
Received: by smtp.kernel.org (Postfix)
	id 9F0AC1F00A3D; Mon, 17 Aug 2026 14:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D361F00A3A;
	Mon, 17 Aug 2026 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786975253;
	bh=8SOGsZSzHU6gLU7soQw568+JNorpUqLepsI7JkdzkSo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RvebxVFAsKeHEE2hwtY3bTDIiRCEr8XgRn6ILHJ/0Osw07YgzeKS4svbWpv/L+LLr
	 1h78USwEduxphvIct5hYj0ZofNfoeZn77PWpLnFBofpLG3T9gvVoj0dzFSHoJvpfUI
	 JJ0pG4Y4BzkL6XLJ4VAb6C1a2dhHA7LN2TphixFc8aGDBeOKs9zFhsmc2l1nFnLR6M
	 /mSpD64MXlHGMR3DIrqPNOJNJcLl2xCeGrlglug03WkGsIZ1BZXcG4Z9RJ3063xFKc
	 OpezQ5KicuyxJKcYQGebXQP8UB4050YztD7BtbS3je3g+Zq4YX4eWwZhDO5+QJL9zD
	 jEndOEZaViB2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1983439253F1;
	Mon, 17 Aug 2026 14:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.3 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178697520563.1152135.9087891470577672386.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2026 14:00:05 +0000
References: <87lda7oku3.fsf@BLaptop.bootlin.com>
In-Reply-To: <87lda7oku3.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat, 15 Aug 2026 10:21:24 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v7.3.
> 
> Sorry for the delay. I only managed to push my branches for linux-next
> last Sunday, so I waited a few days for them to be merged before
> creating this PR.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v7.3 (#1)
    https://git.kernel.org/soc/soc/c/dfda289ad743

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


