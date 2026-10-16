Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6242931EF
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163448; cv=none; b=MrW2Yncg3AjH2RrFIS7MWpLXQdkK3mW0grMjJNWxxC/qoxbeBo3Cr/2+UPShj2nsn43JPJgLFZBsYwDqHHru/tXXmcLGtIw4f9uDZb9cFxEV7XTFL/FhpZoCHKJl+bkI8KuFsZ2kWlhDsFbvMxNI02YeiozJ5w2JCKBwHcaXF0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163448; c=relaxed/simple;
	bh=LpMsaD3mQQV8mOigAiVtBOOU7RlGEcjLgbW9kAR1gXg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OQbi9nXTW9FqRlN5ig8IMS5M7KGowiZjU2U3arWyEkMdjA35vxmOup1Epf4dYl3tsLXciiUTnacgL11+HLH1vRMJqYOD4KBtFhwmqxk13qON9QmuWraZ9zjRG0++PlTGnysaH8Di/MAAEuj6NHveEAWsbrLJoXg5u9KUshDMRUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGwNlqGr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGwNlqGr"
Received: by smtp.kernel.org (Postfix)
	id 209101F000C7; Fri, 16 Oct 2026 15:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084131F000C8;
	Fri, 16 Oct 2026 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163447;
	bh=2gONhQzwhzo1KLWIC0h80PZDMIi2jJx8uhLi2CAOZz4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aGwNlqGrN75rgfg9esUGp2zdQTQ5CrBuAx2MElqsprKSdITTzfU7n2MJnDT2/cjGN
	 DWLKdz9y2xqv/SWeE7aCwRrwBPgE6+n9NP40hEpJm4WIWoB/tcztaWdv5bmsJ6Gamm
	 vcAvZNL69Xj8SOxQuMP6lvzOrJLOKOV3hl6MkBrITcX234hM8ckQo6zTMYPB90PiCe
	 gLFZhBPCd8F7pxEkbJg//3j+lI9a2ZLTmooVgD0X4kysNQovfez1Zc9ystcvO3asbI
	 H38z0Uzg9izM5P73kgJiStUQe1qIiCkpueCrPnTXljzpUIMU6Pv10UsKPT6xK/vax3
	 A+fEjtt+W4kNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1694380A966;
	Fri, 16 Oct 2026 15:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216344546.806834.15085050685883138710.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:45 +0000
References: <asCtEGcXwUoOHyMA@x1gen8.tail89d63.ts.net>
In-Reply-To: <asCtEGcXwUoOHyMA@x1gen8.tail89d63.ts.net>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat, 3 Oct 2026 00:21:52 -0700 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V T-HEAD devicetree changes for v7.4
    https://git.kernel.org/soc/soc/c/c4ee37d50d68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


