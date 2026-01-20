Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850735F8A9
	for <soc@lists.linux.dev>; Tue, 20 Jan 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930209; cv=none; b=kxR/cR8D6Q+SJJzXmahOEuMT5XBJgY+CsCjPkwA/CUsTzrH4t7NjkFAUaBkunjKXtxbmkNyOPDbZGX3uEr+njENqXx1wwwVXOCVFRXhTBNe6IU/Ay4v270QxzET8lWsRVpUCPUs56qCtKwm4RFAxfKm+jTqfBzjiqy5077bcvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930209; c=relaxed/simple;
	bh=BHkv8j/3Fq8m+0unIykg6EgeGcskEZ1I8Lp6O2XezOU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b68AtPKaoZ2Scnsc8eBylf3v/hi0Y+p2vI+mfK/+jHEUqaBih6AdbwMmDuuEHulGqgz0psqWcZiywGEM9je/FAqYc/x+JoqyVjqXsD5HlfkLqTuSI1DwAItnJwF2VqMocfXiMnHgAFZnAsizzVNKa+PF+5O9dJf/V6w+NBtr8kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syl1DK/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syl1DK/c"
Received: by smtp.kernel.org (Postfix)
	id 984F4C19423; Tue, 20 Jan 2026 17:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D856C16AAE;
	Tue, 20 Jan 2026 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768930208;
	bh=BHkv8j/3Fq8m+0unIykg6EgeGcskEZ1I8Lp6O2XezOU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=syl1DK/c+X2q318fxzHZcc0YHmwehqF6LXTruhjE2zeQw+pKtBgZUsKX6M/YdEmOH
	 VOnUaQ5pak1gTJSD+V8umDjlFLIsG8KO7gykpIRPxkJvAgjL74j0Vp5CvYJe9u8gVT
	 FLhSS+1HIqq2VCsphR+qrSoDj9TJYgdQtVFzM7dscnWzaRoZnRsbbExSjpzDbC4vAz
	 i+B8xfdB9xvthJyBbcTCq7FXmN+dC6Ivbtmj0j+JRXZ8hUUVkWZdTWSCsnR1vq8z0t
	 nyhyJ486LczCkAD+HAZuaa5TsdDAXz3n1hgwLKi1T6nnI0Nf5XHtSv8jfryx8gxlnf
	 dvM3eEgl20PyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4E7963810935;
	Tue, 20 Jan 2026 17:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton: First batch of arm fixes for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176893020584.535807.606999077081728720.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jan 2026 17:30:05 +0000
References: 
 <392d9247f7c15d11b115c86cba762568f37cd10f.camel@codeconstruct.com.au>
In-Reply-To: 
 <392d9247f7c15d11b115c86cba762568f37cd10f.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 Jan 2026 11:43:37 +1030 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton: First batch of arm fixes for v6.19
    https://git.kernel.org/soc/soc/c/0240c8977455

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


