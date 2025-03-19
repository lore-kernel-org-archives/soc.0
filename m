Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7720899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422312; cv=none; b=MHpHaeBroJuSP53AMZlXzkzTJb/9s4k9UQn3hkR0XS95/zZBqb0PYNVQu8xnnMNZY/JOWYPEVTjfeHBEjL9uSGEvv8I+9IU5Gmb1GkNQFLYq3KSs66RI9MBhWPLCSGWyvQMejsL2SjYk7xH9rWPYsa3cgAKxYzTgjaZAcAbBza8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422312; c=relaxed/simple;
	bh=nIQ6vITJdUEWHy8NNWtPmN5hsmJcnhYa26duPpNkX0A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ieAIS9UyzRPuh9rqk08LncrLISNNtvggADPAFeNeC5/d1jO1l/Y1mXmPkRFcLUBNx+YYMGn1iAamINoO5Mus2V3z26Iy3fG5rM68rWLiMafNHbwFyE+ONHQoazpkFVYbNC8+yyZfMW2J9Pbap+V/FuAR6dydO9NAUqCU8h6uwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buASlrbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buASlrbZ"
Received: by smtp.kernel.org (Postfix)
	id 15DDEC4CEE7; Wed, 19 Mar 2025 22:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0088CC4CEE4;
	Wed, 19 Mar 2025 22:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422312;
	bh=nIQ6vITJdUEWHy8NNWtPmN5hsmJcnhYa26duPpNkX0A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=buASlrbZAWOMfK+a4NrLv43P3ddumOS1OtEfcYcOQoqaS74UMxgHBIgarD3N54MKz
	 rxwADvbGdxdKsV5vYclUU90wuszJF0JOOzaLFUBaSrERQaBGBhE/UvAbc6TN7LC+jw
	 Dsp/5H5t9P1ICKUOI9donutrkRCzJlI7RKvG+FvTpN7PIVn9U6sX6C5puwzs25/Bi9
	 CoVPUab8f3Xr/B0CdLHD9Iieoa3zRRPwvCfdRaHBXr52adbJ8qVgPuPSxSZGHj9eHf
	 +Su6Uv/8K5WFnpPjPXNytw6t3irKdB+Lw3rUND8lT+N6gEYusmkaljp3QkpR6N0iVU
	 vXa7PkaKWZMMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAED13806654;
	Wed, 19 Mar 2025 22:12:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234749.1211847.9716154794258813064.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:27 +0000
References: <CAHTX3d+u1VmxP4vm0peQS-ST7o0BuCpKUPRVCSLMfAAb=eV3Xg@mail.gmail.com>
In-Reply-To: <CAHTX3d+u1VmxP4vm0peQS-ST7o0BuCpKUPRVCSLMfAAb=eV3Xg@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Mar 2025 15:46:51 +0100 you wrote:
> Hi,
> 
> please pull these patches to your tree. One new Versal NET board is added but
> the most useful change is to start to use constants out of dt binding.
> There will be followup
> patches to migrate all SOC specific constants.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: ZynqMP DT changes for v6.15
    https://git.kernel.org/soc/soc/c/32e0c5fe6e8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


