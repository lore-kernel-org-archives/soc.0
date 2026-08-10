Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BE93E5A2F
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380691; cv=none; b=bGSWZe+nCjU52m0+DldiwTjb+BbeyK2dpKtHVHMTBnSKAelzs5a0QHgfxPyntrNxV8oWJvg8Zl1dJzHs/uCVt3TKNGYG1dihtid372S5zizYLlElhzSeqlA+gjtnDMLSdHE96bckPprQURGSuICWqZBoJ7hi3bgB0Ka16NM+/JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380691; c=relaxed/simple;
	bh=tWJ1EE6AZ9Ngi2HRxbP16KS5B/omhrwlGoXhJKlAgFM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QMxX8J7X5hmqQfsMxVGgfIIGL8afqEEu+2msH/ndN9p1Cnx5fC2DswizTNbVAXCPB2aGFJ9JNGQsWlwwpGPHiYFwtcNVzJ79NfhdRUJNe90ULne+0sSx1RPXaUq3HlQEXFK4YAeFz5Rj6LseTbv7mbyIEZeuLPgIp6qwL5AjGn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1ilcBnZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1ilcBnZ"
Received: by smtp.kernel.org (Postfix)
	id 767AB1F00A3A; Mon, 10 Aug 2026 16:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600C11F000E9;
	Mon, 10 Aug 2026 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380690;
	bh=91GqY0gXgvTg1aazzXcD+M7F2o+rVpiFTIaRmRxjgS4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X1ilcBnZMTwcvcm+VwccYyPHVlSNfs3wsqL0DrsYds/z6pgYoQKdSoL1nWZP1206U
	 kPoIVkZsQ2yY/Q2F2auUriV8oRzsV94gRJI7lYnS0gy/YnYf1zUy3myAt81rNwP8r4
	 UKKz8ntXJ/+d2XHyJdr25MI/jE9td+DgAk6mUCdjCpLE57ymC2FXXahIG4qdiG45Uh
	 bz86mqtBz7zQJABVAv9wufk7VQ8F7pQZig0Alde21B2urJE4TtPWZsJS05C6d9dBFq
	 YwUGIP2ed9843mmciSzbN7YK4j5lm9f7qtgyV/NnxZctLMx9j6xYz+o4KX2IlrHxmc
	 SZUingya/+lbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5681F39253F2;
	Mon, 10 Aug 2026 16:50:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.3 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638064689.3872609.7382022504879061832.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:46 +0000
References: <6604532.5fSG56mABF@diego>
In-Reply-To: <6604532.5fSG56mABF@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 05 Aug 2026 19:43:26 +0200 you wrote:
> Hi soc maintainers,
> 
> One lonely patch with whitespace fixes below, and there is nothing
> more for the arm32 side pending for 7.3. So that should be end for
> this part.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 7.3 #2
    https://git.kernel.org/soc/soc/c/59944d90a996

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


