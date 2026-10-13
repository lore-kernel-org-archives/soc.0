Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D66B4FD283
	for <soc@lists.linux.dev>; Tue, 13 Oct 2026 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791907858; cv=none; b=PB2lCBd5BNOeuPqw21JqEWIrg3E6byOpcGNP/TkliOlVwGgcE0DDehRmv/ejh7hxc97ixH5hPz/ldoJFS60LI9i7W3LqlCMEz+5AZuMUuAYbf1b8wJAZdvd2M7+VUYVS7ax977h0UKGGS0res5742UhEjA0q0C/UgyFs9ACP9Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791907858; c=relaxed/simple;
	bh=c9wUsQ4iykeOErwIcfvg+dUN75TKwxTEBVT4+D9FgxU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=s54qQj61sv9HFCP6ooUvi3o1roJSCXD1kG8m2b+fwzWw4L4vqV/3DLBbjS1XOAHGyzloCpHTQaAGYTEpvET2sS2oaio+0DPeUV0VPuSr2nqLDkXkHjLF+MFh0pi7BloA1kGpEdvF6ptnC3GSevs7VLLbVAmtuvZ95Q24zhMy7Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZU/ASof; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZU/ASof"
Received: by smtp.kernel.org (Postfix)
	id 594421F00898; Tue, 13 Oct 2026 16:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432E11F00893;
	Tue, 13 Oct 2026 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791907857;
	bh=BwoS7SEaIs2SGjZaLA1O2BEG+keWCAcbPzJQpbqA1r0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IZU/ASofifqMlJxmfsDR420ORYm24jLDgM9n8naZlxyG1VMfRZt/D32YhF7BzSStL
	 UjF+DqzX2IkorjZFaAAmsP3nSEzlAB9VIjCeeqi//xukBpWLTxLTCdMCZ4FwPcGMKF
	 1ksvWtS2kv6zyvy7SlbkOtHgBaLBqy4DkXplrvB6j8Kv/8688q4OOG+wdF7EPgdefM
	 w/roUNU3YYDBz7zLS+qDOs5lIA8e9ublOL6CbYJVKWswa69xCRmA3xtIn5TWL3bu+a
	 DjqisnVrHZjWeIGG/A4JX7YFkieNgBA0dzhM5fw+tpw34elVz7USRSDrwjtqVqqQCi
	 jJ83hxyd6w/GA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A20F39D5FD8;
	Tue, 13 Oct 2026 16:10:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] bus: arm-cci: Drop cci-control-port node reference in
 __cci_ace_get_port()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179190785576.417156.12603332394740019251.git-patchwork-notify@kernel.org>
Date: Tue, 13 Oct 2026 16:10:55 +0000
References: <20260923164122.596910-1-oss.patchbox@gmail.com>
In-Reply-To: <20260923164122.596910-1-oss.patchbox@gmail.com>
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 23 Sep 2026 12:40:55 -0400 you wrote:
> __cci_ace_get_port() looks up the device's "cci-control-port" node with
> of_parse_phandle(), which returns the node with its reference count
> raised, and only compares the pointer against the probed ports.  Neither
> the match nor the no-match return releases it.
> 
> Drop the reference on both paths once the comparison is done.
> 
> [...]

Here is the summary with links:
  - [v1] bus: arm-cci: Drop cci-control-port node reference in __cci_ace_get_port()
    https://git.kernel.org/soc/soc/c/810ccc792193

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


