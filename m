Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539482C3245
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 20:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037009; cv=none; b=TTPxxeqg6NFyPaSkBwkH+u2b+eMoMPIRFz6QBONXRxYpaqnpxYp2wdixEwleBKQypzYnyr/BuV8ko4Gb2Je+cIa0FYV9SOBdUnzdIK90v3WaZkH+ngTRwIt7UWnVeX1mUI9p8IqjhAE1+viRlZJ+4ZIT1fA+xKtasGSCyf/kJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037009; c=relaxed/simple;
	bh=ih1uYaasBqGhcxnW0iqRyyhwF0G1roVtw38PABgaaQc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JUP4gMihFC5NLsUP/3USraXFlVpfHcRZ5SYmMPviqU77bM27aolaJzDyJS6HJrpBE1tf+BVTdtxq6QLHLTcDX2aAuNMkNYF/vC/x61/mu1xynijZKoBMHBP6c6TIc6K6eElrnTJawwqIOFM1MF0G9n2toATYKEO3vd2lOhQJPkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkZIO9Sq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkZIO9Sq"
Received: by smtp.kernel.org (Postfix)
	id ECEAE1F00899; Tue,  9 Jun 2026 20:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CE41F00893;
	Tue,  9 Jun 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781037007;
	bh=oZAK9xb1OGffxojXwAvScb/H9Zzf41QcDyTZXmcTqhI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hkZIO9SqUTFPlR0HFCfMXZByaAgaP0yYRw8OpARw0+7Vwf3e21jyDG25GwrN+jrpn
	 WIDSxjuxPmQBuziGcVqY2CgriLl3LVI/cFjHmU7i92a1HLl3U8F5oM+WN/ClH8WPmT
	 CF39yN88COaweIqx4b0y45B4HcNPxZF7K+gSb2WfWmYVHrT78pPIFwQvJ2iRdRoTDu
	 col0kHJY8zv7NtnJbo/0wpQSD9YfBKytLAvDpb4gxTXeDbp2rCI8SodGVztkYXW5xS
	 Jm52k9skPCUQiEsmPgY5I0NAJ9ktJB8vJyYuuDzuECEza+AcXJd+3eYVGFMWkl4HKP
	 aT07eSWxz/+gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568813930A09;
	Tue,  9 Jun 2026 20:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 device tree updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178103700589.2631762.5611506002380914950.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 20:30:05 +0000
References: <20260609074103.814073-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20260609074103.814073-1-claudiu.beznea@tuxon.dev>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 Jun 2026 10:41:03 +0300 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 device tree updates for v7.2
    https://git.kernel.org/soc/soc/c/2a185da3ed58

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


