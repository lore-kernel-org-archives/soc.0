Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C251AFE9
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907848; cv=none; b=piGKhArL6jDRJfcMTamzCeic9lfAmfp6cbLGdSamC/HbcQf3e0sltiSyZnQYFndbSzgnzhgkH2kwChJHwgWvSZKp70HcWdRd3olqoq/jxPzNfozNTwuUwkM/csBxHooN30T2P3pj8rlrJIvK553I0vvm/oH7HDwikRXpEG5U0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907848; c=relaxed/simple;
	bh=5lrUUyyQwpLcZx/KLC+F03DvTYhDmQOSZmXNGCrg4Bs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dbq4LvSMUyFrXMuWpDyHznBZB/ePOHKjiwVRtU/ixpEQj8AEYI8OCmRO0bBEUccuVZCM6iNY/rVB2M56W/6DpxubnfWYL9URrrE2QgG5FbSASus4ROdnAmmQo/IIOp5DD7vE64QXQ3YNhx0aaS2wNky8XRvbjbevIs40VxszyKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY5y+BLY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY5y+BLY"
Received: by smtp.kernel.org (Postfix)
	id D216D1F00893; Tue, 13 Oct 2026 16:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFB31F000FF;
	Tue, 13 Oct 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907846;
	bh=YquWlNOg1M1hVBQFgCDkbVIFBm7J8UrNOhJ5NRszmbY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WY5y+BLYDqxMlKnO1UsUfSfKOMjlgg3LN8KOm1SCVPI7LD5OddI3N1kaAaDlrtoyf
	 Y6LaxzXavIJlWpsIzofYpCRXKtDSJNoqdum62dgk1m62SOlLCy8aeb2NKwtOy1FHXE
	 QIbBHFyigk6ItvnwUDuHdIn+GKVB9TclPsERDlYiNMtVND7Pf9K2dX9ZL9mJBCSPIY
	 A/NHFONbEVM540oik/U1MC91FoKMq5RyF9Idrp/g/YkKVe9UGUgLGAB0wH8ePxPgcA
	 EYHGI7++9ii83WrEoZXiyhsn6zzEH+AnWkW3KKOIFhan9dqCtLsiWLTumEJF1unKlx
	 Wf8Tkx2STq8MQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B463B39D5FD8;
	Tue, 13 Oct 2026 16:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] SoCFPGA DTS updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190784527.417156.1172897057001665375.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:45 +0000
References: <20261008164735.566333-1-dinguyen@kernel.org>
In-Reply-To: <20261008164735.566333-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  8 Oct 2026 11:47:35 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.4
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] SoCFPGA DTS updates for v7.4
    (no matching commit)
  - [GIT,PULL,2/2] MAINTAINERS: socfpga: update for v7.4
    https://git.kernel.org/soc/soc/c/41eb191bcd8f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


