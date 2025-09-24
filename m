Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B7285CBC
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758751815; cv=none; b=a+WY/WxSETM0zIVpcH8L6+neY/vhQXDOz6S45uN539yTf2uv39JKdVRh9ArdXlqxqs+DU4IqPkkTCwfw+yEgi/VOHtwj8mpuiQaYSYoXva0w97f0fxD1URfQ/2pOUZ9/s6RICV+UJE87vKcqbX6Wnr7mh0tMc1oDarSjYV0zAsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758751815; c=relaxed/simple;
	bh=BpVspPQu6vrcg7viTX8Rg6CmxhgoRB1INvxTgfYofhM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KzltCRKdOtgtMZHoCO0oPQ1fgmcaWpX2ED8dOZ2i4bhQxnj6+CLICk9sgbJ7L6prMJlc2RgWFXlzCQLnS8XzvkPXQl+KI8hbeYCAfdSgLSu0tRSV4haKCfRglhio3LNyRA2IkW+EuRkq0Td4jboY6fktL4eSZDb2DJ9J36TfV+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV6dvu3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV6dvu3T"
Received: by smtp.kernel.org (Postfix)
	id E77C7C4CEF8; Wed, 24 Sep 2025 22:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FBDC4CEE7;
	Wed, 24 Sep 2025 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751814;
	bh=BpVspPQu6vrcg7viTX8Rg6CmxhgoRB1INvxTgfYofhM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oV6dvu3THnvTw4Iov/Vj7XX/xAzyPu+v587nnVcjFrbzRes0lyx1IHPbU7PkPaLAp
	 mX1OUM2LcKvcaU/dtaiyF7NVnb66gwCc62HxrrDEUMCqqOAFbtm7HMT2mM2YBqo7c9
	 Rr+hrr2wGAhue8z2yGWzyPPv3rqZVL8fotfu+AEwLp6QxKeMQ751A0r4lDaNOsbw42
	 VzaCMwDRuw1XFxK65oc2Xh/IQ+xRGTrbVtzcEbr/HeBfdGsx9eEjazjl2GhxDQ7w5n
	 gEaB4n7PFjUhIfXGJGVE8dsAS0/B9UO8cPJD0pihQto5uqt2etqGav6+erRBpp6/lP
	 5VuPsHTN8xigg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CA039D0C20;
	Wed, 24 Sep 2025 22:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fix2 for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175875181113.2716298.16465530311161198160.git-patchwork-notify@kernel.org>
Date: Wed, 24 Sep 2025 22:10:11 +0000
References: <20250924083404.GA3747732@rayden>
In-Reply-To: <20250924083404.GA3747732@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Sep 2025 10:34:04 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this fix in the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fix2 for v6.17
    https://git.kernel.org/soc/soc/c/0a8c31049107

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


