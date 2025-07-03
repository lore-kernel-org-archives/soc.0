Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655A23BF83
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558393; cv=none; b=pCGkkDkeBdcgg3hmMnP2QoFUqUNDE9FR4BBlQmnmCmQo5CRbHe6z033hW50FZ2HvsnejOtk77hJKoYqQbUQK1kk2v6KVxASc/mEo54WfrstVM91XDUSfv+07+SZhMiz/iDC9txywBna1XX6tr+Pk9IvcwuLni85lbmL7GCzkLg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558393; c=relaxed/simple;
	bh=ARfppqc3j4nsJxciTezo/BiKE+sUJvjGjJh0oz4Qyk8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LTzrBpwHkd57TvkBYdT2r7PiYKS/UtTCGAEKrRyAb1nMmGCd2xvEM02e0XSiv9rDsEowk7nKSracx8b7ik7iEiZrK17aderLYDuMM0vfyxUU+jjTHFjXxKJUt1cH9F2Rq4rpjH4foqhtL/bacNXPVpeI2JBNRxIn1iB/SRQ4HDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqD5We74; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqD5We74"
Received: by smtp.kernel.org (Postfix)
	id BD3D3C4CEEE; Thu,  3 Jul 2025 15:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74AFC4CEED;
	Thu,  3 Jul 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558393;
	bh=ARfppqc3j4nsJxciTezo/BiKE+sUJvjGjJh0oz4Qyk8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oqD5We74QzLjEegxFOm5lWjTK5cyh3myWu3hgdAJPVKd5OYvw182t/bLZHSndwGow
	 F02qOhiHDATWdLDhgsi+74pNGafGAsseYJMNECv4nT7shLAjf0ZJPNdbeRewCHhY5Y
	 ptmB4wayLVRpGnKpNEyMgLNRGqYOJAbiaXFjCfHZ3hs1qCU1dotTR1L/I75w2ciNsw
	 +LCrjojDjCLpJwMscYkqdW4qGf9ZYfSufugGvl+veQnr4WpVKkCZ3GtMhckZHJvZHz
	 iVf80+hTJtzP1ejkNMvfkjB6ketuRm9pH/lXLCDrfgXLzMBwFp3tlofKmR2nZzbMRR
	 Xm4TDu7Y0ItFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3414F383B274;
	Thu,  3 Jul 2025 16:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: lpc32xx: Add #pwm-cells property to the two
 SoC
 PWMs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175155841774.1537604.15525267924933556218.git-patchwork-notify@kernel.org>
Date: Thu, 03 Jul 2025 16:00:17 +0000
References: <20250701145803.140004-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20250701145803.140004-2-u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40baylibre=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  1 Jul 2025 16:58:03 +0200 you wrote:
> If these PWMs are to be used, a #pwm-cells property is necessary. The
> right location for that is in the SoC's dtsi file to not make
> machine.dts files repeat the value for each usage. Currently the
> machines based on nxp/lpc/lpc32xx.dtsi don't make use of the PWMs, so
> there are no properties to drop there.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: lpc32xx: Add #pwm-cells property to the two SoC PWMs
    https://git.kernel.org/soc/soc/c/36bbb14ee743

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


