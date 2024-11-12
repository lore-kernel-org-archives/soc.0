Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11355481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450696; cv=none; b=pSdUiQ8rfCRvfwB25O0yjYu4YVXcfrqABI+bDfhDFbAIPD4Yq41Csdtq4h4urtmpQc+4qEDobIDjilcuBNKBPfI5IEcPYHlGTAZg304BTZpJM+L1am+DK0xXXDH4tpI9VfHLWW4WA0O3cLwsUNwel2VChyGoMqMtS+hozl7Q+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450696; c=relaxed/simple;
	bh=4CVjGBBueTT5F7a//SnqTF2oBIuGNA0C58hfJ7HgGek=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lBRsA3yv9W8B8kFkLLorlj1CGr34LDj2+FYCJ4p7+l3LZnm3vToc4sKL6vPFFZjox2DHTm43VHWUSl2Y5dYea4F6wN2BEvIoIC5bPJQzcjZlU/Ih5nhpmKSzOW269ryXKDV5pCAdpDlH3x903NKlN4YgrZ7WIF1cM92j6Y4J3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKG950d0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKG950d0"
Received: by smtp.kernel.org (Postfix)
	id 9CB38C4CED5; Tue, 12 Nov 2024 22:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8760BC4CECD;
	Tue, 12 Nov 2024 22:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450694;
	bh=4CVjGBBueTT5F7a//SnqTF2oBIuGNA0C58hfJ7HgGek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DKG950d0LESlRMx2mTM39aXK7bs53mr0GX8iTp3HhzgOvBjRuVCwUibGWI7GeNiE3
	 CS4OPcQ+Jy1aqGKWGAooVOm/omivYCmq9yV/2Q1qE/Sd14dPqYQXpjGitY5hupbj+A
	 ROqWWGN16is2qpCX1Qz+s4S13THUebdn7m9h5ult0sh9cEHjrM5j22yr9i/Z3H9Gr3
	 wuW6nBbq6H+fw5TvmQVQTSrM79qryv7V9VstAQPExZgnsHw4nC74K0aKQ4zOMOYn5+
	 00/r8i7f8dG5I04T1Z4zv30LjSDUruUaOnofBRKuRtUkk+cKtu6Y6p2XSPdaauP3jK
	 9ahdL69muJ8PA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4E43809A80;
	Tue, 12 Nov 2024 22:31:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v2 0/2] arm64: dts: PL022 clock fixes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145070477.694695.13274089379657757617.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:44 +0000
References: <20241105-dts-spi-fixes-v2-0-623501e5d1ca@kernel.org>
In-Reply-To: <20241105-dts-spi-fixes-v2-0-623501e5d1ca@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 Nov 2024 15:18:38 -0600 you wrote:
> Arnd, this series[1] from 2.5 years ago was never applied. There was
> some discussion on the lpc32xx patch, but nothing on the first 2
> patches. So I'm resending the first 2. Please apply directly.
> 
> Rob
> 
> [1] https://lore.kernel.org/all/20220311093800.18778-1-singh.kuldeep87k@gmail.com/
> 
> [...]

Here is the summary with links:
  - [RESEND,v2,1/2] arm64: dts: seattle: Update spi clock properties
    https://git.kernel.org/soc/soc/c/55d0969c4511
  - [RESEND,v2,2/2] arm64: dts: lg131x: Update spi clock properties
    https://git.kernel.org/soc/soc/c/bdcbb3f8abfa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


