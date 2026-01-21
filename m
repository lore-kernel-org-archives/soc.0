Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B7926A09B
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011231; cv=none; b=lewb8+2nUp/LGqYSWIQQioVmG3uhv6EpuLVBOuyWks6+65zAc6I6nj9uFg7LaQ9RkTVeKRe+J+R53BbZ0OVFL1/xzlv42qKIj5Qr2f08JLpYTYZdHpcjkrP6piGGGFmMn0K3gfkDEyQ/f6rAw9TIu77JNyKz2vqtbnEeVdVLgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011231; c=relaxed/simple;
	bh=1lTs7QPXktAuSI23zw/GK0QnU+KL/pjWedb8e1B29es=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=S/CXmBrhbwqhNaVhka7BxLOWgwyf7HlFuR33dua0wil37mPePLVMVpRuLyeyrRP1NwcUys/yJnQJOnyUxpPQTDRYw8H0yHOo3Bm3efvCax70rhe8AmY6NikHlTM+5y1eKiXq4SvFm9gVj6XlcioxaUjLDDp8BLrnp8EQg/JHsYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkqh/u51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkqh/u51"
Received: by smtp.kernel.org (Postfix)
	id D3453C19421; Wed, 21 Jan 2026 16:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58F8C4CEF1;
	Wed, 21 Jan 2026 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011230;
	bh=1lTs7QPXktAuSI23zw/GK0QnU+KL/pjWedb8e1B29es=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hkqh/u51k174Zx1+9V2abH8LatvZ0MRxUzUVjoRE6DRlDZIF7jMPBR26ls6gELEY+
	 lMmYzxR7C+Eti7fF2lIZFPNE6DIU42+rHzQ3vXb0Tnj7sq5u83vhxyhPlcLzN8Wo0a
	 ACY8Jk2WP0YFYeT7nkpCTZirKXJfdWKxUIjaS8ebQRc0UcjO/rFxwFNrqstOIPVXU3
	 qc9cdy7N/mLepV4EpzcZ3fhitT7DUt7B+iL3OZNTkbUB+LF27lVy5iLq/O60D90XmI
	 WSt9xYrESDwPybBHsppi7EYzQDa6jwV6+ussNtUsYhZS5/PwdX3bpMblDsAeICCJXy
	 UfB7KApQWNcIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1191C3808200;
	Wed, 21 Jan 2026 16:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v6.20/v7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122659.951664.6260150833404876053.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:26 +0000
References: <20260112115021.2551442-1-sudeep.holla@arm.com>
In-Reply-To: <20260112115021.2551442-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jan 2026 11:50:16 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v6.20/v7.0
    https://git.kernel.org/soc/soc/c/7a391243d4a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


