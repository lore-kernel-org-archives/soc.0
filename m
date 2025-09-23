Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E1630C605
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662447; cv=none; b=i3YyVV26iTyOsPFf69xMBApgUTkx0GVsGf/804nK/n56/ITXUZu0JuAEykpBaiw5IrlOC2agZideYqjfSOx337NBYxqQtfexXxNMCwcuiCUn0GWQarpp36aoQLKjRV5CD0OvlBcd8FPfOYa4hQDl0U9bWwbvs4HFyKlhclJD/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662447; c=relaxed/simple;
	bh=OQDqHA5THBCbcFXiR+iaVcjrEy/iu14YOufPIEaYUf0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cZIEW5EaJj8mpFW1BKDtRMUpVweBJPcfmz4u0yU4gFBUyZa45yWdHetqtZIT9F1u7oNY8FcISsVUjbEraAau1WbYv2OuFcU35P+35xfBoEWokpq0F0g73ag5WOxLXxLoD9uCTOfejY4b6p9UbOeK2FW46C3883XNPAH7SYKAwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gby0WX2w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gby0WX2w"
Received: by smtp.kernel.org (Postfix)
	id 1B1DFC113D0; Tue, 23 Sep 2025 21:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C8FC4CEF5;
	Tue, 23 Sep 2025 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662447;
	bh=OQDqHA5THBCbcFXiR+iaVcjrEy/iu14YOufPIEaYUf0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gby0WX2wj0pkhKiKl6JEV+WDFov4HUKuL8wE48/IbVTwLU631Cvnwu0T75iDWx9na
	 P9PyeN6l3wVSuLKzCN2Y52VbB8ioKMicu2NGbFkTL4nc8gUuAzGh1S/+tqRz2BSEZ5
	 YGhamX6aDaQgnDf/iqCAF8ny6yePV6++MdS3DJOUYa5UnEIIe9hEkayOQRJAsOAeg1
	 oMYjouerfg1kHZRfKgIOSF+aBZecpnUwTGKpToIRXZyITDRQchotEXDWraE0FeRmiX
	 oIKM7SdqqTEW8j99OwIbu3Okpaa23WCspbik5a2tBzb742X+NvtVbR028gKdR0St7q
	 ykdz7sPDfwaYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C5539D0C20;
	Tue, 23 Sep 2025 21:20:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866244398.1926563.15488257988952305002.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:43 +0000
References: <d40e7e96-4a7c-4e4f-b36f-750c6525b95c@linaro.org>
In-Reply-To: <d40e7e96-4a7c-4e4f-b36f-750c6525b95c@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 09:46:05 +0200 you wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT changes for v6.18, mainly adding cache properties to all
> ARM cores in Amlogic SoCs, enabling RTC on C3, fixing RTC node layout on C3 and fixing
> long-running issues with SDCard on BananaPi S905x3 boards and the Odroid-C2.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.18
    https://git.kernel.org/soc/soc/c/abfbfb98acfe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


