Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CF778F5D
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724359; cv=none; b=K54eiT6SIshtPrpsQOfGWjXhI0URwQtt51P7sObn/CSIU+p8xiaBk4J8Mh2TjbS+FIXG+lSF0Ge/NGwhwKJivyGgUasOgTTk/AhZGBZdd41WNMTCkD/50Amp4D6ICHFkOSXsxTbGiFBVRS7vlELaqZkOw+Ijzze4YVTRrh1Oywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724359; c=relaxed/simple;
	bh=qA/Tg2CBDHTLdP3DZtc0jhRaW4JDRvC01IKNta0yTMs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MGNXiajx0wyLcCXh8wCzHBWBIVLaj+RRI65a39fwyzNvAAbSn2/64B67dGXcpeJPt2RC1Jssfx8Dw5ScifkvORnUIeJ6NvjaIzNH7BKU7e2d1xTnkjbpvOCSYj04A4OM34LPSXQQhv+rc34eJrucfxOBIPIGUNjtCZc757/qemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCIARo0P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCIARo0P"
Received: by smtp.kernel.org (Postfix)
	id AA881C4CEF4; Mon,  1 Sep 2025 10:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C6AC4CEF0;
	Mon,  1 Sep 2025 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724358;
	bh=qA/Tg2CBDHTLdP3DZtc0jhRaW4JDRvC01IKNta0yTMs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cCIARo0P4aixjUN0lAZGuWB8SXo5Geice1WGb+juFckEqbhgZ9WWDKWnPEpWOjj3H
	 hVkTSRQgZVNs7p3kHf1qJlTywyQfWMx3LzpglUAEQvUrFi7eZhYwlwNPtLHUzZ35sm
	 BUcyYitrJMh+8aC5P9b9QKmlRub3xa4/yJ9oh7V/N2wmGBYXDMRUCXBU6aZwUdbNts
	 cxVa3A3kcDe5WRMP9niJZxRjwfl5Mwfa2AO9Ok9NRN9NmbSAFVsaS/Ig7x7wdCv/2m
	 herPI0CH8J7fNR5V97+QjfxWzOU3ivpR4cLvSfegVha7DH1vLZjvOUXWswWrPcBnBK
	 Gh8U4ZWbiV9zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADBF0383BF4E;
	Mon,  1 Sep 2025 10:59:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: early devicetree changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672436423.3681523.3439577953993252597.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:59:24 +0000
References: 
 <cb634cffaf0db9d25fb3062f0eee41e03955321f.camel@codeconstruct.com.au>
In-Reply-To: 
 <cb634cffaf0db9d25fb3062f0eee41e03955321f.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Aug 2025 10:54:44 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: early devicetree changes for 6.18
    https://git.kernel.org/soc/soc/c/de0486b39ef4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


