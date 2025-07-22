Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74D225A31
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217426; cv=none; b=lePwIS/CwPgVHbmPlj64hmmHX7v1TKcALorvM6UZxeWlDXv41D8cfGXN4/BFapZpZHTN0KGr76HfiEqavrM7lhgRMaOo8aRH7QbHx5H1W7JO+JsEKG8iwH3+v/5mDFnOzx3OsHNaFtoX3nm00TgVxZt5mPoUgec8OZU+S+LdtEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217426; c=relaxed/simple;
	bh=WnzNSD45kNTnv1lXxCJ4CTWmkyMP481rENM97W431PQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=POZxfHYVvMD6l0c4xY66zNo+OxmhHy39U0cOP+B8MlRJ7yf9ONiYT/GWNIXuyc6J7iw3nJRUJ/SY4TfeXCBDJ6b2M63qcVJrrcqyP8viMnl/Ix+BWeDjUFoKdehR9ywg6t413GYRpm0BVzD6JH1T4kWps84qgebkbOubhJonxEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmF0sSx6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmF0sSx6"
Received: by smtp.kernel.org (Postfix)
	id 1C09FC4CEF4; Tue, 22 Jul 2025 20:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A97C4CEEB;
	Tue, 22 Jul 2025 20:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217426;
	bh=WnzNSD45kNTnv1lXxCJ4CTWmkyMP481rENM97W431PQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NmF0sSx6p2JQg2a7KidZnKiK8yf0kKYtNz5PZehP43QMA2Btlbj441hUq8nUclgG6
	 xrpZ2eh8dopCSs7ke9zlwEdatIzOa55BnyBtx/PzAQSGntWW+6ACY81M1LFgH0WqCF
	 OscrcCgITDLYyYepWgyvTYU9D2Gfw9ekKsN9+HTZZoWyePe5hxjF1PQ6GqjUDCMWcK
	 EqIO894Fno0Jn5uzB7Y92IfEqHRuGxqPTLZTRCQ1byT38tz5oZbIiQR0NgLPbb4tMf
	 w1t6BRv0WSsvjeaTjkfm2dT2LTf4mgXr3UjSjAt7WuVkyAy08i+hPOxv/AwKkPvWmj
	 E094uBaCqomKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC47383BF5D;
	Tue, 22 Jul 2025 20:50:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm32 DeviceTree updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321744424.949540.18366577995782930526.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:44 +0000
References: <20250720030959.285762-1-andersson@kernel.org>
In-Reply-To: <20250720030959.285762-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 19 Jul 2025 22:09:58 -0500 you wrote:
> The following changes since commit fb84f0ec527c50c54ab662d45c441f6789ec3550:
> 
>   ARM: dts: qcom: msm8974-sony-xperia-rhine: Add alias for mmc0 & mmc1 (2025-06-11 21:40:14 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.17-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm32 DeviceTree updates for v6.17
    https://git.kernel.org/soc/soc/c/7824d9e7f9bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


