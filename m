Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C72828ECD0
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863014; cv=none; b=loh4W059S9WiX4+Cb5euEbKtaT16Pd8KAjF1qdC4p7s+ffFm/dCpI+7W/xou633WosRNLTI7x2wuJjZ0y4PBjp97dlmsYguFzwzf9hju1bX5oBbo3PmnuNfZhP5hzD3E1ZY9jSnC0bnk/SwCW5iZDWxtQtnG+4pyOW1anDO9D6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863014; c=relaxed/simple;
	bh=RJwKZRPfD+EQ6y/bJoC75bD0GWgIcDLLseGcm6Cog+w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MhdnQVZ6fLWZ6G+Z8DGBEreHEz3fZ425LeR0z+Zwi5SiuDzN3rI8fVTdW8fEnAVPPRPSiV5C1n8dktgZCatasplEdwnANbzm14KNHzzOQcBWUO5zN0xCVmFf/qdxVjGEMep1hGwcwU+qu5Ga/7AnXdgg2j8OkXAC3RkIWGMy3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdpXHsxQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdpXHsxQ"
Received: by smtp.kernel.org (Postfix)
	id 624D3C4CEEB; Wed, 21 May 2025 21:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0EEC4CEE4;
	Wed, 21 May 2025 21:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863014;
	bh=RJwKZRPfD+EQ6y/bJoC75bD0GWgIcDLLseGcm6Cog+w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SdpXHsxQ9UbrAH/Oh6V7ppbx6WwIJ0TJ6g0EM4S2ZHIfDvMprFpTBbxJw/w2IuUdG
	 73pvkGj/L/NlAtJzkjMP10z1uFUlsICAXGy6kPuH7jGbcKGaEr0SCjRcycGXvq7wEY
	 7m7uVoXiZkI3jN1x7z9CW+vBaoNZOQWW17Jmuwd3wUiArR1+FaZlZgflXkmNI7g4YE
	 BDxF3XokEu8Cwk4E9rprZgiK2pdAhL4YFEjea6zCzZR0y6lT8kbSUm69B/TONSC/F1
	 X9XqK3bLhc1tzl8ZhS+sFmjWLmYBgEV65wZpAxV7Gi0YnPo1Qe2ZnpVIc/wbrXjsiO
	 WWBAAgD4z/KYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DDB380CEEF;
	Wed, 21 May 2025 21:30:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo SoC for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786304974.2284637.16399403522251120440.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 21:30:49 +0000
References: <MA0P287MB2262B041A26A0F5EAD1E296CFE91A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262B041A26A0F5EAD1E296CFE91A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 May 2025 11:40:23 +0800 you wrote:
> Hey Arnd,
> 
> Please pull soc changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo SoC for v6.16
    https://git.kernel.org/soc/soc/c/6333f2974ce9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


