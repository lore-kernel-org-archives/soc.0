Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1784FDA48
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738877; cv=none; b=OKBJZ/bNdc4ImU/fBeyJDPd2cGyEzQIIKFcZh6cFugDrYXC+0OvvlfI+5rsMcI302pQX7piDKgghO993TJ4w2raKIRCf5ec555TfpFbG+Sbo6rw7BllJDXCUdNJWSc5ph+vAuwr8aJn1Uq5QZga+MdWeHQnXtw8awz+BW7oelZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738877; c=relaxed/simple;
	bh=46pIXCxrCB2PS3S9dsriDDBPX58ccvZ9/Q3BPkWCy2s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=WIKQnNguvZp3LyC9CWrCELu1Pd2HLXnUKaoyGwFVkJj+BZuuFsl7Q2pYo6yUBsNfzdQaJaRdClf+oBXN5ipv94MzrtmOo2reHfUwU1yMF10aM/t/QIn/BCtMuZVt2/BeJd8UQ/m+9YSLDfVbmOwNnb9I5PQUTDymWdRn/YVREpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf+bryqu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf+bryqu"
Received: by smtp.kernel.org (Postfix)
	id 853911F0089B; Fri, 18 Sep 2026 13:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7541F0089A;
	Fri, 18 Sep 2026 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738876;
	bh=QGV1XC/kOIQ4M15Tj4xwmIErWQOwEjKaqbSSq06dz8E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Kf+bryquABFaGIaoiF5tLprqWkijj0gIy6iWsT0Lu7z+2LRyWuQcOy0ceNkwkN1aN
	 j1s05Tn+45UZMK55DxqVNkUAJ0BE0O0aDN3RcDChbyP+fKEi70//PbpsClGe2xgPYu
	 T4A52RSGPJthHV4/ZxApfLX6Op4liwv2sL5wI8RzTl1r3grV2QBGMLjYTWgArObupQ
	 jlOeWhN7Dr46czhZ7btHkQbyy5Ili1i9WbMQBcG0No66wr5Ea9TZBhX0LpxARaPdo5
	 7/OQnWxAVHldKpxorAgdT88I5zJV/SuvTBhKFf2DZGJ/1hX2uT3LLWtPLIaIJBQM6T
	 38R//wBx7HRpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09B6380CEE2;
	Fri, 18 Sep 2026 13:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Renesas SoC fixes for v7.3 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178973880966.506446.171339996647655437.git-patchwork-notify@kernel.org>
Date: Fri, 18 Sep 2026 13:40:09 +0000
References: <cover.1789722755.git.geert@linux-m68k.org>
In-Reply-To: <cover.1789722755.git.geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Sep 2026 11:13:52 +0200 you wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> 	Hi SoC folks,
> 
> The following changes since commit 2ac7bad110be6ebe478d6bd57821f7f5259a1f54:
> 
>   arm64: dts: renesas: r9a09g087: Switch GBETH TX queue scheduling to WRR (2026-09-02 14:32:37 +0200)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.3 (take two)
    https://git.kernel.org/soc/soc/c/2d5061ff3762

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


