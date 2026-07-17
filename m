Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5381B42A148
	for <soc@lists.linux.dev>; Fri, 17 Jul 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298035; cv=none; b=af8q80nlZSD+51k2hAqq7uShCzobTYDUTpd51pKgK4/sUQ6YMzTsrKBB3hbmMImhhXGq+DIfhH/M4QYOmQEH4Kg1qeZjAF/A25tSKBDPrh2mKNxcYy3zblfmHsl6gjygcKFWCSHDvFA0Aq9NiaANM0KPHQLyi7KmgjKj947e7s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298035; c=relaxed/simple;
	bh=Yh3JsXY2MSd9McmnFZl1n+JKklFdu+orwpoyPxSgjR8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rhiPowpz3eJhy+hNshWoOnDpfNlAo0hEmHZDnrIPhunmQawdIv4xIyYjt1FqYggDU5GUEpCt7eIKZjTPbLGAD6b2kRhSyMuz+zW2/6ApunCGK50KkdAo/IOASQh7iG8lt+mC10OHVEHV6pSFqaBGF9wJEdCLQQQY0wIXj+aldaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiqBS3yY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiqBS3yY"
Received: by smtp.kernel.org (Postfix)
	id 0B58C1F00A3E; Fri, 17 Jul 2026 14:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FF01F000E9;
	Fri, 17 Jul 2026 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784298031;
	bh=XoMvhEgXlgN7cFQ+u4Nn1xXOXWo74eDHm0Wk5o6ZRp4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JiqBS3yYde4uEPkBeAuQqqX4qr9VQSGaBNYhYcytB4vV0C62Mw0OzBiSW8e6MXwmg
	 7EHLhD4X6aOUjyGBx4NdY2nv/gIKkVJdJjRavzYxjwq1gHn4CdbT5x13NdFz5SBmXH
	 GW31sTR8wufSOfNrxmj2yWt7Z3D9rqNstirvpM+FgfE/nW0eJxc8O/8TTa9U/KejrQ
	 8/yjqhR/kzfD+S0gBoPx1Y8D4+gfzLjHIFkj7ywcEivXSBr7EKRdPbMBa4spqnkULf
	 oRfFSpMlhPVaGVdSb/pg7RWo/UOtxhh6d0LcGo7zC5g1sXu42KdugxS9lRgX/PVxb+
	 BwmKlpRgoWWJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A3A380CEE7;
	Fri, 17 Jul 2026 14:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]  Renesas SoC fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178429800414.1738088.6392793664932801602.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jul 2026 14:20:04 +0000
References: <cover.1784193843.git.geert+renesas@glider.be>
In-Reply-To: <cover.1784193843.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Jul 2026 11:30:40 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.2
    https://git.kernel.org/soc/soc/c/3d9855d114f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


