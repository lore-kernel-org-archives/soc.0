Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CBFEAC7
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724357; cv=none; b=ebv1zLZZnIwwZF3fSw3RWpAkj23fNCZIovmFmonsDYFLYin1q77iHYx1/BbSsc2OgAOHdnIntZqFWd/MESzeEOLWw1EdvDAk9qiDLT8PSwTL0CEA54dLTpEn7gwYn1S1aEI9b7W1Xz+M6awzAWUZQjdiamUayNObkAY3plbLn90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724357; c=relaxed/simple;
	bh=ApXJZKiziSHPz6e56NygLm32cgn+ueyotKpgvh8W+t0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dpTk1TjTzkhRSHuoiPdS6i6E5aTYzkj2/mLe+mdA6cFGSKytGTWu0f9Oxmeh7Ayd4hmTiqLm+NQI9MYm/h1sVtM1eqyw9LwKWKGH1+W1duKAHdZfXZluVkYwUZLfeGbF5fAhzDmqkOephfwmGSoHFkI19ULzSvg5Z6QXqkg8bYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clWyN46X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clWyN46X"
Received: by smtp.kernel.org (Postfix)
	id 77BFBC4CEF8; Mon,  1 Sep 2025 10:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8F8C4CEF0;
	Mon,  1 Sep 2025 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724354;
	bh=ApXJZKiziSHPz6e56NygLm32cgn+ueyotKpgvh8W+t0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=clWyN46X5jf3/3IxSmol6YUK7WDFtUq8IN7TQcm4n6XZgddxHTIE4Vhs1e8L9tOhK
	 I6UU1fOKeESo4MYaCi9dro5UzG/f5PotSQROxZ04G6BmlNQGA6Auum60F+WszQxZyL
	 f+co5YoDH6OFjTIXNDMlEKGhRWEfKs6en5Ngp6afhFHPq41FLSEuIK7VShzo7WLo/U
	 EjmZsOlJYJR2j0E7hVUlOWnpN8vA2eHmGTFD8LBGVsXW56HKY48nURnl9jO6xI73bs
	 2ScG2ickjRP0fuK8wjChQID6JyI5F5PjoeqnSTDtsiJH56Pk4hw7aGc1K3EpyLd9El
	 ZfgIed1vZukWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D04383BF4E;
	Mon,  1 Sep 2025 10:59:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: early devicetree changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672436025.3681523.5852506565913716862.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:59:20 +0000
References: 
 <5e7e5d2cedb3bb232420ad720c857b95d8c02f21.camel@codeconstruct.com.au>
In-Reply-To: 
 <5e7e5d2cedb3bb232420ad720c857b95d8c02f21.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Aug 2025 11:19:10 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton: early devicetree changes for 6.18
    https://git.kernel.org/soc/soc/c/921e41c4465e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


