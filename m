Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870C276058
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011227; cv=none; b=DtGY1ueIoXpF8dDyKU/QfWJ+AEjwXBgouSWtHld152/nMcTVuzvt54gDLDeiOZOkSIh5t+Bf4Gjgo+szkqaM4l/JNH1gVM/6YnvYt2rq+O7FxEW6/zhxalcgJHgHMdTW21qRqlsSwUIod+RlHWIL9PNF98VdWhSzEcSDp4Yi0aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011227; c=relaxed/simple;
	bh=c7t4g9XeJFNC+ScNG3xc77SPOBxzgoIrHYdDKn/G9Uo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LIr2eqhY+pJnCd3oA1SRlcGU8H0w6UHUNGtD+w1ha328NJ2+QudHJbG6f/ROjiQUmlTo30+8s1rq4Gl9Dn5GaSwqCdmMvrCT28QlkNvdbZGGdRTUkPIB2jRADYdMM6nkBxEmOyZFz2otSLD3uzR68tYDEKt8d/3E/i/MKl6QCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tm9pAtll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tm9pAtll"
Received: by smtp.kernel.org (Postfix)
	id CCBBFC19421; Wed, 21 Jan 2026 16:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F50C4CEF1;
	Wed, 21 Jan 2026 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011226;
	bh=c7t4g9XeJFNC+ScNG3xc77SPOBxzgoIrHYdDKn/G9Uo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tm9pAtlluzAJmC8fs08vB5U9NXr5HsTozf0lmT//5nL/ghifSg8lCrVYqNDv7i6zH
	 3Mp7tMTLekWI4ruFZYi0uAnOOFNcEyFnjQcl9D88ylf9QiYi7d8q7OIT9l5ezKeeED
	 HgUJNb+F4BacjFM7/wd7xf94EZOiMai46o7e6cc0B2jGSo2bkfgPtUp/0NsGs7GtFU
	 ysrQLfSKunRpMaPrC7uBIiELJYzMeWldMQ27UVRh9T/Y1fM5+YMGWnGUgDfviqxP/r
	 VkLSDUdls0n7tmqlgw4hmsZION6/tyKJj2qDc3UwVcnEMIGaX3M8ipI0ouljapZfy0
	 XzaUJwrrQqeGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11AD63808200;
	Wed, 21 Jan 2026 16:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901122359.951664.14976320641854335179.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:23 +0000
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Jan 2026 09:03:00 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] dt-bindings: Changes for v6.20-rc1
    (no matching commit)
  - [GIT,PULL,2/4] soc/tegra: Changes for v6.20-rc1
    https://git.kernel.org/soc/soc/c/f8d91cfb93a2
  - [GIT,PULL,3/4] ARM: tegra: Device tree changes for v6.20-rc1
    (no matching commit)
  - [GIT,PULL,4/4] arm64: tegra: Changes for v6.20-rc1
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


