Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718D22B8DA
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043300; cv=none; b=M9wOA+QwK3kAiXThOVJvbn6tn7t1JH4mGKH5z3xR//8skj634EG+VHQXJFk5h35dM4nVSTJ9btnF1MRmDgMmyuIl0TSaKbCXkCJK2qz71ut5SRT5cEulNeuVdKLQx92loIGj+Ogk+9tYiRQgoPNcYqz7Vi3aA0xNvoMx0qtYvbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043300; c=relaxed/simple;
	bh=IPZh6fTvGZWDnAdCWJRZBs5ogmAsw4CzGoTWzwTakCs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gy9v+MMJXHpWXb9EihF6Gk+m6Lh7/NsgMmlAM9k9PjIna1YofZgbpEb1g63W1lRHFT1btvGebbfq73gymQseS0x2LmptiTHGtbanwBM5QBzu22+wri7bJLuuZQOPB3SSqC872Ndc3Wa5yHwD7MIUbVAKVFowuyVg75667Fr88rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KewBbshk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KewBbshk"
Received: by smtp.kernel.org (Postfix)
	id B1459C4CEE3; Thu, 16 Jan 2025 16:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EDFC4CED6;
	Thu, 16 Jan 2025 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043299;
	bh=IPZh6fTvGZWDnAdCWJRZBs5ogmAsw4CzGoTWzwTakCs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KewBbshkfdB7YJWDjl/BJowW89Xrbgc7Fc1Zd+p+IGVbcyzV2cbeuaxvj9CJIIskP
	 Ih8EjmhlDiwwqrx9tbtjnDctjzZj+uQVxJ9Njq8c1ObSJ/77/Hw0Odf3k3yucLh024
	 lxgIpBTvk2pCquPPdPN/VItxgsGcMKMyxTe4YMOIhMR63ypQ86vJEZSwBG15tmdxQC
	 gY6k3aY0iI+ipeue7Znj2wFm3yGiG7td8Ou45qroAPCfHaZcSxzCnA7XfCs/jr2MMP
	 sIsuKr6DE23iqCFd+fLWJkH2BhVqNTu20ID8gXZeFAroORnNU4KfiVatynfDoO9VIv
	 uL08preCI9N+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEB4380AA63;
	Thu, 16 Jan 2025 16:02:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM DT updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704332274.1501791.2781985028976010613.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:02:02 +0000
References: <77c645b3-0cdf-49f4-84e9-11c74074b9a8@linaro.org>
In-Reply-To: <77c645b3-0cdf-49f4-84e9-11c74074b9a8@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 6 Jan 2025 15:21:07 +0100 you wrote:
> Hi,
> 
> Here's a single change for Amlogic ARM DT, simply removing size and address cells
> from USB nodes when not needed.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM DT updates for v6.14
    https://git.kernel.org/soc/soc/c/fa716fe87c85

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


