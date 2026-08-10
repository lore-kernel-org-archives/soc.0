Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFEF361963
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380678; cv=none; b=WzJnqQnOmCOFw0jXHG0QCpFMeOzh39ib9uIB6hlIM/9q2BpSXHQ2moHmHA5G+P53f1rCv+gn2PN9W0o/wXmgRUq1QeyyApvM7bnIGrCvQD+hKzRtxDqHhFvFSb0TTbC1xa+H0GWMSI4VOZLQmoLFi5QXyS9tOKrB4N3+j0sjJZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380678; c=relaxed/simple;
	bh=eUf+tRI55rGn/Iugoh/13qEDIU6HRk48KskfL1dCHFg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fg90GAAtUpAB7eZZoeIL1H7D4fZ8Dx7WhhxwCcQOIEZueH3jmiGAP6FebNSJKFRDVYpuyTrt+77OPkRTO74tJA3qBkN3ThKnQtR/MxwI9fYeWP0l3d/3CdLPfw6foEnQdk3p7Lm7fOtVCHPj20JEfFG4xMHVtUE4Fcz1rnwtoNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0g/b0oU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0g/b0oU"
Received: by smtp.kernel.org (Postfix)
	id B6DA81F00A3D; Mon, 10 Aug 2026 16:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04661F000E9;
	Mon, 10 Aug 2026 16:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380676;
	bh=rm5kvRfuVH7P7FNtFbDOrhfKFxLHhzfH7s3s8wgrmo4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=R0g/b0oUZymIrWzLhMNHGzUBoio7HCocawub3bA71EUF2EUMQdG+gxqZHrazEh8io
	 JsRYv+T/x9BkoRp4FuHHjOYZOBVoI6A3pBlk57kqwuJPef0lL+wbK4CWcEp+GW9fKW
	 LGRRPgfuM8i3XgxdrsGV79/l3CUAkBC2UzZYNSNl+NvGgMykRGIFfBkSvWetv4KrJI
	 Fpquh5b/XgiX0YvTWvUzw834x+B0cjb7yXoQRUqvtAaXs8Gg0d9j1luCVBZgUErgHZ
	 bGlrQjqXLzdL5MMse75kUObtmqmn8i4NQ6/mlHyiGj5dV2f3McrJgS+2QizgNku+0M
	 jPA3XtKBo/fUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939B039253F2;
	Mon, 10 Aug 2026 16:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638063339.3872609.1360008694481030731.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:33 +0000
References: <20260807151711.601956-1-andersson@kernel.org>
In-Reply-To: <20260807151711.601956-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 10:17:11 -0500 you wrote:
> The following changes since commit 23da74833df803c5e8bea71feb878173764ef121:
> 
>   arm64: dts: qcom: eliza: Describe the ADSP GPR node (2026-07-29 16:22:07 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree updates for v7.3
    https://git.kernel.org/soc/soc/c/aeba6e4f8ace

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


