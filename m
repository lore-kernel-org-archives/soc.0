Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5170237180
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866679; cv=none; b=AoOOp2UASFceNtwue6K2NbQKtUlIHfWDa3h7oh04JdUUUrePv55MFW/WE8Rtc7Xwa7qteoi44C7kKAw/Wja/nQBhE+yF2oCj1hPTj7GOdnshlEUTmArlD/4g5pCV32k4fY103vnElla+1eS53EwNUdIZ/32rvAYrDB5kAq2/uGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866679; c=relaxed/simple;
	bh=fbFKw7KWB776eBefTyydxcxWucuhdKEFd/zFkOHasrw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=erYFvKjrecXcIB7Ol5ot0U8lz6lTZun7W4ZY5H5B4HmDdkhed1vE0qJJEyXNuSm350231n4Z4qq38QnEZOKE9rlzK+IbJf4o8tY7xL9IQwS7ej8wKYS516Nev34EBl9kXsZhOteqRm6PWacM1acv54kIAVMgsHq8GCYzZPfyHUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKw0G6nm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKw0G6nm"
Received: by smtp.kernel.org (Postfix)
	id 9D2CFC4CEF1; Wed, 21 May 2025 22:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C4EC4CEE4;
	Wed, 21 May 2025 22:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866679;
	bh=fbFKw7KWB776eBefTyydxcxWucuhdKEFd/zFkOHasrw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KKw0G6nmHRDib4wqymf56OwkOwl5ty2LFFEfuTRJkCxnQDnS0D8DG9n595q3fVjsd
	 zVe18pm2fKtJ5NcCa0CEhjvLWN/3diZZQG8NT99dSnTpPiE38L43MIDbOfqqpaT3VR
	 5HJFJa1KxMFtxDli+G33jnBsTbWuG/cIpkddIfEVRc6ZScR/iaerZQzLcVwONnaCn0
	 70QlWhhfWE2u7VDED9YgDkeIH/Wpr91QS6WvIdOORjakvAzv9ab99jJoDZQdjJ1/T3
	 3RX8de6kSk/OJWcNMGgRu6pgu58yqdUamiQ87UszbYbi1ZA7NPT1+4zC7TRt08/Mqm
	 dLy1M83k/vDDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BC1380CEEF;
	Wed, 21 May 2025 22:31:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: nuvoton: Add pinctrl
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786671507.2299459.14723353091056467781.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:55 +0000
References: <20250515-nuvoton-arm64-dt-v1-1-25769b8c1509@codeconstruct.com.au>
In-Reply-To: <20250515-nuvoton-arm64-dt-v1-1-25769b8c1509@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 May 2025 16:15:54 +0930 you wrote:
> From: "William A. Kennington III" <william@wkennington.com>
> 
> This is critical to support multifunction pins shared between devices as
> well as generic GPIOs.
> 
> Signed-off-by: William A. Kennington III <william@wkennington.com>
> Link: https://patch.msgid.link/20250416015902.2091251-1-william@wkennington.com
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 
> [...]

Here is the summary with links:
  - arm64: dts: nuvoton: Add pinctrl
    https://git.kernel.org/soc/soc/c/7e1a0dfb3f59

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


