Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19351A9F91
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220505; cv=none; b=cT8UV0HfiaOgZZMV0d+6Mkhpi/YolXzX/POm34LYeuajEXlsjVFe4yjGzE0oSi57ABNTRJQN9J59FFCfdXbmrCYRaSyD/a1jYGO+3Bh6+sGD3DKqWdbSDVgzEuMU1t4mQCfWr2vOBrwVuH0Y4XtrAdgtkLR8ebBskUryr2Kdqvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220505; c=relaxed/simple;
	bh=VoGRTrLcaqa1O314ZJWt4xjd9jhPu8tepvz2yRrQwfE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rfnt6ceTe4u8WmDxUnPTPRQQqlyQ4YnRJNclq8HIK4PDqm+yegGD9UL7LfF34gtZrIG47lYFHDKvNVhZ4XiAerNqg4AhTODdhJeb+OzcXWI40XcjsvlzQKo/F81jC+/1+886IWkU/k4R+cTEt7FV9MmaWzCi/znNjxH7eKM+bgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNWUNztR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNWUNztR"
Received: by smtp.kernel.org (Postfix)
	id 8A02E1F00A3A; Sat,  8 Aug 2026 20:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745D51F000E9;
	Sat,  8 Aug 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220504;
	bh=YoShe15KgHDCkG93vPwbV+6sxUBVVrIafhMhr62dLfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iNWUNztRcabKUT9pHHqMDrA95Me86Bk8ffNhsuiERfNjT7o5K1SI8ntVpgmJpAHfk
	 fTMbOSCuSAzP+D3657Vpm3wWJN5LQLJXqSEg4tnCHlCk/C3sYrAKfn3yc71f3JGlBf
	 lfpK1sSLvEDC6+8DmhrLgOFO0xilYJShbolMEpDRCr+CCy2aJEbux0IZoNsO5Icm4k
	 fjfHwdpZB/F9nA5pXcwTSLK1BSv9uQQ9t8ZQd1q3f07nD9jtYp+NuE0+RHot7SCA6l
	 o69b69249snu6WOrm7btlfMg+ZewknhXnG4uuAxSxlPTNcy87EiT+fWyrdxKDuOCYH
	 LJVVYqYPJ4kMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939F2380CFFA;
	Sat,  8 Aug 2026 20:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622046213.2748994.13517865065818308177.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:21:02 +0000
References: <2742274.XQYqjrCR6X@diego>
In-Reply-To: <2742274.XQYqjrCR6X@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat, 01 Aug 2026 00:12:03 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below Rockchip DT changes for the merge-window for 7.3 .
> 
> 
> Not sure if it matters, but my pgp key got an update in the kernel keyring.
> The existing keys themself did not change, just the SHA1 signatures from
> the main key to the subkeys got refresh by better ones.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 7.3 #1
    https://git.kernel.org/soc/soc/c/476906f83cf4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


