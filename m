Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179CE23BF91
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826219; cv=none; b=DKbjdLzEGn75+LXa0UflYSDeRRxfucN9SQPA9nYDXYKsFPh8u1DjxTfACyY3eK15VGx5G5uBdsdTiQTNkUoqQGXdosTqYowsMWn6YUDtKBhHzVSAM8yxSiV04LwWQZyXRJ82Znc+mEWInZzR0mi5tbpeO5uyw6hSYG3I3huHdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826219; c=relaxed/simple;
	bh=i13JJFndw9h5PF0bEhGykij6ftqK1LAORzAUjMr67C4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MiA9LYOHfNUgQApBi5saLBzAg9zBoMLaFFnSfpD2f32Y3dBqmQM4WisR2hSUBw5hG1/Rgh5PmAfc3I1XYZbuWUha79hxHTeWnmu9TTmzh0+Ml5YoeWeN+lOxzp8QkE+JAyI8nE/rVUfbKz2EIBS8FmA1P1wdbKAO0j8P8TUSSP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7UM8num; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7UM8num"
Received: by smtp.kernel.org (Postfix)
	id 31C3DC4CEEB; Fri,  9 May 2025 21:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2DFC4CEE4;
	Fri,  9 May 2025 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826217;
	bh=i13JJFndw9h5PF0bEhGykij6ftqK1LAORzAUjMr67C4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V7UM8numC2b9mipf+4faDFs50W2D0gnVDN5D9tip/WOGQ5sKU2Ylzq1eoCSComAjj
	 EdZjmx3ONb2ZdW349JaDe2pR4nEa2MeOUJuHFvRL79yovVESnFweatDlQiva/F8JJu
	 z9IzJFTgMv7X+bTL17hqE2s3FB6ARb/73924sn2yGsmsOrozeYPgukZcKeQwb73Hub
	 YRVpVGTpQ41Iyg77By7laI8hLCJeKpPImgQoz6t6qXgJNhccxNWvDESEbQ2Qt66Wdp
	 X436lp6dQUapVQabHhDqEZ4eUkfx8h0HtwOFu7Drxbx9dBcL9rfoTBRkyp3x2LVGdY
	 qBzl8rDeBc5cQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD6439D61FF;
	Fri,  9 May 2025 21:30:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682625549.3817276.124626589086269891.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:30:55 +0000
References: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250501103541.13795-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  1 May 2025 12:35:41 +0200 you wrote:
> Hi Lee,
> That's the stable tag for you to base MFD patches on top.
> 
> 
> Hi Arnd,
> Please pull it as regular drivers pull. Note this will be also shared with MFD
> tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers for v6.16
    https://git.kernel.org/soc/soc/c/7ebbb8416a4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


