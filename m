Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEBD51B17D
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907853; cv=none; b=qRC8kPtTgwAuMK+F1BqXjehRFyMPZBA6Qc1rbq2QEqp1+OGYDqqnkATAy4IMS1IMCyVUW0fkLwjeLlRVcVAO+3DIy/ouX9a/NBydxC6JutyOMCTyHTr9E32Ac1xRFYsi8B0zcTmSKA88Tm52bJ7hbM0Y3uSYbz0culgqCpuKRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907853; c=relaxed/simple;
	bh=Ck/HTte8YUpn6iXCZQ6KZHJhnYfmRmNwTLFrSfiQWBw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nftxvUNUEyU8uskgFuqjMLcvMbpFqLa/9f/aof2xfciT0OZ2YPGPvIHNwqT1BMHkfBvsCbTQyquxDWQ1/yMrB8wybzk0XjbgGLt2lm1eqp9gijQyn/G0tGRJAJIWKgxdTOBlem6T8TkPd7cofi/3FSe9H4TuL2PRISiSDsTxCvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A06gxk1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A06gxk1n"
Received: by smtp.kernel.org (Postfix)
	id D24A91F00893; Tue, 13 Oct 2026 16:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC1D1F000FF;
	Tue, 13 Oct 2026 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907852;
	bh=FGkt2mHpVm3xTnABBXF9zreBSw9fzpjQEEw9FariQB8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A06gxk1nOCawQ6gAvGDH+7EFG6h1zZgD/asxyqtX17zzoh3gseQL9bbmwAUNUW5s+
	 Uh14reDvvGhn+pUD9jnOMQ1jYThuOVFY4ajut98Qr9uUSLfhJR7FptXXgK2x0BwA0H
	 btYt1Dqbl1uHVc4NC4KsTiuygRIDweBVczBgDE1qtiN2EazPuhcqnk4eYxisfUQw9r
	 +p4TWD7Zn5lJSvl/699hvEHmBqrVCaE2Db3LaGBtSixz4MfRsLqkZnbu8aqWdmYuDv
	 59WUmsBzQfxxsMnmJnzNyOPD2gtK8yUXkT875b3XLvaQGgTN/UWnI9sKeMvilVFNob
	 1rwbariHVJd6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B427A39D5FD8;
	Tue, 13 Oct 2026 16:10:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX SoC Changes for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190785126.417156.14601289329289257831.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:51 +0000
References: <20260928184508.1978455-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260928184508.1978455-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Sep 2026 14:45:05 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX SoC Changes for v7.4
    https://git.kernel.org/soc/soc/c/aa866aac341f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


