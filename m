Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554B7266583
	for <soc@lists.linux.dev>; Fri, 14 Feb 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545800; cv=none; b=hM95MedEMhbW1nJCeA/CG2Uv1bt0ZMhRjgxMvTxr1bUZ9sx0TvVABnva07XHqKidsawtL5PuxzRMQLNIi27cOz0h7ivlllKtodK+W2PR8B0aXJ7rEeO4B8HiUc+SXw0Q2CBEN4LrrY3gXkdSggBM4/rZKa/uFpYwZVj37cg5R2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545800; c=relaxed/simple;
	bh=lXNaNktyysTMSRHvfBTCl0mbaFlMAtIQ+yQlSo0bTcc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=H0yDyiwgHzd/e4IObWUi4TrElIQWZF3D+Pdye7T2b0ka0u949nHHgNj8y2/YlOfCBD9CLqS5tHqhd07vAxLQ9RJPm+f0h8mZr/kw1n9wcPalUbhy/QT2OMBJjW5RxH+KFTNc0z5zHyeFoFIEn48iQrz8xctUtGVSb/y+OE4pNu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIbEoRqQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIbEoRqQ"
Received: by smtp.kernel.org (Postfix)
	id E1467C4CEDF; Fri, 14 Feb 2025 15:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C5BC4CED1;
	Fri, 14 Feb 2025 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545799;
	bh=lXNaNktyysTMSRHvfBTCl0mbaFlMAtIQ+yQlSo0bTcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gIbEoRqQfTtrKAup+CEYIUYyXEtStsyOeH3/ypVuI/7h+geWalOe+KpqUvZ68NpsJ
	 FJ6jRLWZ3jgMkyOLvkvqn5pf2BScKdz7G9IGAkvDbNNUAGz+1BGTpk9CTFe/vb9xpz
	 Jk898f3ijbHusslZxpHXJA4xQBJg34m0XziVYpFxdlVMpsIQRpj9zaFgS4VbHy1NYb
	 3QiUjEHQXNqna5zThi3r1/MhOpbwsE1fEmv+msyLp1EDyJZw6P9p/UG5FOnEDY1uq2
	 z6QXPc+a0kG4c2DfPKroAciDFB/ae/5AoXhSkWG0ZdqdAkt9yaYXYitCWKp4NLf4Yp
	 qKnPBAe1eelfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711EF380CEE8;
	Fri, 14 Feb 2025 15:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on
 ARCH_MXC
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173954582900.1980112.13730474611170457705.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 15:10:29 +0000
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
In-Reply-To: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Feb 2025 15:41:43 +0100 you wrote:
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
> 
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> [...]

Here is the summary with links:
  - [resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
    https://git.kernel.org/soc/soc/c/be6686b823b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


