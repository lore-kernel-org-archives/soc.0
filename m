Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A5225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217430; cv=none; b=sZQAqyWjTBAQTUpRT4yV6sRG0Wm+qdfzGhZL2GZtMwoq3IWrHBsCmEC2sbfCGUOVlJlPmq3ggXbPVlqqyvuQFRrWoywD0jxpnXJx3eCfTMENUxzrWP9uwKF2UNkokOriM2aPMDbuCVVTttaFYCYwvVynwaXtQJHE+CUkvT4GoC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217430; c=relaxed/simple;
	bh=PSVGRrjS9OFajhZOnlev+z+4Vk8T0g8fOwCJYY3545g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fO8CROPpaTJtWOKE49ZNwniYRDtnpmgIqOo1Qw/MzNZIuOzFLqBlJgjGN9knomkVzKS2kvYoZPLRdAvBIOaVoOBs1AmjGeo74qemTa10ccmrnV+8g1RgLhp7CaIn5TxFpKYj6KiNL4jXkn6BereoFCQwjjvS3epWtfh4Blz5nXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LUIWcfpu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LUIWcfpu"
Received: by smtp.kernel.org (Postfix)
	id 5CBA1C4CEF4; Tue, 22 Jul 2025 20:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47165C4CEEB;
	Tue, 22 Jul 2025 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217430;
	bh=PSVGRrjS9OFajhZOnlev+z+4Vk8T0g8fOwCJYY3545g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LUIWcfpuKHiM+e1xdJl1qFCozzaffUgSiGmmXWEATz60zZZiJe3V3Ke0MtK3DjMwT
	 OKF5xtf36U3XoF5OpkOZcN1gc1V+Lu0i3LJY8Zs9yWjo4a0LbQqb7TurGlPhf7ct9h
	 8AtpW2JduaTpRZIt+f9lYvxiitcr2VfssCSmZW5+2lO2rxCeDgO7186ffsSrtTXKxQ
	 OuCtwyg9tohNm8BmnQHmjsjS+/XFOTFo5Lt0xlI8KPFRMKBfkfyGWQbnIZev556XJm
	 xXajidY+G5gAOPhkLN9gTrxLLK0+L/u2EZuiQFJkpZVHg5DIm2aInXGqE56kTyC51r
	 gMQTqTSJVXTrg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF92383BF5D;
	Tue, 22 Jul 2025 20:50:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC defconfig for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321744849.949540.12692219614159316348.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:48 +0000
References: <20250716-defrost-regime-20a55ed925ad@spud>
In-Reply-To: <20250716-defrost-regime-20a55ed925ad@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Jul 2025 18:15:07 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a small defconfig pr. I may have some dts changes in a
> later PR if Linus doesn't tag v6.16 this weekend, but if he does then
> this is all I have for the v6.17 merge window.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC defconfig for v6.17
    https://git.kernel.org/soc/soc/c/8c25d964e837

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


