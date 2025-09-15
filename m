Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D41F4C8B
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944245; cv=none; b=UIukzK/N1k7PRWRjtz8Pi2Mi0aUSs6fC0YozeVBNdzXreaMRnqHuDPTozjXLpV0a1973+PovnFYybI1xllNBhWhq44vLOZgXqOWPhki/BRaJooqB1tZW52++Ooi4nHi/BY0nrsqaL4l54Fu12uEgdpZCTPIPsAAdYvN0u31LWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944245; c=relaxed/simple;
	bh=wgaPwjIjZB6d4hiK7rGitsaYZgp3uVqOwE3LZOW98sc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BKRrYLE84lChkZGpXQaTpYKwp+WFK/+wlMSoCLsrRdWlbKHchFAzxjsT1CI+mmmnE0lyQzFhm6FXJ9smLYUifus+qp2WncWxSPkHClO3px8tp22z8D+jYedHNvet3vzmHGi/wN2mpOP5NWPRam6B3oAElVPtGSE4v5835o0lo+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvxWH1Lc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvxWH1Lc"
Received: by smtp.kernel.org (Postfix)
	id 52177C4CEF5; Mon, 15 Sep 2025 13:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CA7C4CEF1;
	Mon, 15 Sep 2025 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944245;
	bh=wgaPwjIjZB6d4hiK7rGitsaYZgp3uVqOwE3LZOW98sc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PvxWH1LcKNLOrpZq4uSKLKs7yYX86kVDPtgF8c42kfLANrCSvq9AIOBzRhFOqVC0p
	 oIoKfetvBg7RDHcRX71CXmvf1/m2dJHsalUvLhmV+1Vz+krL8kmUy4a0xG7TW3XUHN
	 7CXjh6vurgfyNLhTcurFlydZwL6rllqILitQoLCxK2YRxoiX49+tNL53fslqJwhknE
	 JQjtLB+NWn+3Ig/B2X7V4C/qsak4KrOH4G7u9lCGfnQpHkqTcwUCMiqomjOzDBHYB1
	 LWUrAxznIUuq3e28Tpoy8NF3DxqXNIeMzBGs/ZCA1A3vsxQRGO4t/T8+9++x9Lb/qV
	 TefPwBgtBHqRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAECC39D0C18;
	Mon, 15 Sep 2025 13:50:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PULL REQUEST RESEND] i2c-gpio-fixes-for-6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794424650.4179625.8450266593726449793.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:46 +0000
References: <aLlgGdrFEjh26knK@shikoro>
In-Reply-To: <aLlgGdrFEjh26knK@shikoro>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 4 Sep 2025 11:47:05 +0200 you wrote:
> Hi all,
> 
> this is a resend because I used an old address for the SoC mailing list.
> Sorry for the noise!
> 
> Happy hacking,
> 
> [...]

Here is the summary with links:
  - [PULL,REQUEST,RESEND] i2c-gpio-fixes-for-6.18
    https://git.kernel.org/soc/soc/c/942d46b4329c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


