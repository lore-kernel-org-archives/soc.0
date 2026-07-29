Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E64F3AAF7D
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340852; cv=none; b=BbZkL2VVnvYoLR1cOuP/V46tcCYLC8zocNWdBge2K0IL8CKSKhIzvwJg3R7UHq4AfaXP/3AtB0JGd/WXgGv9s9bv7R/iB+dwQ9AyTmZYEGRi6WkKW+AIKajXujibsByX44RtpbCwKlNp8FqKHuhETJpS3jBWFjUmvjbyocpx/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340852; c=relaxed/simple;
	bh=lKjd529bWofeGXhfxj46mPGTOptb8Ek3dI4ZkL66V4U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=S0soZk7WPCpn2c0bVxApHPjasZrUXkqA33y3sI1zBd/814HtlveVP5R+ebxDsAwZcdcXf6qsMlx8g1Zyv+0VQ3rR0JfwQdfEiuy/7Nmwh67g7FpD70hTLZrtM9anC8mY/nY7OCcxug6Kd90gIXVkPAKR/42KLyskYnZsJ1x6LDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQj2v35I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQj2v35I"
Received: by smtp.kernel.org (Postfix)
	id 401E81F00A3D; Wed, 29 Jul 2026 16:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295151F000E9;
	Wed, 29 Jul 2026 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340851;
	bh=EI5lIIZE9F29IWjpHMSlAh14VejkYGX6fIl8C7tNJA8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hQj2v35IzCiDw7BtKRqxT+8FnGA+oR5ngXgFkMRKIZ90D5vgvfKfCF8Mat34qFqPc
	 jHtQDHaEMFHX1gcpv3HxTNoYw3gx7CefRwUeNyjIRA6E3JwPH7HJibaUwF1qtXfFWI
	 C/OlHFtO3LbF+rtQWQrJBgMqp0g1gvN27mePVNFWQqQzl1tQGks/GsM356NDk1ewY4
	 /tK6qgnPjHWj6906hmEu7alRTfmc0z39Vdad6ELdmP+eeb7ny1xItbnxpe4hewYZKg
	 ikmf0lzTJmdeu0wRXm+O7pwjVEtqRFBcadLK7z2I0PC7kw7LEjXvSKTD7rEuAuaLPi
	 2xmYA+Lmnd7mA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A1039253CF;
	Wed, 29 Jul 2026 16:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081523.3143403.15971312268374073310.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:15 +0000
References: <20260729032308.1359743-1-dinguyen@kernel.org>
In-Reply-To: <20260729032308.1359743-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 28 Jul 2026 22:23:08 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: updates for v7.3
    https://git.kernel.org/soc/soc/c/dcfda9ceb6eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


