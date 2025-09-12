Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5AB22A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693418; cv=none; b=sadqikbdMIiqDnxC5L/mM3vzpS/o3qdIy2Xjgv9ec8gDtVR9Yp60596FSepsuS3WoE8ocoNWlEwPjI4Sgu+5J0rKqj7UWB8iGoxiu8Xq27HkHssc4STZvagB/pplSJX2gC5dwJUwSeg4ubL/VTRQN3e7VzX3BKTX13t9IGpJ6wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693418; c=relaxed/simple;
	bh=2/ZZN+iaUuzn80MIUxPHWPgMuzPvpLCJYMrEncFMpAE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ohsxD6oblgQJfXl6mtYCMe29DvatXfR6DiWFdmvrM+zQzIMwHm/fBDGkhWhQBo0DluItjbeTu4QEgnTaO0FZmBU/PYeXMJ5DsnI6CZx+qtsvuFVk84aTHHDJpBhy40VQtaSXENaPPwyoRq5I0kUr0NYxRYAApmJcsYH7rPDBKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mO+H2Hh4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mO+H2Hh4"
Received: by smtp.kernel.org (Postfix)
	id 352CFC4CEF8; Fri, 12 Sep 2025 16:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F620C4CEF1;
	Fri, 12 Sep 2025 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693418;
	bh=2/ZZN+iaUuzn80MIUxPHWPgMuzPvpLCJYMrEncFMpAE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mO+H2Hh4PHIHGZ4VcBG4fAgg5eOnIGD/+FO7RpAULFmz2VtGEAa5ohipVguBvf9uB
	 Xm/Ydea9NnTM43hDLDumGI4vTuOwR9BcnablHCxUSuDwSqrsveW3gjhveEUvG/cr6a
	 oPRMoscvQgd6TUZzIjEOTCrRP7t7XNRVRELf02lGrGnH6zsY7SfCd6rBeaaiKP5fhC
	 Oz1cr3/KggJMihCpi3jZBl/zYN9tqd2/uP/eP8fAUJk1e84O/O/jUkWNhEN6ALxnDh
	 0rLhU4u6K/3nnhRYM5K/bBnlha5o0jpqfkTtcYnZQDsaQgPocVS+bL/jIc/lDzfCvu
	 EXfX+turcPSlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD11383BF4E;
	Fri, 12 Sep 2025 16:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm: dts: socfpga: fix for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175769342023.2998972.3470477392022613387.git-patchwork-notify@kernel.org>
Date: Fri, 12 Sep 2025 16:10:20 +0000
References: <20250907123058.175447-1-dinguyen@kernel.org>
In-Reply-To: <20250907123058.175447-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  7 Sep 2025 07:30:58 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: socfpga: fix for v6.17
    https://git.kernel.org/soc/soc/c/32687c066375

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


