Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C654C24CEEA
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769640611; cv=none; b=nTKvATkf62yF+j0xXMy85mi8+0R6b++3N3oiCkpjZQKMHeXSJhKFoPyxVOLWLLGgPhpSvhTWtyDiOTPLVzNF3e1YrpDxEjNGgOPMjt4W4gAQZS2H07N2wUykcIgb7vpx0vsaZdPIdiTfaAmFQzzBdgYgp+F/KpyEwqVF/uWphVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769640611; c=relaxed/simple;
	bh=mqLBnlwvUOAYZ6/Eau24CDxAQUJZbNJwNxBNn+RX+Sk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NpV8m7ZMOB9xV1YM+6yC0SyI4PeQPAXGX2maqamAwWckpR1etcPVz+d/6/o/6vmffWVCDNbhG5sIaS5zoNalWsig0V8U0iEW46+7gr5Tr9EdWTlfsXiVffVsfVGj1VBrahSkoVl0tnO390cR6mTb5n1rB7VBjnFEDD+8HcPFvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZgkF2vm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZgkF2vm"
Received: by smtp.kernel.org (Postfix)
	id 987CCC116C6; Wed, 28 Jan 2026 22:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8CFC4CEF1;
	Wed, 28 Jan 2026 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769640611;
	bh=mqLBnlwvUOAYZ6/Eau24CDxAQUJZbNJwNxBNn+RX+Sk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UZgkF2vm4c+tmcs2Rh3UE+bUvYa+KoCIlyTwxkHUbZobp0XbcxgnnMkmVjgDkvGst
	 1SoFFT/Xph/YLGMPYJUU/kgkpQwguz5peReS/clrodi07ppR52wYoLY+Sn7OI9cM3Y
	 GWWwSIRrF2r1gsMAMh8zgoZfWXSTjghhHlc8d2cKkU33Ydl3x9jIE1ObleG3QVG0aK
	 A45MAtSsTbINnyVNgCmnpUKB4a8Oyd+hhZZwI8cdDb/jySEenMdvqFQijoo8vBko/K
	 nWm7pno03dgDK67c6T0TEOfLsH3xKlQgg8/hMHGMt7hQHmwIqWN1ENcZjcUwdU5Rct
	 dvnVUp6MFDeXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11AFA39EF953;
	Wed, 28 Jan 2026 22:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v3 0/2] arm64: dts: Add support for Kent SoC family
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176964060486.2263224.2371223213635434331.git-patchwork-notify@kernel.org>
Date: Wed, 28 Jan 2026 22:50:04 +0000
References: <20260127071530.25426-1-eleanor15x@gmail.com>
In-Reply-To: <20260127071530.25426-1-eleanor15x@gmail.com>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 27 Jan 2026 15:13:59 +0800 you wrote:
> From: Yu-Chun Lin <eleanor.lin@realtek.com>
> 
> Hello,
> 
> This patch series adds initial Device Tree support for Realtek's Kent SoC
> family, including the RTD1501S, RTD1861B, and RTD1920S variants with their
> respective evaluation boards.
> 
> [...]

Here is the summary with links:
  - [RESEND,v3,1/2] dt-bindings: arm: realtek: Add Kent Soc family compatibles
    https://git.kernel.org/soc/soc/c/d83bcab6842f
  - [RESEND,v3,2/2] arm64: dts: realtek: Add Kent SoC and EVB device trees
    https://git.kernel.org/soc/soc/c/b095c27fc874

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


