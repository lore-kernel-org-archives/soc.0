Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C951E18DB35
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111909; cv=none; b=koqcVfJFfWWpgPMr5ll/IdBUIC3W4C+qS1Twr1NeyupF0ivcU7unASlOL9mMLM9tjsMS1GETTWJC4Mt5waJFYWg/YbQTzPIpzipGDFgfh6wfeiuzGq6axON3o/1LStW6mFmFCs5hxxmET7kOMU+FYW6vcfKxr9nvEwmYQinVaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111909; c=relaxed/simple;
	bh=Ubh1GsVQsE+QUyOM9qCleJssVpm1CD5wj4BP2O0xnYg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GJ+W2i0ghefJ9dqrdZvgi398ZD9TV2fxHS2Q15RC/d/PFwOH89bKSqBBnrJfCHcXTZIqn7gjhODtagMYn/P9WjED3qyCVe9czLLu9YzvIhzz0k0ICoTMJr/LkNPHlhu122u3Sb35kIKcJQrzikosj7ILaZG9/H35YwUMzN/70U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScDIHaw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScDIHaw2"
Received: by smtp.kernel.org (Postfix)
	id 7AFB8C4CEF4; Mon, 21 Jul 2025 15:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655F2C4CEED;
	Mon, 21 Jul 2025 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111909;
	bh=Ubh1GsVQsE+QUyOM9qCleJssVpm1CD5wj4BP2O0xnYg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ScDIHaw2Zkkz0Q/J8sVBmKEVstZUtfwAFU518FytzSQhSXKb+xLTQ/fCOWP/3MRDH
	 wGrWKT58xh0q90SjAvPzjFMvqDREK7ggFMJ7nDgUtgfis6t53b9njen/Bs0KUm+bln
	 7iwuBIUWBE2pLRAi1IC/1oQARgGgmx7mCHNHFjnYZis2trXA7iFnJld4TMNIDG5fKH
	 BKyahcCAW7s1X2Qo0th2THX8h1o7leDeuyIlP4i9mOz7hsQ/CI5WIDhxqw+IF7Pd8j
	 dA9K6uybxq4b+wAP/HVH4bXs5rHMo9+0iQBMCMAluJIGbHztRLeRGZw8q6nbM291DQ
	 8udcX/oqN1A/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D6F383B266;
	Mon, 21 Jul 2025 15:32:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311192825.94241.11000772896570883971.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:08 +0000
References: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250630190216.1518354-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jun 2025 12:02:12 -0700 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
    (no matching commit)
  - [GIT,PULL,2/5] Broadcom devicetree changes for 6.17
    (no matching commit)
  - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.17
    (no matching commit)
  - [GIT,PULL,4/5] Broadcom drivers changes for 6.17
    https://git.kernel.org/soc/soc/c/aee4eeec7e5e
  - [GIT,PULL,5/5] Broadcom maintainers changes for 6.17
    https://git.kernel.org/soc/soc/c/2b12a400dd94

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


