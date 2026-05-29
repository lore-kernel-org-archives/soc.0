Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593B377031
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094426; cv=none; b=WhT6n/IFNzmD5aNQ5W3zcBwmto0IaIqGTshFIRU51o92FOLm8a8j/UOdIpFr3RfC3YGKthnolA+GFP5GhzTDkKX8S5/4LMYBr0T4S6ijHvraFa7ynWmbbGHBrSTST6zMgfMohNnDrBdLLhzH8VHmRnh6MW3yeCrLw1c91OKRtDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094426; c=relaxed/simple;
	bh=UDIyA6fYUtBdTVlN55SLo9WwGxInFWQc5NniBKl+W+M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Q0Jg6vFrjKL50KzhUaOJfGrncs/Hn3gUwvsiiP8aGC4L0JDwOHN9YkLoBQ32cVa2n+aB7G/6vt1g2QuU7bQJJf17TMQPKzEXEOJcipq8KZ5YHciAMaiHmYFNZi4xpboVZgHZC3X8hFXBT06JxdM9DTIp+TAjn6pUepgEN7n1mkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr0hnr4i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr0hnr4i"
Received: by smtp.kernel.org (Postfix)
	id 122951F00898; Fri, 29 May 2026 22:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDB31F00893;
	Fri, 29 May 2026 22:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094425;
	bh=wUrXXeUjOihvPXFfO//PoHN1LI9NYuBteJfmQ2o4pHQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Cr0hnr4iean7DADiznwswFLzTdqxmZZzLxr0ToUv+i1pDPL7M0Nm9I7jJSShUARbO
	 dh1uzxBazDdafI+YyKNO7IUl4bJdXTyBh9vfsPdNIpdqKW+G0YJGAUuFTc8iDAWm+Q
	 V0r/7B2s+NBc2MaAGboREQUf4FQZXgiCa/x4JuYkmzdoKGiNFJnKLphezyFg0sDdIg
	 Hvw6eJEiBIN1LRzOZxJVUFiupVj4nyutkwn0wcJQhsqAMQL7aKaa9/4mdH0ngYr7KG
	 gr2REcqrjebDk1YTHPaSxonUimPIRTpDUe4hyYO36LXNFpMX8X27yYTKxa9+elwWd3
	 +8gCGdHxkT+zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A4A39301A3;
	Fri, 29 May 2026 22:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009442838.1985625.16869713377663734040.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:28 +0000
References: <20260528185856.777407-1-sudeep.holla@kernel.org>
In-Reply-To: <20260528185856.777407-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 28 May 2026 19:58:55 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Updates for v7.2
    https://git.kernel.org/soc/soc/c/9f468bd84153

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


