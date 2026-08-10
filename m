Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C828031714A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352482; cv=none; b=dSBoJlWsMvQFxkx8uGfWEZHaJjU/tOSJaRjEzZBqLEMqC2uVCLFnLU1KaZHze2ysGXaP0rYh5Zo8hg2WBHXmN7U74BRUjMKJqD/I0O7asmDTlJNiCEJsgYYFTEE8tuz6Xa6JvYujr+rtURpzlVRPIn+l9cnjf05CwdHalGAnV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352482; c=relaxed/simple;
	bh=kjxr4uqJ6hbGRb6Qlb4bMUgdSWrVnJkO13jI9trfkNA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AM2Hq8W9Ogu7G3VPW3liPRUEt1XmFQyOMYkIV/giRyZ4Oo2jCBlC3zr0ZILbDuUdhj5Z8R6Y415G6r/VKiVV7CUjsVa3ljY5eMW0vdtVq+QWPH33kdVHm7iIwUzrsHAj89DXB+EudTfBIrj8vEsB+pmJ2j9bECBCsDNZqen0CwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5Q2XcEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5Q2XcEp"
Received: by smtp.kernel.org (Postfix)
	id C403C1F00A3A; Mon, 10 Aug 2026 09:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF851F000E9;
	Mon, 10 Aug 2026 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352481;
	bh=SG9P7YuejP7QRY0zRDLmc/cm4p5zd3wJRgjouLYtgRg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z5Q2XcEpoQ1sO9dOFBvsfON6LybfrppGZRaIwldbaRHBzw+7E6iKAC5FFiSwoCzhh
	 n+eTaYPDv7PFrTZ979ADKnl/bobA5s4hO8n/FlhkwHNSIJJBbj42I1vRPYvyCyEZax
	 vGDQg+LpFfFYgcqc4TOH/x1HYlHGG6H1JBMbh6Bw3r9XwfWYEAnygsVCJrsGlCRzPy
	 d+EDflZu7KhVixcKHryz09nW8uoL6+IY6U8ZvGuCGWcx3u/IWLspYfyPi2R90cDzjP
	 OxeYRNqxYme+/ni6eS98E3YUMBI7mK3KtACE6Ddp1FtTNXqOU2AUkNRJ/eXXPN31Of
	 wfgYcoSl9JG1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A003924FC2;
	Mon, 10 Aug 2026 09:00:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: k3: DT updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635243838.3658557.2011494006895586704.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:38 +0000
References: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
In-Reply-To: <42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Aug 2026 21:31:34 +0530 you wrote:
> Hi ARM SoC Maintainers,
> 
> Below is the pull request for v7.3. There is one non-critical fix around
> MDIO clock which missed my eyes as it was tagged to different  tree in
> the $subject. Interface just runs slower w/o the fix, so no harm done.
> 
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: k3: DT updates for v7.3
    (no matching commit)
  - [GIT,PULL,2/2] arm64: defconfig: TI K3 defconfig updates for v7.3
    https://git.kernel.org/soc/soc/c/373eab9eec31

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


