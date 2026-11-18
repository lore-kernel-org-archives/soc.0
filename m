Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017610;
	b=0mFCG/o2HwoTCBBMvRA5k1OuzTwts7vEZQmANmeHLol6qmXAphdgP5b3VfQjjfF+gq4V
	 jv2x0aiyirj8sXhfiYpdjSmDhV4fJiyKwOtzrzWAqs7PUK2KuQ8GmsEcOzTkKRx+nAc1i
	 EPYMEVP5+Wm2tlZtedP1LcwfoHQEn503BFrQQhjDAJ1n5biMMTWXgTBbt5zleD8RyeGcZ
	 CjA/EM4+VePF9YCnWBVsDcZBBVszBfcb/ibPmxsonQP8PZpjLojMqUAW7KrDipCM5XVB1
	 Md0aiq6OIpgKvrnpxoVVzwxKZlTn9IworTK6Y+T8NjJxGVocRJN5KkCT5CUMiEZNA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017610;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 References:In-Reply-To:To:Cc;
	bh=kyelZEtj3zQFKOxdMlbkRRPk4ZKvNycLMy3qdf9VaUI=;
	b=hxd6P1ULddV3mnZIJeQvPH4kDDMfq+fxp9viortAVRaxljm7lhbvUKZz2QGnnd9SNaRA
	 5FWSFCdnb3Pka4ulByJ47dDE3VD4A0iP6nPd1eufueq441wBHKOVa/ZZNoBmW2gxZCkiK
	 HMzGPNz1tmdWB1SKv54aGWZP8vR4lkOSt1+FqRmVMsoqqtDL2ja292rOWyz5HFzSjvsec
	 AArmHVkbbVMd7bTp81+QLcOM4ojHakahcijUTkRBP+fPo78Bwx11j26GhENfbY3qoajba
	 KShxc2krZI03VaJ44bLryJF5YGA3wTh45lnpX2IOTQ2M5SHx/u+HLgO1CPStp/0FZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUoEwGHM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B64606A330
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUoEwGHM
Received: by smtp.kernel.org (Postfix)
	id C71BA1F000CA; Wed, 18 Nov 2026 16:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6861F000C6;
	Wed, 18 Nov 2026 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017610;
	bh=kyelZEtj3zQFKOxdMlbkRRPk4ZKvNycLMy3qdf9VaUI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NUoEwGHM5n1F3KrTMoXGlB9uMRSCwRskuqPX2mDHrr6VMpQGLc7BIKwvdsrpA5JCO
	 IGT5f6chg/0koae3lwrabOIPOO1K7Q93PUL3vS/D9wKElUFQ2mfXO8jwr7jjnYVo6f
	 EeTnQ1z6nDEWnR144FuzVFlF2nFFqBENiuWKKyQYIsoMpJ0Dxw6sJNMzvcBESTD11a
	 s34QX46mm3kSKDIvMVVz6D/aw6WkEs7mzXM+jwTAkw/dILrn36Y/3jEslWZJO1Klks
	 a7b+xZoor/yajmdor5MPcZ52ifVX7qotfWmdn8v9dlOYV7kNpoQIwcdKy1l0V9k91W
	 jJHQmJq64Akcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9F9E43808210;
	Wed, 18 Nov 2026 16:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas SoC fixes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501760935.1802028.1953080375129394664.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 16:00:09 +0000
References: <cover.1793960114.git.geert+renesas@glider.be>
In-Reply-To: <cover.1793960114.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Nov 2026 11:17:50 +0100 you wrote:
> Hi SoC folks,
> 
> The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:
> 
>   Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.4
    https://git.kernel.org/soc/soc/c/f1a003d0141c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


