Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7537206F
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023241; cv=none; b=gPN3IShetfk3xkLR7MQz3Huoa3EWF+9ZpDOeXlFL2Wsysrku67mddmmRYOpMz5LXMABFY8GZahwiedEp2U0dwiJG39ox/KqO1pqIDorCbvunubuMBoEziTD9OCEYKtjrDeaFu2Eip+y8NJTEie2PsfrF+KYOAdkeq+Hc85c0Ef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023241; c=relaxed/simple;
	bh=08RzQWuaaTDmpW+1C9+jYB2W+mJiYkMKmhXDOUfdAkI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=U6xpYMZBC7XcDjfPGBEttc1GhHO+eK0nC/UMs4ZmORQ5ljJSAH1ZQfUeBdJ0FECQ2FP/FTXFKUV0pYPjlJuWz1GdFYCbGb4wGbKLuUih8v9Uoc8Xu4+Zv9gHxTSM6BwWeDqFGqtW1ap3nJyxfjNIE4pwr+JURqqZgSMq2AXEv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PwGdNC59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PwGdNC59"
Received: by smtp.kernel.org (Postfix)
	id 1E5E61F00898; Tue,  9 Jun 2026 16:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085681F00893;
	Tue,  9 Jun 2026 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023240;
	bh=WRHHTdpSXn0J6YGyQupHhUmjT1Wkg8swILYHI/Oho+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PwGdNC59hhmoksGVe8+7qQwnSug1b+5ZuHcUPjZDP6rYJV4paVICP4VbRA43hejzS
	 k+nM6Ln72n0P3KTffMsLUajeDU92JbzWs55U75i1uR+WryMcSYlonMKfq4gqidjq7s
	 1fkX659NeOJBb6KXpxGNQSH5vBvMnSZskL7QL6TsW3Ag0ZFwBk+sfVKUsTgZZFTOTL
	 ld6nbxbZTakDUUaw93Vk4R3rgwIg/T/6Oi0t46ycemi286AgR6KTCDt4riiw5C28Xj
	 TYcU5s01doCyjGXkmYEQKMQ2hdaqi1f207qUKiOViYZn6FYosrC+C2FNslseOkfA9r
	 +8DOvZW/Q1Bew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9388E3930989;
	Tue,  9 Jun 2026 16:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip RISC-V devicetrees for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178102323813.2135346.16496740232802300426.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 16:40:38 +0000
References: <20260608-grumbling-gigantic-b0bb128634f2@spud>
In-Reply-To: <20260608-grumbling-gigantic-b0bb128634f2@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 8 Jun 2026 11:14:42 +0100 you wrote:
> Hey folks,
> 
> Please pull my changes for 7.2, all of which are cleanup/low priority
> fixes written by yours truly.
> 
> It's probable that I will have a second PR, because I am waiting for
> Stephen to hopefully merge my Canaan clock driver series that is a
> pre-requisite for the addition of the Canaan k230 SoC. I'd have sent
> this earlier, but I was hoping that k230 support would be ready in time.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip RISC-V devicetrees for v7.2
    https://git.kernel.org/soc/soc/c/1012d4d9f72c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


