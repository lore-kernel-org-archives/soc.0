Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67111377023
	for <soc@lists.linux.dev>; Fri, 29 May 2026 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780094420; cv=none; b=C/QcWV49QwEj1IxUsQiEZap+I93VB8Jmr7RzHeYXmf4bn/pcFtw1Uoju/5ezQ+wm2T0POTg3d0RWBS4rKDwottreZVdTLVd3QI4IZa+qx2/K3gM63h6lE8KJAlKyyElQSZAcxmKTu7CYJFVhvgDNL92SPB8y+VFwpvx95Yj9sFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780094420; c=relaxed/simple;
	bh=dKFbK9v5Bp5fytZsYrmJIuWgERuQDKo2IbIupTsAnSw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bbKRJJ1rbdAohjASFpI6qowpkK1Q2q3M1QEU7EulFbenCnRKLP3CV/boLeln+FTPYYBU/ikKFA0VkVamh/7592kbR7+KLw5fhGkH+/ocn6E2EPZATG0Ar8SZm/XzfwvjhWDcUNChIEaKwUiTTQvDVxo8MgZp1tBpPUxE6Luyt0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDktrNWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDktrNWW"
Received: by smtp.kernel.org (Postfix)
	id 146791F00898; Fri, 29 May 2026 22:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CBA1F00893;
	Fri, 29 May 2026 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780094419;
	bh=leCpZG3jfJf8lBT/zRMcTS8FyHAo/YP6Gse1kSEV8Sg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VDktrNWWwSJDUTrJqCVA8if5eXXHaBvt0vAkGRpqswZhGi1AgCh4IniDWxScZdsl2
	 BNJltKyKjTWjAvsqcbUWM5JlbQDkTJsvQigZvABgyn0AwE33rDeJs1340dBf57uIKy
	 H6XFRbbpY4BiHVLohXceGGN6GOto0Z0M3q2SwrJPcnWSnhT/K14cg8AGps6GjEFvqC
	 Cu/1OuujeADpdYHFsNz0sn8xs6M+9UJeiLAzR077kdXpElFgw+z2yx053cnUWq2bwS
	 DBXF1NaMVyu34hU/WhUc2fQcGmCw+LpYXzdWfetymuBhUPQWDCdCXr41KvFB3wyGRd
	 NPohPUxXwYncw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CE339301A3;
	Fri, 29 May 2026 22:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178009442239.1985625.668102481766948560.git-patchwork-notify@kernel.org>
Date: Fri, 29 May 2026 22:40:22 +0000
References: <20260529111430.GB2532355@rayden>
In-Reply-To: <20260529111430.GB2532355@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 May 2026 13:14:30 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull these two patches for the OP-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE for v7.2
    https://git.kernel.org/soc/soc/c/1f512d1f745c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


