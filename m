Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030B481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450717; cv=none; b=qhYekxBpsuM14SDCkBBLiS2flKRp5Fox0kW1uIKwKUkZpo+s/6KR4R/0DWMgtPFZRWKKUMgAInNikwK/SHlphe7VGNX4GtH70YJ2TV+rFd3iTXwHMyhsPPisT2VUy0RBD7UNKCixaFqLbvnrnMdslB4qXq1DGCoAizim0pcfGWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450717; c=relaxed/simple;
	bh=sFm8ksGin/+AWNGscFXtA/EXg0K90tb5Q0Q49TSVYgw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K1/QT1yA3zlZ+74f/ZL/uE3fOrPGEpwEgLigFMtygbPJpGdVUU7JFkiWoBM1hQsn4Y4FIdhdkNCnD8+hZe29ecLf8V/VWCkEl8Gf8+nACS/r1L4oIIk+Zszt2BckisXvuSNUyX2Xs+6P86ESQFDj/pt8HSVbOMfJOsrWArWOO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcQtQkhd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcQtQkhd"
Received: by smtp.kernel.org (Postfix)
	id 4CE67C4CED6; Tue, 12 Nov 2024 22:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374DDC4CECD;
	Tue, 12 Nov 2024 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450717;
	bh=sFm8ksGin/+AWNGscFXtA/EXg0K90tb5Q0Q49TSVYgw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BcQtQkhdWiDb9II53YbSHX9m+1hX1L8N1oIsWDX0/JA0LpE/PdM9vN4h+DJH2aofL
	 kflI+MWAgPeTQVSPHg+ebil21sGeI2xUTtgCktbc5jPxhrzGlvnPKw78ImwrvNqWQ6
	 wD+UHTtezFT+DwaCkPrftahSUttDYoAALZCFPfl9FVtOx4vxkIwY5o2kcii0v7dM0v
	 4wcRwx4iJU7GJ8FbdLNnuyzPR10ThNznlHcfGSXmzQaGXz2k5dCrFiOUsD5o40K2p6
	 0zsPaIohYTV3tBuxcYkCU9yt9Ufoegf4fDErgGky7Z6m/qjp32CpVu5nvCHaCu14bH
	 3fo8cyj9enHCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADDFF3809A80;
	Tue, 12 Nov 2024 22:32:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145072723.694695.14199791289210642053.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:32:07 +0000
References: <20241104035709.19094-1-andersson@kernel.org>
In-Reply-To: <20241104035709.19094-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  3 Nov 2024 21:57:09 -0600 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.13
    https://git.kernel.org/soc/soc/c/2130962a208d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


