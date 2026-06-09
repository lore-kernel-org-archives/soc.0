Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258BC29B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023238; cv=none; b=DGjzMLlgn6PKqBlwH/08S86o7AcGnrZftnD2ny5F07PocTUMK6AudYBxkrLwJibmVFn78l68sCZQnWY3nKlRqamGQwGN03Cg18eAsM13VVV/Xe30seSXngNo64ot9ira+e0wzQTguwuvSs1cUmzU3XV/yp/SVwbYxSPnYWJT8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023238; c=relaxed/simple;
	bh=vNjSIOY+6eioOGxbhFFa7A0fKiBkbTAVzUW0UFo6ddA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OPo3qc7HNPO+bpgy5PzvIhBBEAZbRhXO0iIEr2ij4Nv3mNurkv6vyZBVNSR37qvmvzNiab+ZJRVUbPy3QMCBDy6YvKilU8NWab7U5WBqiEg9qCIPqW/3aDHt/wmv3oa6osvxyPaZJ2K6E4364GX8DU6xXsE2+cj8KF++SyRYxIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2LvO83W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2LvO83W"
Received: by smtp.kernel.org (Postfix)
	id 2165C1F00898; Tue,  9 Jun 2026 16:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0B81F00893;
	Tue,  9 Jun 2026 16:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023237;
	bh=kbXZHFRZPcm49bOp5L/2y/fhrRu9iQQYqVZ9yKXj/+4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A2LvO83WRvIx7YZjC2y2uSNyKoIU1r/1yzKoz9reL4E+KalixFIvGwz3QV5QfZr3Y
	 /Dnmaku3X3aWhQIxEGF5m2NenEPPmnrKB5leqgY+K9ywgnbhPAQHvckJpD6PmnImaz
	 HtvwnTwOj8qxrAdr0C3k0WOYwk7FlGrZeba4JGD8PKYTYS/VxDMdBjCc7SDNjiDquE
	 ofEf16YJubGnolBiWDBJwYprwK6MOKxrAguR/BpANR8vX72ZD+v4BmplJpnVtlPlLt
	 9x89VwVmVF2NiyguOW8pJFSCb0cHtMQ0aTEV6rERdgDG0ADNYObS0fSiuc9Hz4fkS0
	 5fptk5xRAndJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B193930989;
	Tue,  9 Jun 2026 16:40:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323519.2135346.14377571738942812248.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:35 +0000
References: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260601202945.1195228-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  1 Jun 2026 13:29:44 -0700 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.2/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree changes for 7.2
    https://git.kernel.org/soc/soc/c/c52ef0229bd3
  - [GIT,PULL,2/2] Broadcom drivers changes for 7.2
    https://git.kernel.org/soc/soc/c/41be4c94b009

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


