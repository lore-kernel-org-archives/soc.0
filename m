Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFDA486434
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398674; cv=none; b=izUekZEiSXPndSHsA4aohkmg7TMgmpXsFbu9tLihSaKRqzgATNgmpb1O+MTq1d+NMBY6A+wPwgiE3+nAilVJcrr17ECnW5opNRIcbpgr3tZKd4jUC2Nnk6yz/FWcmAbtbpFa+1W+gwHMx/sylgkzoL9UrTFPiJbNskXUTnl04y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398674; c=relaxed/simple;
	bh=W8skMbaYkkOZOeBsBbe1GdOUQqZWJYpVT+PD3yRUKZY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sggYDpo0DzulknkhV8RhFtBxlr6qriM1FU3yDDliD1CrJZgdEjNTKz1MtBd3MxJfo5CsF7VObaLwedifBETlQpq+mTWg15sScRK++K6cUC6ne8GJv5kWeNDYlTg7cINev/iIR6ThvRuuYCBuL6g9ZtvQK51QAOAzVLrJa1e2xuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSnEIbLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSnEIbLV"
Received: by smtp.kernel.org (Postfix)
	id 478A01F0089A; Mon, 14 Sep 2026 15:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312A31F00898;
	Mon, 14 Sep 2026 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398673;
	bh=6m2zfX8GDAcR7LGbzMGgfHrbTylqIE3KhOipNHE+AmI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bSnEIbLVJmWwJYmOW85TgxcxqBEwfMi9DvyGnWeulND2cLv5fkJ2Mnr0uKUTlUXEp
	 9Cm9hGPhBhB/P3UXGMOyreDyJXk3UM/M4y26VortMDuxUhqiDUCmREykn7LVCbOgxs
	 mgs8mtFHwXKbufVu9rvu2cQ7YbP6Nf7eRj+x4sAihJ9uDjJjhWUOgHQYHjho7TsnPH
	 vhncnuPCJxpOtd40CFa7Dym9K0sVUmZeAQuhHAvhqoyjhw+wLHafXkAgAFDpvrKpQc
	 8U5f1I5JZ/3iQWjyAAgSwPB4TKinz1u46YGfZwIaX9wEMrPj2npkpG0wtDIlAnkzrJ
	 Yv/E9CtNubxdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B723924A6F;
	Mon, 14 Sep 2026 15:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL]  Renesas SoC fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939860812.630437.13457975441729193602.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:08 +0000
References: <cover.1788527983.git.geert+renesas@glider.be>
In-Reply-To: <cover.1788527983.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Sep 2026 15:21:23 +0200 you wrote:
> Hi SoC folks,
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Renesas SoC fixes for v7.3
    https://git.kernel.org/soc/soc/c/2d5adffc11cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


