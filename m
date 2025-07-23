Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4447B238177
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303196; cv=none; b=cOT6D1v4UX2FL3GaOK/qRD3Hr/87l47WKdLNV71uUATi3kbr7A0EkDdVWPMrBwrMdTmgFcAuGqgpekK6WYmjKck/HWBaaaUiablNKTk7MSUf9mgYWs+6Q17ZFN1hMGMgEvUtZo+n2cGGfA1W5lIlpH69B10JEoQ0QqhJeFkVIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303196; c=relaxed/simple;
	bh=CVwC8JMvnQ6MIFsw8TVuc3Pj40OXC4tpEtK3giFZNdc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bE/TV4sNtTvIUrrk6oFQbUh75ZI7o4bBgpqMB6jTh356MeLMsgsvbutRiKHY25ASlXbvr0apeBsosT1qKc/7rZoPEsUoUByqtswQ5ewjcuP/OmP0Q7vN89EiLa4q4zIg94rgh/ATPY1MaFg+1msQ9zey6u1DqJZuNNufIxYxnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsNvdglP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsNvdglP"
Received: by smtp.kernel.org (Postfix)
	id 2EF1BC4CEF5; Wed, 23 Jul 2025 20:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19700C4CEE7;
	Wed, 23 Jul 2025 20:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303196;
	bh=CVwC8JMvnQ6MIFsw8TVuc3Pj40OXC4tpEtK3giFZNdc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XsNvdglPI+ZYgO8PBOnJqFLvxWSO2eIgVFkG0z9HZsWhF3eltmwr/42aShvwGWHfp
	 LPW/Y37q5Nc674wwbVxA0uxZTN/Sm76aEnkZFas49S4htzObREbhNS38GPRcNT1X/d
	 8JWvdhH7dnonbm1WIwdGx1pWAiljML1dTwYQfi+Gosq5wtKVkTKbRse7y3FiYq2JA7
	 WIbD7D7dDSmq5cECJGpbr5uOzspepAk1iD8o9p+emzCPEvjIg6eo1jgM/fKphJQsX6
	 /x6JqgJAv1tR9CbDcwly7cps3jXtALW77VR0WqkCflGioQxaq31ml7pcX/7W2HFfN8
	 9lVESYWTKn6qA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C60383BF4E;
	Wed, 23 Jul 2025 20:40:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Misc Devicetrees for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175330321402.1775141.2410364927455689661.git-patchwork-notify@kernel.org>
Date: Wed, 23 Jul 2025 20:40:14 +0000
References: <20250723-postage-skylight-597377b5f8e4@spud>
In-Reply-To: <20250723-postage-skylight-597377b5f8e4@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Jul 2025 15:42:41 +0100 you wrote:
> Hey Arnd,
> 
> Since Linus didn't release v6.17 on Sunday, here's the dts PR I
> mentioned. Not too much here, so hopefully not too late to pick it up.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Misc Devicetrees for v6.17
    https://git.kernel.org/soc/soc/c/8113e1dfbc4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


