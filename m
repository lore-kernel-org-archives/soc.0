Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A02443A86
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911252; cv=none; b=BlooESHvlvPh9PTgjoy0DUanZpX7G/j7pUoWOAD3yX+jQrx2pY/naMZDhY5WLV/CAbqn5embEE6aaIDQkyUsMH2nCIgL5PmF4HU51/whVJR93EQfBneRTXX1dEQ33GRUNM0WR+BXjf5sIGdx7nVuiAd2Z3qbepUT/oP7wWnwGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911252; c=relaxed/simple;
	bh=8FYKEMRkUXBqAln85twcDMWeLKbRgyT9aVzgB6iFUcI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CcwkBKmde27+78qsQXvqo9aYLknYzd5hzVBO/Ilhp6Htw2xXffiDskEiMzkxUhQnJmK3ytvdWmSKKsIkFZ3C91/pQQL3mGXA+0BErQrtUwbcDdhFowFsarsKk3C1sPmjKURhJ76zfJ5rQkggi7LT9XNkng3gH90x++4x/uftpgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9gM0/ZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9gM0/ZI"
Received: by smtp.kernel.org (Postfix)
	id CF7C61F00A3A; Fri, 24 Jul 2026 16:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F531F000E9;
	Fri, 24 Jul 2026 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911250;
	bh=IEMzx0NTXusJZ1kI2MXlVsE9T5nrR8/EoTbjn7zuSJU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=d9gM0/ZIXUVl6CFCs2yM3qc40by4UpM6EoZuuO0Uiea+ftEHJi0pVP1Yb/kLz8Dn5
	 dsZMbm2ZNvG5mEZs8opTzwaJ+6DpnHvweJO+W8S3QFlV2zB/LxlFnO2Ft1/7WaaCi7
	 XT43x0Rva4mRAyhevIbdoEttJpn4BbJZqlD07H7E7ZaVu9G/v9CVC18M9H6MB17Vnd
	 zRh/+Kuvy/9cKLzi6wPgA3DszD7kWTv3QavTHI3b3J8IxJmZS02S4gTJrgDjIv5P+Z
	 nOic4drHa39IXn3/qYnArZrQ0C+m6s15dCsfv2QRWE0XuP5SXK/OzkvraQI34HpJsd
	 /Ov+IcrNpsQaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4A50F39263A5;
	Fri, 24 Jul 2026 16:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V defconfig changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491121788.3229915.9040423834090729571.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:17 +0000
References: <al+cTw/+z7xoJXxp@x1>
In-Reply-To: <al+cTw/+z7xoJXxp@x1>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 21 Jul 2026 09:20:31 -0700 you wrote:
> Hi, I created my riscv-confg branches to shepard defconfig patches
> related to the riscv platforms that I maintain. The branches are in
> linux-next. For 7.3, there is just a single patch for the WiFi driver on
> the TH1520-based LPi4a.
> 
> Thanks,
> Drew
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V defconfig changes for v7.3
    https://git.kernel.org/soc/soc/c/6495ae297ceb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


