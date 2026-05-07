Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D92DF136
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159585; cv=none; b=qSeUZo3hkcPlRSwDLS90aq7qnKQ1KiFlfmeqnbbG0CxaCZo2jI4wwh6VWNhweHzuvoDMULrpRuDHuzz24vXN8IUqvoYKTVPux+lpCfm+M3C84YgV3Wh5hAxEn9Og17xc2r49x0FKm7YpQExjc9UzwZcgguEeD94BGrieJ41ny1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159585; c=relaxed/simple;
	bh=KlD2E0xwHujn6x5369BleUt3T3W2w91q2wpf4pUlWAQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sY/cyAqA1yaFcsnP1Y1X5vMEraQ75PRV3aTw6SFcWdw4mJRTiQEtjYwpPUovK0FG3LiW9K3cFrii1ek0k7sEEWG3wvS1zuZ+rHtBhZRvXfRjWYvLWUG7PqrWY8M1OCdBn3HSaxuQDCS6MkEr667zweS6C4cG/xO81tyesau4U2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cetdE53o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cetdE53o"
Received: by smtp.kernel.org (Postfix)
	id 5E697C2BCB8; Thu,  7 May 2026 13:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CFBC2BCB2;
	Thu,  7 May 2026 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159585;
	bh=KlD2E0xwHujn6x5369BleUt3T3W2w91q2wpf4pUlWAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cetdE53oCg0eAw03quWlEc39Q4Nv1DDeo2t9gS9g6u6zANxBCbCXyntBwjJ0/nDaW
	 hofxrfVOJruOFCmsVCdz93NPkq9iyfKYdLrWcal7jWlydC2ODjKQi//wYxJgSpb/vx
	 V3SyI1kcxbntiXjPiwiSCNVeptxbcLlm8J1QEITVXMJGFsfNKKSr+xeBp226+3LJ93
	 Viiftb+taKc/ZVXb9k3f327QMCfZgtGFvgP9+S+vsikGC2PvUfT202i1YVJ8kHwvj8
	 Wz3EVOUmuF2NHGdY8Yyd5XpNJhe07/b/o0ubB9xIiszvdEKWn2t0IKHaG8X7GBH5X+
	 c7s41/HpvNnJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9D9B39308F7;
	Thu,  7 May 2026 13:12:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] pinctrl qcom defconfg changes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815953429.3933061.1558882552272426536.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:14 +0000
References: 
 <CAD++jLnf-3JivT-7MtCdnx9DRG2MMvvZWcsFdLxWM6416Nr=qg@mail.gmail.com>
In-Reply-To: 
 <CAD++jLnf-3JivT-7MtCdnx9DRG2MMvvZWcsFdLxWM6416Nr=qg@mail.gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 May 2026 21:23:22 +0200 you wrote:
> Hi SoC mainatiners,
> 
> this is a split-off of the defconfig changes affecting pincontrol
> for qcom platforms in the  next kernel cycle.
> 
> The changes from the pinctrl tree cause conflicts with the
> soc tree, at the same time it is nice to have these changes
> in the pinctrl tree for coherency.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] pinctrl qcom defconfg changes for v7.2
    https://git.kernel.org/soc/soc/c/da501bcdb132

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


