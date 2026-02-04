Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03E3D34AC
	for <soc@lists.linux.dev>; Wed,  4 Feb 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208216; cv=none; b=K8kZCU8RjcPyB5Gd0f6pxeO1cSu10DlTizM2dfGv18oF5GZWibY2zLz3k1jQNECq/MOdWriNW9dNUZKnJBs+Ru5E349GuwPL3xHP9W4r5KjZsR7k5UAtekTJ4iMQHZ1PGz48zgrCCu+v6jXn3XuTe+FEU4vTtWAjDEeBt2Wt9pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208216; c=relaxed/simple;
	bh=gVxkpxkzqAefgbTceICRhNESEHdzunMEjPGeLT9Csro=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fcGdx6QIEYzBb/zImd2xRybDjrVHMdESa2D5lG48BWpycTpiNAZ+rcsemyvsPnvDpcTIl3KmwZdJkuwGvtAd2r18jicXxa49Tqdt5MR8YseoP8QcTPmdMdd7yeDRvT/1vK5dabSldH6QuNhXwD/gB1xEZb5Eb7X3cB/3qxusbWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCDaP+oc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCDaP+oc"
Received: by smtp.kernel.org (Postfix)
	id B7357C16AAE; Wed,  4 Feb 2026 12:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19A3C4CEF7;
	Wed,  4 Feb 2026 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208215;
	bh=gVxkpxkzqAefgbTceICRhNESEHdzunMEjPGeLT9Csro=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eCDaP+oczhsuUJE9g7NYG75AyF5IrSdryEmgNWOXwUmXpqqUghfkuTX9z1QesgFp5
	 dF1docK7/2SvbAkKgbsvVqW0hpEgt0cTTIZXvX2VZqXxzHgzAbhQHlUtBfgUwu/yOa
	 Vi9ZswzlA2frSD/Q+X0naRcK7g/KVqAQsdsqhnRQDNZCsebcUEqpKe9FDw+HRRwkgs
	 o8VtYapnxKSTjLNLLKOXvAlz0YdYUIbIkI0V79vXBhItLHN4exUWtlF831TlKsmMjt
	 GjKKS1jVXdXTzxvS28k+DMbADQ36yKC6R8LOpTj7h3pbQEzY75bnhAurRhJpFEhhIF
	 jmaMDfkaTWCLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CE07A3808200;
	Wed,  4 Feb 2026 12:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177020821163.2322890.13593245621349574036.git-patchwork-notify@kernel.org>
Date: Wed, 04 Feb 2026 12:30:11 +0000
References: <3bc83479-015b-4367-9eef-7d8ca6005578@kernel.org>
In-Reply-To: <3bc83479-015b-4367-9eef-7d8ca6005578@kernel.org>
To: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 31 Jan 2026 08:38:31 +0100 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.20
> 
> Documentation is acked by Conor Dooley and changes to fsl-mc bus are
> reviewed or acked by Ioana Ciornei.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.20
    https://git.kernel.org/soc/soc/c/cfd00b7e26c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


