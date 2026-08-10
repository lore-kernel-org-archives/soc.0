Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0631714A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352484; cv=none; b=feThxCNWo0/WEnIXJJIt+NMXH6adObos2UB3OuNYVVtbMmG/oe7nDvDqdJ9mJD1KX8KPqRRU27ay/oySXxC0+I0JlrknHm1b2MYEjWgE5+bxGiGOQjbxwZbWBwvjaZEfqJd1gKz4m6zfrcyuA4swosgEDHP08gvweN4+cvEzqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352484; c=relaxed/simple;
	bh=r8YN4c9ZfN5ClOYXo0hck7pcpKWes4PV9v6W/XCLw28=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GAkFJtSTOOvyKG5qZ6YKXnY5v/8V0t93CVY1McjvHqBlzlNicHkx2GVCOIPD3uyNcG6QkTUDjcXa+bJaD1li11PdNNVDCOH8wMmBAU/nEou+kZAL9jMjHiSfSNb95nu6YoKZ7lT0qrtvylXK1Qx+OA/KvUumBUx8x0tjsvWMoe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnI1GReE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnI1GReE"
Received: by smtp.kernel.org (Postfix)
	id 4DA761F00A3A; Mon, 10 Aug 2026 09:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371E01F000E9;
	Mon, 10 Aug 2026 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352483;
	bh=Q2a8RtYfDi0YfIWBy6aYYK88akZs6hHnE55hTQRrF/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dnI1GReExP4Zp0Af+oRwqN2ll8kwhCkfFwcx3Jd8fKinuaDX5B+89vKqMx/BlqB5u
	 YOYPRdRNJG6RQjaWTQyjZpzl3BrSE3A/RT6wmZWH6wtUuzKMU3czQXOki8Wsps8vdd
	 SMfIwbuyESqGP2/SPuBrwJXfAhMx4ib9BlOjNCcUEhrAqqzqkXJyCCNk0x5u4IIa2i
	 +/LK2f9yZ/jxChOpGTO/0Zfa6vo56wcfe453UCGtvS93JsUCMMCFkWkaLXPfr0GT43
	 4hZp0WMA2LCILBUPE4j5h3V64hKOXlvZIBz10EkFVp7HRL2c8lwwEkmUcTbC9B2jPo
	 zdxZd2vbWORiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B5D3924FC2;
	Mon, 10 Aug 2026 09:00:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243988.3658557.7173934968791573936.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:39 +0000
References: <20260807154149.603041-1-andersson@kernel.org>
In-Reply-To: <20260807154149.603041-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  7 Aug 2026 10:41:49 -0500 you wrote:
> The following changes since commit 43584144a46bccbe90482cd8eede9596d8fc47dc:
> 
>   soc: qcom: llcc: Skip ECC interrupt setup on Shikra, pre-configured by DSF (2026-07-17 17:22:44 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-7.3-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v7.3
    https://git.kernel.org/soc/soc/c/93d524fb91fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


