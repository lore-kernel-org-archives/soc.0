Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD17497B71
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163435; cv=none; b=PyKCr8rwjevP5U4+gfD+39SNGyFobbQUUIEdAfN/NZIogNfJmXtnms7x+vA5iVGMdgclG0wXXvD6vTRjJwdWx1UVhzrUCUtGUtm5DJ1f22CWo5oBsW9o/JLgZXT69kRdOeQrVXfPdfxF+MiciKfKhGC5Q4zUBn6KxePu9EtEk0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163435; c=relaxed/simple;
	bh=YFWARsbb9dpzyQehsyDMm9M8FKSF2XrKdc5iC6wjbeE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NKi4sEqZhjtgGWzKoeTJH/hUsWZpjrD6RifhK6iGtLOl/GtSZEsaK0mvbGeb2bVkqKaCoKuU94keQ0u6NDL5FpoCNN76DPPyMk9hvwcYXpJxGVcDHBp9OauDE0qUTdLyj/zh2UE8/YWFc1xiM5sInwTJKhiLQzXXcZpx4hUbyAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ftwg/q+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ftwg/q+4"
Received: by smtp.kernel.org (Postfix)
	id 1F3C71F000C5; Fri, 16 Oct 2026 15:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0942E1F000C4;
	Fri, 16 Oct 2026 15:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792163434;
	bh=k2lTUOb5NjKK6pzNZuBuntrRAPTLIX3dv+2AXR9RBu4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ftwg/q+4kfdldMAqmUkBbDCeIDMKdcrf/n1QiJU8Z9x8+DXsNyy/jEM6fkvlcIsiT
	 C7qWmi60mxKRsD1S9mpCGdsM698GvjPhfoW8wU2T5kunMX4TcFGf/2E5q88ZNcv1lh
	 qKvpwPexN/yKEA+hscRqZCe4f80nFz1Dsu8ujX4WfWQQA/vRQmY4bOmjdgyWwf4Md5
	 pBzBmNFJG3UKrpOhrErzRSyj03U1S/LGYOyts54mB330q1jIfz29Ctg4kO7t/lrtfi
	 1k6tFAY+x7cBx4EPcQAigbUyLKd8hETq2DdFE72YGgwJvbrjBoBAu78IeoknCrYHWL
	 Y+PkUdvsw6mGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14B5380A966;
	Fri, 16 Oct 2026 15:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179216343251.806834.3786212589667257696.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 15:10:32 +0000
References: <20261008011902-KYC9093695@kernel.org>
In-Reply-To: <20261008011902-KYC9093695@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Thu,  8 Oct 2026 01:20:40 +0000 you wrote:
> Hi SoC Maintainers,
> 
>    Please pull SpacemiT's DeviceTree changes for v7.4
> 
> Yixun Lan
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SpacemiT Devicetrees for v7.4
    https://git.kernel.org/soc/soc/c/62c27ed02e29

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


