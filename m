Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E075376465
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 12:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858410; cv=none; b=q3o9+abhAQadNtyRC1QGSzD3RplGsl56S+itapNnfUJCn0Fc+iSPMf6wPqn3N9fXYPxEPSObNvHmRYsRzosoAaie2KJOLC2T8Yq+NZ+c2T1m1Kz6BGz4VF9BEQxN5KTOnbGSNPybexKOkZGS1LCgxfRdxjn1Ob0G4Dq4BeIIux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858410; c=relaxed/simple;
	bh=HuXYEWRpZpD7ggxskvbJGMp5/WPqmc0lgOAhdOxbc28=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=jNUt2BLCo5KugD1VSwemsnAvauLEzDySTrAnU1XuAUIPSgIQDyrPoITRubwQM6ACl89CidtRjjK5sV39YXdS8UgTOCvOrx9Imup4i6NAjwFOml5PlJrBhbZ4Q0sNdVCj5Be56Hc5G2WRzJ8dyTUWkaGYJ7LjXidIq96YFGL2LEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qw2b6d54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qw2b6d54"
Received: by smtp.kernel.org (Postfix)
	id B78641F00898; Thu,  1 Oct 2026 12:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17161F000FF
	for <soc@kernel.org>; Thu,  1 Oct 2026 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858408;
	bh=m3k4zHsAskDhELJggFKo4Vfld8b0AXZyQwJ51Pdj+vQ=;
	h=Subject:From:Date:To:Cc;
	b=Qw2b6d54p+gi2RXjd6SkBpi910xjDAi8LcqyJyaGXoVSKGKwBuU8+ehiaib/j6Gof
	 svLwweiU0ZTrvSNSDIUDU2+8+SXGmED5oH3loIsm//kJdAt+pJm++kl4Ts7AhPsTqq
	 6YZ0FYo2RpQgLymVasOsax9oI/QfBrBts9+PzoW2gWEeMpe2HSkg0mY2ua0+B0xfen
	 UPFb3L2q7tspxD6dG+NJpo7jdkSHROjVJKKUUWTDbGZqfyA777kSPA6xlLH9OLxpn+
	 bTj2HeiL2bcDDG5ip8ZF+/bTsfvPSaSw9PMTqJqS8wfsHaBKDocMyhPyJatrnLiXFq
	 JYWQGykbg3dpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79AB1380DBDA;
	Thu,  1 Oct 2026 12:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179085840698.2440143.3610184391451447207.git-patchwork-summary@kernel.org>
Date: Thu, 01 Oct 2026 12:40:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: deprecated platform removal
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/series/1164662/
  Lore link: https://lore.kernel.org/r/20260914140821.1805449-1-arnd@kernel.org
    Patches: [v2,01/14] ARM: remove sa1100 platform
             [v2,02/14] ARM: remove footbridge
             [v2,03/14] ARM: remove legacy pxa board files
             [v2,04/14] ARM: orion/dove/mv78xx0: remove all board files
             [v2,05/14] ARM: orion5x: fold plat-orion/pcie.c and hw_pci into pci.c
             [v2,06/14] ARM: omap2: remove omap24xx support
             [v2,07/14] ARM: imx: remove i.MX31 SoC support
             [v2,08/14] ARM: versatile: remove Integrator/CM1136JF-S option
             [v2,09/14] ARM: imx: remove nommu support
             [v2,10/14] ARM: lpc18xx: remove entire platform
             [v2,11/14] ARM: stm32: remove stm32f4/f7/h7 MCU support
             [v2,12/14] ARM: versatile: remove mps2 support
             [v2,13/14] ARM: at91: remove samv7 support
             [v2,14/14] ARM: axxia: remove entire platform


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


