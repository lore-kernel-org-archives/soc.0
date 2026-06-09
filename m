Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB64378838
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007012; cv=none; b=q6+6peagBYaV81xU5YUxfeFOv4VVBnhHmIAVVuop8DOF/oIxDhPpRVbUBckg+ep8OkOzXjw5835qxpHUD+iFbp7+uyFeuuUi45BKuGzy0CCB57ZfTPZYk5HxXgWlffuhrVDvDRtuSgrkDbA4j4QsxcIcm+zqe3q7ObXRsWKRxIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007012; c=relaxed/simple;
	bh=kAtpuGCfqNAyI+u+bW4ILCS1dQ66hkK042YvNwxuNls=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rYib68yshhxUQ7mlRIiuQXIx9JyZPKGsNxA9GND3u//2r0P9/XBrUVxqEmF2q3H7t0HsgafAPaHHK0WkQf//YTzIcSwiParaBjxhBGmN9JyAKzAJSCOHpiM0SRV7zau718qsL8g+qvBsvmmW3MGY2nVHQCo6PQtDrqUIvNz3avs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bccsSHmy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bccsSHmy"
Received: by smtp.kernel.org (Postfix)
	id 094FD1F00898; Tue,  9 Jun 2026 12:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B2E1F00893;
	Tue,  9 Jun 2026 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007010;
	bh=kqp1NQSLuphkvjdOpFONiXuXCnmBYYHmVtRDa+5R2fA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bccsSHmye5MmiaV64Qat0/GMMtQoy0XGdP7Q3/o7BmW+bG2ivaM10O8gLbtM0vXVY
	 8ibgOrhHbqFk4BI883kzkUfNxwqM4dOBRoTV5UKYgB4Rjbl0gQmqUAtqnd07F68GZJ
	 QGDXr169DX9opx3+AV5+hW316LDkZ/PKM/Vs3rSV26ggXfTRM4vvYtFD1PBP9OM+PR
	 XXPh01bOVEcR9h53aqJ5DSHi3NEMjWAt8F4ys1AdcaMg5SeV3FNRpMa+zzCoN0bMtP
	 Qh6kytDJGIt95ihBRNkpm9LIGohaEPzKHfw9u0ONe2THQuBGDcnFXoeBBPfaAD2AuL
	 WrLEPpJQrtC5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9387F39308CA;
	Tue,  9 Jun 2026 12:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: soc: updates for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178100700913.1991839.11889103665778482819.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 12:10:09 +0000
References: <7hldcpm526.fsf@baylibre.com>
In-Reply-To: <7hldcpm526.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 08 Jun 2026 08:21:05 -0700 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.2/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: soc: updates for v7.2
    https://git.kernel.org/soc/soc/c/e9282defad91

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


