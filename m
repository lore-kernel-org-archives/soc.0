Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F107477E40
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907834; cv=none; b=hlwGE9pbNBBNgn+xYYAn53OE3lOyibf1VdEib7Au2k5v8ydnGGrw/8aRGSh2fXdaxmqy2fmrP434RwYFH4950PWcut29eWP3mnxudREhloLzTrMby6T9WMajBGQs7GkZwlmDlvlm573T4NM9h+pFm8NfaInutuXc/EwL4XjNoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907834; c=relaxed/simple;
	bh=T4Y1fC32aIp+y64y40TVNoPw8FQbrKlcpKn3rqXUnio=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Lms9kNU7jGXYDbYB+xxVdYtMpl08LrkaVU26hfKSD68kHl1VYuynCdYh2Fz6pJkzHdrmaZ51xICfU26+7oHPEdDzXdxM79UnSxmGZrzcGKHaxXvnv2GHsvQaIK37n7IM0hPzuIGe7vAgA4ewR79h1Pdgkknc0DG5ESuZ3mpR6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONSXX3tc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONSXX3tc"
Received: by smtp.kernel.org (Postfix)
	id 5A33F1F00893; Tue, 13 Oct 2026 16:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E831F000FF;
	Tue, 13 Oct 2026 16:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907833;
	bh=cQ4CFdFHKIpCmPDX6kHAjZbvr2y9xGx/LZiRIJcDE3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ONSXX3tcjFxJ97JJNI+dQucnqdgEuAODcQKQAI1yOll+DA4KwcIEP+se9hWPkM+8/
	 hyBATronVISFcue3zQPRJ7WR2ir/oFRtSmI1IG+hyscnCuFr5Ag16g1PHGA5mgunke
	 1qpXM4J7NAf7nk1+H4LSUkXBQ3PVzLJ9BD791ImqnoQiSEav8D2kaOXTuyu5vTzVKv
	 iWODUYFxStirWP0bWC4EsKgy8tMRga+fK0uPLQjgejzqX9gZ9BTY6dzc5Qw4ATGfKO
	 vODwaHGe8fu/3V5VVrU5LnnWcB0EQtRiJ2s9tZdMAU1wnWDcsvJBvXPH6Gs27SbTFO
	 TNpuoqPex2Ydg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4B239D5FD8;
	Tue, 13 Oct 2026 16:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc: ti: Driver updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190783176.417156.12969916523712491926.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:31 +0000
References: <20261005124915.e632elbacgr6nxgs@anyway>
In-Reply-To: <20261005124915.e632elbacgr6nxgs@anyway>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 5 Oct 2026 07:49:15 -0500 you wrote:
> Hi,
> 
> Please pull
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
    https://git.kernel.org/soc/soc/c/978a1e99a5eb
  - [GIT,PULL,2/5] arm64: defconfig: TI K3 config updates for v7.4
    https://git.kernel.org/soc/soc/c/898a0e4c9a93
  - [GIT,PULL,3/5] arm64: dts: ti: K3 updates for v7.4
    (no matching commit)
  - [GIT,PULL,4/5] MAINTAINERS: TI K3 updates for v7.4
    (no matching commit)
  - [GIT,PULL,5/5] ARM: dts: ti: keystone: Updates for v7.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


