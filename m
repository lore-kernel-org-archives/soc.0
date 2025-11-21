Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C02BEC44
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756561; cv=none; b=k7zmp6QNJyMzCTG1FTVa07GJ7dF0ea4CbVmrS9pWvSPQA+r83RYtofROPJeAHFbHjCoYv7oFWBpLm8/v7i1xV9udnV191WzsrKYFBXO/ZxxFzOi1tUKMLW6SawX+yIfwiPtWg7gXt2SPbBcd0ntpurHd3ULt73x3dT8ukY5gFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756561; c=relaxed/simple;
	bh=9YMoUUni+aqgwtDhH7kKJxCjkICKbC5jbeA1A+YZ/i4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Z0WvEOMKGpOEtRMFy2jPrKBdjtX+IpEvfBtE2nrkC6e7TZm/I0knl9esgcwR7fF6EAMwSwuZrg+1ZiGkfEXyd7q7/z3JTM153P4RIRS7NVKKpESJkLSQQE7PPO8cSmxWD5+dGkKyDHnz10tbBSrNk4znU4IFGQ4FLSvK26i8er4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDYhAEGv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDYhAEGv"
Received: by smtp.kernel.org (Postfix)
	id B4C36C116C6; Fri, 21 Nov 2025 20:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F266C4CEF1;
	Fri, 21 Nov 2025 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756560;
	bh=9YMoUUni+aqgwtDhH7kKJxCjkICKbC5jbeA1A+YZ/i4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kDYhAEGvSlk4DYpSsuQ8qUjagFJVeBWG4hUMcoKngQxn/BgpRbN1o8Rmg5uma25Wg
	 YpvV5gWepudpyINnryDlNEqUNPvR1wZeJmAOwGJUrZELYCvS216CUkEGfatB9g93pK
	 2P0RXttQUetIvqJk9ZNYCHueeiLnDYHG9VQKqFSy9f5dmuVWclXM9CCW9nB0nobFpS
	 0hBsvHU6Qa3nS0uQ+hDNQiZUdsenYYA+LjleG050IHCTumtlQX+ZHBOv09NNm+n+Kg
	 90OzCQKRJFba9PNn+aM77eOUK4BqdbPqR4SyhlKJIZVeQabrUco9bJmv/p/Vv48vmy
	 7bACJGJ2kPbRg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CAA3A78A68;
	Fri, 21 Nov 2025 20:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375652511.2571237.7836456667798357873.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:22:05 +0000
References: <aRDFOnmcW6GIJ6bt@x1>
In-Reply-To: <aRDFOnmcW6GIJ6bt@x1>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 9 Nov 2025 08:45:46 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V T-HEAD Devicetrees for v6.19
    https://git.kernel.org/soc/soc/c/7e90eede6b92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


