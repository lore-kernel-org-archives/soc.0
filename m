Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3637742B335
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688435; cv=none; b=i0LRBqMxdHT9n3g2lLQ5GjwLFdWT45Hs6RuzpFzp/UBZ/uQwEMLPs7gcG7pnZ9lBrZrptMTwesmQcJJeiLq4Fy6TLZ+GExgHNcWBa04rRyKy5EIGj4kyNMB7Y4tuE1uwXcmxjIBNJD305N2m2RBi9fn9IwpBol3Ketoyz5Rd3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688435; c=relaxed/simple;
	bh=aOcSgsSn3vfgS/aiq+HZS5G6nJgcVQeyv4yvV+lklOo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mkDmbsA4/oAvi11E6493HjmkvSyx03SD0CFtLOkuNbvn/hrhkSBoQ/qMjfjjX8rXRlS7Jm0LdgtztrtASOj7Edh8/9MspAEqz/Gpjwmm6AOZekppgn8KVYcdgB0eYdoPtlvh7iXaa3t/8IGboXCBc5BCnbnKBk/nUuZojnyl2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie7WENdT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie7WENdT"
Received: by smtp.kernel.org (Postfix)
	id 31D551F00A3A; Fri, 10 Jul 2026 13:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0961F00A3D;
	Fri, 10 Jul 2026 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688434;
	bh=mUS4wxCtJ80CMEUIhozn1mnZDnykkbt0usr8KkbtUt8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ie7WENdTxLpP0nlDYfp5tID7OsGUBhfBY2W8b1BkNEey1ugdC9xWNE681w+Ql72PA
	 WLo4tpEP9w9QozkDOJf92L4EhiYD9BbO0HYgpMniuOUhBS74jAoKjJ2C/xq0jG7wOF
	 aH0bw8jpGYH+h3obrLK84mwDJoyHFShX/zukdv9kkf3NvoWv/kb4ypLG/pRHP5PS0N
	 z83xBSP7YFAbefvgOIc/L0BQqEa9rdcozQn7AkzELYIf6X4VA3VdZ9kpfGevkIC34B
	 6z9xwz7+dB5YQFIuAfZcmVsAF9CBcJ52u0Ko9Yg+NS8zm2tYa2in+HxP9mzMBgKGXZ
	 Ol4yvBRVLFlHg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3212B3924F93;
	Fri, 10 Jul 2026 13:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller fixes for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178368841188.229479.9857998280828240379.git-patchwork-notify@kernel.org>
Date: Fri, 10 Jul 2026 13:00:11 +0000
References: <20260702154659.1993315-1-p.zabel@pengutronix.de>
In-Reply-To: <20260702154659.1993315-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  2 Jul 2026 17:46:59 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller fixes for v7.2
    https://git.kernel.org/soc/soc/c/459300094f1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


