Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBF371D11
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858411; cv=none; b=YJOytEctbuf98z2Tl93VNWWSMv2ukqsBxXMSkuk1ioKmEwdCOGu6ftg8ANuJUW5ESQub7nr2k8luUmFSYoQxLeDIiJdtTs/GzOIe8WPPZvzfYEQoEIwVqmUN63kcdl6LjvECGL3JEMsQvDi7nTedNTr0YnsIru2gaX6Kwzumlys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858411; c=relaxed/simple;
	bh=GgIiwiPN7aSMg0gY3yJorCKLyljDmc1lmzGtfhRDCgA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eiTzWx1Emps/Z2y1nkTFd+HLgDi1QhKk/mwa+PYufq+pT1G7QOij0U3yW7BpFNpyW/M3fi52OiJulqk7NqNO54fa+hXu49xAxRaZ054JR+ZiWmFNXKzG95N6cEH2+EIGnL4dPppz1EpMeQRMCNIxpUQE/lxn+E6yNpgLe0pOQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQGZnerD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQGZnerD"
Received: by smtp.kernel.org (Postfix)
	id D41981F0089A; Thu,  1 Oct 2026 12:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5B81F00899;
	Thu,  1 Oct 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858409;
	bh=g28BmfbjXmasLkiRw9Cnv14OHFKTvzJ2CLLUMfcTUek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NQGZnerD0pgP95Pm6JaW5sXDdlYGo0i+hLqFHCXLpLkdaaEDetJLa13VJLuwEt6Mg
	 Ur8bl5xRux9NXtOZkpwKbK23Sg2NI+vxuQwWLC2qieZihx+xrUFmIYb19JTcmq7Nja
	 BDb9yoeJiaV8hLjLQoR72Kq/ooXIzxfwBBDhz/YTZHuCIcBVHqoIl/mfXW5zkWOiUv
	 Y3TKnzJYCBW6g/YF9p0Lh9JQxEeBta39Up9m7bJqdVadokUV9V1RIoexXZoPtkiRKR
	 w1wjcR5zL1UZBxy3hyZR6273aNgtzB/7z88KEJP2iMpW662JuQRSvmL5oHUIpIPXrL
	 f/9zOF5My/cGg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45AF380DBDA;
	Thu,  1 Oct 2026 12:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179085840853.2440143.7130652881262913069.git-patchwork-notify@kernel.org>
Date: Thu, 01 Oct 2026 12:40:08 +0000
References: <20260914140821.1805449-1-arnd@kernel.org>
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Krzysztof Kozlowski <krzk@kernel.org>:

On Mon, 14 Sep 2026 16:08:02 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> In the 7.3 kernel, I marked a number of platforms and features as
> deprecated, with the plan to keep these around for the LTS kernel, but
> remove them in 7.4, see [1].
> 
> Cleaning out the deprecated platform code has turned into a larger effort
> than I expected, currently standing at 300 patches, with a lot of them
> still in need of being split up into smaller ones, see [2] for a current
> snapshot.
> 
> [...]

Here is the summary with links:
  - [v2,01/14] ARM: remove sa1100 platform
    https://git.kernel.org/soc/soc/c/95664df86fdf
  - [v2,02/14] ARM: remove footbridge
    https://git.kernel.org/soc/soc/c/21b5f207cb8b
  - [v2,03/14] ARM: remove legacy pxa board files
    https://git.kernel.org/soc/soc/c/538532cd1532
  - [v2,04/14] ARM: orion/dove/mv78xx0: remove all board files
    https://git.kernel.org/soc/soc/c/f98cb2a43e0e
  - [v2,05/14] ARM: orion5x: fold plat-orion/pcie.c and hw_pci into pci.c
    https://git.kernel.org/soc/soc/c/4fa61946d7c3
  - [v2,06/14] ARM: omap2: remove omap24xx support
    https://git.kernel.org/soc/soc/c/cbd33c61480b
  - [v2,07/14] ARM: imx: remove i.MX31 SoC support
    https://git.kernel.org/soc/soc/c/104a7a071639
  - [v2,08/14] ARM: versatile: remove Integrator/CM1136JF-S option
    https://git.kernel.org/soc/soc/c/1fbbfb51f20f
  - [v2,09/14] ARM: imx: remove nommu support
    https://git.kernel.org/soc/soc/c/2e1031df3c5f
  - [v2,10/14] ARM: lpc18xx: remove entire platform
    https://git.kernel.org/soc/soc/c/31431dc97977
  - [v2,11/14] ARM: stm32: remove stm32f4/f7/h7 MCU support
    https://git.kernel.org/soc/soc/c/6fa463cad26f
  - [v2,12/14] ARM: versatile: remove mps2 support
    https://git.kernel.org/soc/soc/c/1b983b054916
  - [v2,13/14] ARM: at91: remove samv7 support
    https://git.kernel.org/soc/soc/c/1b9867b95e1e
  - [v2,14/14] ARM: axxia: remove entire platform
    https://git.kernel.org/soc/soc/c/af4f7acd7b73

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


