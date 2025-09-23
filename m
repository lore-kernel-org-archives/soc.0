Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932F30C36F
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662465; cv=none; b=ibqV6jqvb1/JPe4eVSuDpCVM5RFgE1mUj4dSrsgRzNsw2NibzlN5o6xVoC/nRqEpKfho2mz5Is4eHWINKZm0xz54N4brtPP37X1GlK4o4xc+rYwOfv80Qo5zeKObg2/b1eZX4jYCtw9q/jRjUP8/D1fdWDQtz7PNKGruK1wNjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662465; c=relaxed/simple;
	bh=sEkyIPysXhQACWtpshPFKAmuIdIhXbNkGtNDUx40Zrc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=P7hJWhnPD/KrFkiqYrV28Kg1Y50BgBfBnUDQxMbfkeFsa8OM1GMkbzyUgWcQbLc+gQXrcAJiMCFzn0zspHMcvsfCrfdhHUVDC+gbt9awcZgKnW0U+59eW7zyq5u2C3DS1NUY2EBakXlg6kTWggUruqMIxh8aGv7F1BWAwpis5gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSyn9FYg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSyn9FYg"
Received: by smtp.kernel.org (Postfix)
	id 4E6EEC116B1; Tue, 23 Sep 2025 21:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B79C4CEF5;
	Tue, 23 Sep 2025 21:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662465;
	bh=sEkyIPysXhQACWtpshPFKAmuIdIhXbNkGtNDUx40Zrc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WSyn9FYgquLnBFt9ANjl9rZhqBS4rPXdtoBZaLsBY6zoRhxsH+v/Sjm+WwSanRZbj
	 eWg950Ta6XZceXmwwskHOwtN+lbBHFp3ltPtB/I71Mp9qJiQJgH7dFtYSkxm/cDVd5
	 uORCvfiyrJJIa3m8OfTOL6RKxrERUV1lSsckqPOoXnFblLe1CUGa3mLSd9+TgWVwyx
	 P2ygNLQOqzLDY/7jIVUnr6TAjpN0WBlqBWOwTQzbPxwYVgAagn7UUJ1v6o52CXr+HG
	 QnhKXSuLXoucma5lfUDBxl8kmn1Si6TOUaEzSF5NbLympgK6a+WiGuwaezyolc1DuW
	 a+M1x7mEsYTPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B1739D0C20;
	Tue, 23 Sep 2025 21:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm device driver updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866246199.1926563.12965714081521724472.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:21:01 +0000
References: <20250921020225.595403-1-andersson@kernel.org>
In-Reply-To: <20250921020225.595403-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Sep 2025 21:02:24 -0500 you wrote:
> The following changes since commit 3cc9a8cadaf66e1a53e5fee48f8bcdb0a3fd5075:
> 
>   firmware: qcom: tzmem: disable sc7180 platform (2025-09-11 16:38:33 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.18-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm device driver updates for v6.18
    https://git.kernel.org/soc/soc/c/3783cdc1df6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


