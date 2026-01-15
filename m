Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21439A805
	for <soc@lists.linux.dev>; Thu, 15 Jan 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496762; cv=none; b=TU5IlqCTGUjPUHekIclFyS/E7882ZIXu2cAaCPfyGNueFDmvzI8QJcNAJN+tfad/96ufaS749Uwo1jCgTW5pAyzNaktEQQ5yADDGuqFQXl2VnV4h1Kz4kU+FuNpNXb+K6eIdjWIUz/kgim6S47RP6emJ3+jm2YpcIRzFZt+RsLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496762; c=relaxed/simple;
	bh=wl1yPbhjuhFa25Cc0EZfScY7RPRxzNc9IcYiEmhlLgk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=D7bBu0aDmF7qJniYjx9HZdN4W+vMGXCgi3DPHhOOVm8/1KSW5FESO1mDXMedyV9l4Wz9kzhZc6pbjorMrqGumZKN/Dpl2rYfNtXo5dbfCxoOiYqUGiY4r7+i6szR930aDm2wlJGwSyfT/KkIxgEOihprUiA2vRdlK2tS+EM42xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzHUtfRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzHUtfRt"
Received: by smtp.kernel.org (Postfix)
	id 2BE46C19423; Thu, 15 Jan 2026 17:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16288C116D0;
	Thu, 15 Jan 2026 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496762;
	bh=wl1yPbhjuhFa25Cc0EZfScY7RPRxzNc9IcYiEmhlLgk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bzHUtfRtMJpDrNUe9tYQmodF3pZK+KdUnyS6G/KHUeEwQrWyTu7+nPFXdeeEwME2W
	 fdxusHo5kSfdrsJ290sWUGvcdhV2Cc1Q/eeb1rHtonP1n1LQXD++VO6MhI1NpkKEsK
	 8ct0V7/+BJZsKLEAKEDgSmc4BtsJdi4dEOToRwMh9yDeaE5FYmCUunB6OLS+o3r2Q5
	 q2how+GAHwE7zEExdtYBBLjmfZcRUIFna9CdvaKkdQvhz7Qv7MWECNvQLuf+0EHXfs
	 dW3kA/n2CkdZNNzBw0hKVc33TMaRsGiy5Zo0nSVNQYmSOqXd+gkqZSHmTLwmnPTQGW
	 BVxSj9O1D+aRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78B5C380A966;
	Thu, 15 Jan 2026 17:02:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176849655429.4073327.7600945342741044764.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jan 2026 17:02:34 +0000
References: <17171017.hlxOUv9cDv@diego>
In-Reply-To: <17171017.hlxOUv9cDv@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Jan 2026 14:45:22 +0100 you wrote:
> Hi SoC maintainers,
> 
> please find a below some Rockchip fixes for the current 6.19 release-cycle.
> 
> Please pull
> 
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.19 #1
    https://git.kernel.org/soc/soc/c/4ead53ba5071

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


