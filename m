Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850953563F6
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340853; cv=none; b=FWdjgrBspOkDsyErXV7cT52Q+/g1Xda2ptJBgNj3C8UzwKCUyG8BZUkaH4CdDTd7NhPd1kYp+6O22VERVu8v698iSP/vA5mtIu2kcGJ/CyLhBKNtZIb274/BS0VFLvPv34i5+QXjppklsyHVcxIq1ZmYkBizgeQBIwN2ByapCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340853; c=relaxed/simple;
	bh=f6IntJb5coULOxUxEFm/3HADzhNwg6xcHVF5xSLLylw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ahCBqBwPXwUe46K/UwVEu6wur519tDCLI3prcaRlfjgqBbXTu9cPWfRA9Pq35it9GVtRurIjy5Knd2dC2/7jf1DCLW4CFcPI1akqA6hQCRpx5la4EQ0BrhxxA5p5UYxzL+J9v1Idm4H21Ry7heID+sBVqheHJso99Bi1t29jMiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFMN4Nq9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFMN4Nq9"
Received: by smtp.kernel.org (Postfix)
	id 821E01F00A3A; Wed, 29 Jul 2026 16:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3631F000E9;
	Wed, 29 Jul 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340852;
	bh=ijczr4RXcW+xyU3ebVXCkJKGla5eRfeAfzG0nF04Er4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CFMN4Nq9SmWJXsEU3piH/S6U22UCPQVIuojf6Qms8GqUGYVGV6IRqkvC+k6DFct4d
	 pEVYbI9qgFh6cmGEq16/bKAab3aVZD7fUs/ayPF8/0M8wp7WuKSQKO3WAsSNVpplro
	 D4gADP0sxteo5QzZebR2uB35qMdMxGF6jOBNweOdY9+37saZ+RpygycOPzSMbwzsL8
	 NDoDq/Ex4FjXv2/npRydd9iB8HsvmYKnPltzhMVA6T2PNZMkdL/eXS8TzjlSZN0wiH
	 4M9WxAxZ6Yw8W/RaRw0JpOHyNsYvJ94s0Y+H89iwUeq+toFUPSVLvz7/pp5t5Rn4Rb
	 Q2LYgFLQIv3SQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D10FC39253CF;
	Wed, 29 Jul 2026 16:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] arm64: realtek: Device tree updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081663.3143403.5946740217399875232.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:16 +0000
References: <20260727090933.908156-1-eleanor.lin@realtek.com>
In-Reply-To: <20260727090933.908156-1-eleanor.lin@realtek.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 27 Jul 2026 17:09:33 +0800 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/yu_chun/linux.git/ tags/realtek-dt-v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] arm64: realtek: Device tree updates for v7.3
    https://git.kernel.org/soc/soc/c/27fa9068181f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


