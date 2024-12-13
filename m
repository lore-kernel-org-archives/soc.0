Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B141E105B
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734103412; cv=none; b=e+sr501U08eTqxG9i4TbdsuuzFPvZoYNR5lCfu7IkgvVkLlSAUiXG424+Ht9TVJDQuFusWT7NQeB3BSYkKX0NNnL6HIbDp6+LPlLKDk9dgTpr7FrUsvqL8Z37EEMLdK92j1+eLKXSIKDKZod5C+pIxN4A1C8TMWvhrRXEN8EWzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734103412; c=relaxed/simple;
	bh=+UD3ZXaPdn72gi3nY7pBLIKzMNiCJt9F2Qtpl4dwtts=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=b7+7R45Pbk7ts1ifCVaYafi5oPcXccrLIE3R+ShQWlq5Rfdu4SWZOKnVSle92cuZwIOjzJmYXMQxv7XcRd+j4ypmJehceCHWfRNfmFqSY04jgiWplZIM4/CU0apia4KOxxE6IelK6jYgekk8JbYowZkIfYNHXgMJEjwKx3vSr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtoZrKva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtoZrKva"
Received: by smtp.kernel.org (Postfix)
	id 6A079C4CED7; Fri, 13 Dec 2024 15:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5409DC4CED6;
	Fri, 13 Dec 2024 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734103412;
	bh=+UD3ZXaPdn72gi3nY7pBLIKzMNiCJt9F2Qtpl4dwtts=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YtoZrKva5UDIOWSlhSrOlwDYHhxYPuxHH1i1LTlbp6a4b3gT5Gsx0X71rCCKhN511
	 MS9rYJJAxkha4zdALP0o5Np2wDpnpCMX6EWar97uzPL9k4mGqL4FWtIH8PLeqA8U+F
	 DUdbM/G1vyejjPIzzgj0KkVe+KxJGnuBtLP0Tc9JI/hw548PU8MsCyeB8FYbQKEvMb
	 Y+7t08SKuYvQaOB/6/oUnVSLc2t2z50OeUIx2LOrlynedOxH00T0pNwTerw1K3vd/c
	 sUIO6OI+yms7/OKiqF2k4jyDckeCRWzFR87EThOmcOUm8KqBasula5o98VrpQwnasy
	 nBVleUr/Pp+XQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACB5380A959;
	Fri, 13 Dec 2024 15:23:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: amd: Remove unused and undocumented
 "amd,zlib-support" property
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173410342848.3014960.3589116660944460900.git-patchwork-notify@kernel.org>
Date: Fri, 13 Dec 2024 15:23:48 +0000
References: <20241115193740.3622591-2-robh@kernel.org>
In-Reply-To: <20241115193740.3622591-2-robh@kernel.org>
To: Rob Herring (Arm) <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 15 Nov 2024 13:37:40 -0600 you wrote:
> Remove "amd,zlib-support" property which is both unused in the kernel and
> undocumented. Most likely they are leftovers from downstream.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, please take this directly.
> 
> [...]

Here is the summary with links:
  - arm64: dts: amd: Remove unused and undocumented "amd,zlib-support" property
    https://git.kernel.org/soc/soc/c/26bda0dff9ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


