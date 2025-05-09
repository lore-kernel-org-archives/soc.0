Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21782221294
	for <soc@lists.linux.dev>; Fri,  9 May 2025 21:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746826226; cv=none; b=o7FcL9lISOjSBdt3lg9vVyanX113NBlV0YVCg8awW/KBluKscOESJd+dJuB1k/eKb9FeFOIfrihTF/MnpXfIin/Tjbf7wZ12bZR22jUW6jkYbtZZpdv4SYS4xyo27ElehQxTONrpqnrhd4SKahZ6+L+EGwpn+qpaSTyW+Omn0E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746826226; c=relaxed/simple;
	bh=PXUAScdW8EQO5N0TKnHm+wsGoIJzNzEg1HhP57KyrOM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=k/peO5eL2nQwvJ4RE0Zi7Eft40hp4VIyclBfBR/zUyI6yibmsyNk4i0/wGpQvxpu2Yk8Mn+pjtVOS4BN1HnxSvdGNBnWj82uBj8UXTqVfo5SnqxXboAKCC+VLrziURTo5YleK9OoJKPum/bQ1QmOjGU0CVHi+7ilZjpKLPil5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJoGXKrZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJoGXKrZ"
Received: by smtp.kernel.org (Postfix)
	id 9EAEAC4CEEB; Fri,  9 May 2025 21:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896F4C4CEE4;
	Fri,  9 May 2025 21:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746826225;
	bh=PXUAScdW8EQO5N0TKnHm+wsGoIJzNzEg1HhP57KyrOM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jJoGXKrZiNeOVmcUgaQhyOnpsTBNQdOjoNnDtocELUfUO6GOazcVcWkbG+f+M333R
	 5DDxXGG/PW7QY9Sy1WfEVNwzJy6wy5hMZ+voGc374l7KPnrxwIyFqaj+hdOulvAS3C
	 jQVgL81PzgtdxmCjuJQw9SN+/Lz9nbUQSy6k8ontSkhGA14AbVZM2vhrCU4KBsGj+2
	 U1hAQCY3cIEZWyfgkYOoLkKamykulOUyoSKug5n7maX0GRBwVKFCn4SdHNhs0IB8LZ
	 TwHEK6p8pgzfKPFjVV9S6CBC9vJNb/S9uwCyO1h/Wh/S+/jr28SDqCsOBGzER2mmw4
	 yYebyS/e8AJGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33A5339D61FF;
	Fri,  9 May 2025 21:31:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] memory: drivers for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174682626399.3817276.7340094156746909156.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 21:31:03 +0000
References: <20250508093451.55755-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250508093451.55755-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  8 May 2025 11:34:51 +0200 you wrote:
> Hi Arnd,
> 
> Rest of memory controller drivers.  Note: this pull *does not* contain previous
> Renesas memctrl drivers, so please pull *both*.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] memory: drivers for v6.16
    https://git.kernel.org/soc/soc/c/bddf9448039b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


