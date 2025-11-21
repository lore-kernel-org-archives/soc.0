Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E421DF72C
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756535; cv=none; b=iRV/n0ly2Hdg9zbCrktHtC30SbFEh/x1ihIFHEQE0llqGkw4I+pCQk9Cyaygtoq8a+rXmmbZUgGfksiEuuQmjBCI/CUsfmZ0h7/iE0IN9uO3RYOAeVmPT3UScjXqwCcoT+yGhyrnvnmRPJh9ZJu9Z7JzG2qckd9DvJ/k6CjZsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756535; c=relaxed/simple;
	bh=Innr1bGTKeWS4LAUo0LR0zZO9k9emeaClfsnQiyh2Qc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fmmsGxFGEiwRDNk0pC6d8OjDJP9XZDAKIgzxm5JPD2kMJGPNs43/f5JmjHX1oQqq8sddhGm+FgxzGdmok4MPq1oT7PAFVOLmI1DxgRhd7ljhgDToarTJ2rHPuj9De9gfs7UixJeqHPkxX2b++rvYhEQPqFAG++xg/4lBBbQEIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtl2PMPb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtl2PMPb"
Received: by smtp.kernel.org (Postfix)
	id 7A737C116C6; Fri, 21 Nov 2025 20:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D0CC4CEF1;
	Fri, 21 Nov 2025 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756535;
	bh=Innr1bGTKeWS4LAUo0LR0zZO9k9emeaClfsnQiyh2Qc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jtl2PMPbLQkz3HpQTBZLy07GaV8NnJ1J9pjT5TBBw39O3ChSiVaHmQ2Ih8zSQWcER
	 jLdZLYVOF4oJrFOPiu0SVquHuIF7c8rwhOAaBen8cVCgJA+Wzd++gjKb1orEFxCIOz
	 VZ5B7HbiVK6NEU3DF2NZZm9fQdCXmdOFt1WBDfc8opfxK1XoYfTkFQAcas0V1FwCB4
	 PDQJ+zVdr6xaYsJ/N+dRKNGUXkeZMqqOu1ni3npSZzVZ0AZP49Ed1w9Br14bKbrJl2
	 wzX39cSH6oZ6MNLpR9J9u4WsXLokOQnfbupIEZhBbwK8ua4BDXn9x1W5hcT1Gitnyw
	 MeejwzKlyRNcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CAB3A78A68;
	Fri, 21 Nov 2025 20:21:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.19 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375649974.2571237.10248463936456253070.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:39 +0000
References: <2046060.taCxCBeP46@phil>
In-Reply-To: <2046060.taCxCBeP46@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 23:24:51 +0100 you wrote:
> Hi soc maintainers,
> 
> please find below and in the next mails Rockchip changes for for 6.19 .
> 
> As always the arm64 parts are the biggest chunk and for me as a
> completionist the addition of display output on the old rk3368 is a fun
> tidbit :-) .
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.19 #1
    https://git.kernel.org/soc/soc/c/bb4553b1634b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


