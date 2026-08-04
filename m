Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A340DB2D
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874851; cv=none; b=lh7Rl/PxZ2ekXzZa9JGKxYVwHA0Shw9N8LQnbs4TWg8YgDohJa0M2VjGoQFaghV96pdpoJq6FoRL/YoNuI/xysH4mZkkU50/XuaRiLGq+vwz2sZVsFAluL+vIlh4hFm4d1EvlTCan4ghefTCZwRyOwzvWssjSPwQMrtnS+ZGg2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874851; c=relaxed/simple;
	bh=+okJ8EfWPZF6ZrzEwF4O3I4l0yvJ3kZ+IJJTck8xeHY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=utu6zsDi6FcU3SoYhHbyviEHJybmtCf4mzHz5sgNHjKW4RVFR+uQgZFaB8UT3AmsOc1gUitUB8nIzpAskS6z6tKfB/5LwECW9YXgWuV2QFbmwu9BEE6LkoLL1QJCbmJ7+Ue3Bc1gCCjxV73zzgJNDH19FFRO8bCpbedViBzl4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDC768Tx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDC768Tx"
Received: by smtp.kernel.org (Postfix)
	id BE9201F00A3A; Tue,  4 Aug 2026 20:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84A01F000E9;
	Tue,  4 Aug 2026 20:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874850;
	bh=SuhRnGoo6tomvJV0yWpV8i3/Wo88OvCTNXAmLrhW4pg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FDC768TxfdEOYHCrdiW51pKy2A2E2SCy5YLShgwj0Z4TpQ0UPtHxtg91pcqMdUL3d
	 9XFjSB1VhaEKBGtPL/aShUn7c2JoJuu5PgJH4wImGWFaa8WdscRiRRJdxVKj/I5kwo
	 k3VvVrILQZA76kn1OP7xdkYNvlWdo4kxgHxfv03p2iy+c/IDq29llRCynSjVdhyG1r
	 S5jryW7Ih9tKTrLrxaQ+/dHeOlHF3KQcqpAt/0xgFuEcr2+nLmETcfzstDVdqh9LqG
	 Oz23i0AtY/XLI9V4CKcSVYP1Ze2NrMh3RUybpeCqyMqna0cNH624oX0TxJBR9/p/hP
	 PBkUlNFCzscIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5688D39263B9;
	Tue,  4 Aug 2026 20:20:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Broadcom devicetree fixes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587481089.3769923.14044441526089673780.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:10 +0000
References: <20260730232519.2706487-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260730232519.2706487-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Jul 2026 16:25:19 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree-fixes-v2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Broadcom devicetree fixes for 7.2
    https://git.kernel.org/soc/soc/c/cf3eb490ff57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


