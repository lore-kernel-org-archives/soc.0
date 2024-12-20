Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E62BD04
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714618; cv=none; b=sOR+AnI0fVZx/E1T7iGSeqWKYr1jNCKE/0HORwocloWC5Cf6wbZ25Z1nNkx9vQd1x3aIcjSQY9Nrr//Nhx0bVTwVVHQgRxYKVoo5vDS+0QnZWmc5MLwth6+gfuYUP5yC583jDMuMzaUeN9YEPhY8mnuXxcX7Q9Ptqzvi2dvTR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714618; c=relaxed/simple;
	bh=+qZwhyKDOIlwebZBhfzq5DyCZ18gZwb0EofVokEKtPE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sZjRguqlz4zjwU5KQpTxWcyMAvSfL9U/CNdxBYz2oqdmL9UvE6DiEeOjknm+TrYoxfSAGGHWyK3A2mPE7/DgnvFsuwcwrTNfpH0DbEFdEa6fSgyTR71ygEme2yA+HRMSwm+LUc+02QcmvnQYUB/T7UzqBhpUTJt1kEeARe9CDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHf37UtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHf37UtC"
Received: by smtp.kernel.org (Postfix)
	id AFEDCC4CED3; Fri, 20 Dec 2024 17:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994C1C4CECD;
	Fri, 20 Dec 2024 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714617;
	bh=+qZwhyKDOIlwebZBhfzq5DyCZ18gZwb0EofVokEKtPE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dHf37UtCQF/uMW/EY5oioDqs/7v+Oy5NiBxHXkr+8Wt4k2KJUeMPp2oUrDz3nEMDt
	 TVzj6vLR+s+k7X9Fm16UGkfsly7hz4hNcUTliQFKG142rBUztgsQpvVI2xQHjcpjum
	 Rqb9MVy21AJ/+MOoql8aNzm4TnlWSZ0ldBqK7LZmhFt4bKlP/Re0IkuqRN0sgDkAPp
	 6h+l8+IdnDOKRUCgxDqwYTBsjX597OuRtKX8yWCYCPhofQVvEh30ociegG3bW7lPAf
	 gJQb0ln+7N8Bg5WQxfT+B8sr9JhkrXlHQTw5bi4ajKd099xacIytnll2zXY/nttw+6
	 Te04xzX4WT/rQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE64F3806656;
	Fri, 20 Dec 2024 17:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc driver fixes for v6.13-rc4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173471463550.2963436.14675157818795214389.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 17:10:35 +0000
References: <20241218-suffrage-unfazed-fa0113072a42@spud>
In-Reply-To: <20241218-suffrage-unfazed-fa0113072a42@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Dec 2024 16:01:41 +0000 you wrote:
> Hey Arnd,
> 
> I know you sent a PR already this, so whenever you're sending another
> here's a patch for you :)
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc driver fixes for v6.13-rc4
    https://git.kernel.org/soc/soc/c/a61dae110138

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


