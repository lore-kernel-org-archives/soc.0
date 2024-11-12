Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0C2010E3
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450708; cv=none; b=UYg3oiEkU4yTqIxNsMDAUa+zazgyECn70moxtw8Vuaw7ervdsB7LfoYtcgikJYUPcQjhRwjLbycKQhw1mvy2gYx9fBW+tEHBqX4CjlynIvjyI3PGqjnrbbuMjfWSOFW0Mf8yW9PhzZl7aSbywe9eHprOUjvlRQf3ZPAiMy0PM20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450708; c=relaxed/simple;
	bh=Fz6+QLj1M5lzPUhpYX23YGf8gyTNH8Mn1aNurX9I96w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eCtFCIfrT8oZq4HAA84adn9hTLhO0jxGRuYRs5vW+FJoqnnSCkR4274DpF64C0XFm5WBabuN1vtnFrHfNsVwvnez//+vmkBxXVdnVzcjNBV9u/NrovG6LLYqINenOl15+uJyDMUTCZM1e6J/yo1KdxTpbv4kYCogi+ylALZvQ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5mQCfKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5mQCfKU"
Received: by smtp.kernel.org (Postfix)
	id C3A61C4CED7; Tue, 12 Nov 2024 22:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE153C4CED5;
	Tue, 12 Nov 2024 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450707;
	bh=Fz6+QLj1M5lzPUhpYX23YGf8gyTNH8Mn1aNurX9I96w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b5mQCfKUjn3OrO3O3LPiBXO1T+jM22TmCsm66vraoyaTvrOtRKq7DjXUEVxowRRLB
	 vCMgkf+Rkh46uQpz1yI1OtTgzBvu3i0eIIV4dFkYsQNh3rSbaqfNOLI46Otm2h5cQ/
	 F01m4mLI76xihAndSRdjjNeiV4ItZENQ9P7Rqm+Y1Feka+ggc21u1vJ9GWDkNrin8y
	 CUG522GzTdIa1FhNod5iGOJwBdJUaBrRRyW9T++dH7rV9H4SOiiMjuYxTg4c01y8Sd
	 z/SoAxzylvoANpZGDGGS8cP6aHvrPgn8dmx9hXarpR3UF0birtiYAJhutb5qmh+vXf
	 90pQoGmJPRs+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A963809A80;
	Tue, 12 Nov 2024 22:31:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071775.694695.9137357646375285074.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:57 +0000
References: <6fb3d64a-3913-4db0-9cdc-336af32a88a9@linaro.org>
In-Reply-To: <6fb3d64a-3913-4db0-9cdc-336af32a88a9@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 14:45:55 +0100 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.13, with
> PWM for A1 & C3, missing properties & typo fix.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.13
    https://git.kernel.org/soc/soc/c/f0cba6f52394

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


