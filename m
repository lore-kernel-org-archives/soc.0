Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD6254CF6E
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170617; cv=none; b=s1fYygpsd7nVosz6Ir+wwmWqPWG+x7ACXoib0QeRlnI75aB0VzNUDr06PHDe/558woda5yuq8vJsHLsoWmOWlqCq3aY/X9HAC2/cekN3hS7LLTFvtpDwxYp8a5EGPh9q+hP+twcle6IHdP3OoEldaPOdighMKyd1G9LFl5GQrAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170617; c=relaxed/simple;
	bh=U043zxGrfSe0POtgsUexE4wOSg3K8wRWWDeodx34bLk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dFQyd3AkWmSKc02mqje2b1Gd39WnV8dEoqDrtFct7OrrmSPoK4l9nwA5D/kUXJp4YfHWleQFoXImX6d2+B4LYcgrOd6DsOYhrZ1EkjKkdfIduBALDNYLRXS7/6NpBtPljEOpIcEAIbypAP9B21Pyx5DrhoUyCSAIucUL2cIBWXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcS+bm/f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcS+bm/f"
Received: by smtp.kernel.org (Postfix)
	id 966BE1F000C7; Fri, 16 Oct 2026 17:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805CC1F000C5;
	Fri, 16 Oct 2026 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170616;
	bh=kEZPIu4sifRo/tabGxX2rsctoZh+pXLXc/8atw7+Eds=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=GcS+bm/fQlMeaggsi0VTEZb1589k7srMjeoJSK3kV0cMZCWYsXZBr2eCPQe2oMUqE
	 GxpXlousQ7locqb7io353DsE+xCNkiCD6GcHvgn5ayNSfOogCcpY0VOPW5EuArk53M
	 vOWzaq5JYHGjoqwaMwjUK8N5c7ge+gZZTwSJM4OTZ/TyurrakTczUOYhyQZmzDCvJU
	 tsAvyw/isHCHJ6fUQ9L3IVnRPaYCl26o+z7ykSjcYmaCOm4tR+bwhmgOyJbvT+NZps
	 /G7HTaNHIyVhKzi+0n15zQQnBwU60cN760n8cJHZNk6mT0KZqK8qzF0sMtd6jgfD30
	 hkKoaP3snC1EA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773B3380AA52;
	Fri, 16 Oct 2026 17:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation
 producers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179217061501.880342.4933123827965277972.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 17:10:15 +0000
References: <20261016013918.3492835-1-mhun512@gmail.com>
In-Reply-To: <20261016013918.3492835-1-mhun512@gmail.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Oct 2026 21:39:18 -0400 you wrote:
> The legacy MCU IRQ thread can requeue button-release emulation work
> after its managed cleanup has canceled it. Since the IRQ is still active
> at that point, the newly queued work can outlive device teardown and
> access freed MCU state.
> 
> Use disable_delayed_work_sync() to prevent further queueing and drain
> the worker before the IRQ action is released. Keep the parent IRQ active
> while the worker completes. devm_add_action_or_reset() also drains the
> work if action registration fails.
> 
> [...]

Here is the summary with links:
  - platform: cznic: turris-omnia-mcu: stop button emulation producers
    https://git.kernel.org/soc/soc/c/0045cd6b8ab2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


