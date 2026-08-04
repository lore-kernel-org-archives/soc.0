Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2E42AF84
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874876; cv=none; b=PjvDX4om0Il5VJxeL15NFN+exccozt3WJHiKqqSDMWAzLMHGC6Cab8QmEiP6hfM/YxOMERLN6VHG0yWjYVf7YM9c/bpd39Ku4Jpq4olpJrWdY1Shw+fFjkisQXyaBa6C8myCoXgBFh3Em4fjpcwO/w8Jn20Wif4a9BqBKBDMREM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874876; c=relaxed/simple;
	bh=Bewjw4TlV3jNcVo0YeRCwoqgyIXKHrPvCE2O0ImW4hI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cpqVidrQOkgGWu7VrIGWHmqhefkd6VfJnHh9Y/acrHsepTNL3rTpKUNe/UJ6/ecPl+RvB5stRe8ENErwATlUe5Qy2yIBiqnFM4hV3mUMhOhIFy7DsuXQ5YyZzDkJnDtKP2NQY8TnIr8XI8a5e8CSJv47oS/MjM7qRMdfIn0qxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9Xtg2Ov; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9Xtg2Ov"
Received: by smtp.kernel.org (Postfix)
	id BCCED1F00A3E; Tue,  4 Aug 2026 20:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63931F000E9;
	Tue,  4 Aug 2026 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874872;
	bh=nmWCXPQLAOCt+wahan08Hptd+JEckGe5USgLQY3bEvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=T9Xtg2OvyT5GEYce1CiHaP47Y3Dp3NDmi84tEUOc7waIR2GmosfQGE71HpBPkddiv
	 4I8q58dayjDnQzKMvBF2k6c96jVX7/wrQ2KF1Tz0jeuvRwO5KPnDd8Wq0f8jmLRQno
	 NhknjHsBbWgrNO2fuNe6O3znBI5s7VuJzrXXyIv0Syqm0ybQFxKVe/lJ0PbUDHI184
	 tPf0oei/MFoCZA/OT6h2gEfd2QdpOvJcI5wIsmm47az0azZ0VHr3WXiwRfNQXtZMQ3
	 ffY6G6bMHKjuPEsKPnhBxredD3Px70Aw5OvQ+SiQ6Ht7yYr5yJdA5Qs3DfJCYl7muU
	 001CsCOYZbPwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568BC39263B9;
	Tue,  4 Aug 2026 20:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: drivers: omap updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587483288.3769923.16096258792687994637.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:32 +0000
References: <7hzez3i4le.fsf@baylibre.com>
In-Reply-To: <7hzez3i4le.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 03 Aug 2026 08:52:29 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/drivers-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: drivers: omap updates for v7.3
    https://git.kernel.org/soc/soc/c/67be500fa08c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


