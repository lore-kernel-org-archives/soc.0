Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAAC1EA7C9
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944266; cv=none; b=bU8kxcpvtV7P/3bUK9AZ7ZN2LZPi5771qyX5rNxeipuy+ZEyMxKue2xbHutkXALGPHcI4N6PJRdprB5Vl3fZ9uzggL4/LltJC7CKhrRU9ggk97+73uLbshM6Lv94VRItM/X3iKu5cXmAv96aU6pIcorZNuxNl/uoiL3oDbjLy80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944266; c=relaxed/simple;
	bh=afNnkROd5ArK/xC5IJvZeDWda+RmAIyZ9GdgVIavtIw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YavfH0nnsAd6ZBVJihQMqMkx4dLkezLo3kSHmITjYaBfKGeL67WsJ06btKaAmdLhjVuKAjW5yu/EqNk1es99VniKPkii15XCH3frFnN0EsSHki6zDyFRtrQ1ClPznpPQ58amGfimctPDPCqfvwjADKXgiuAqiYDrzMTiu8YQCRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNkx4c1t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNkx4c1t"
Received: by smtp.kernel.org (Postfix)
	id BFB01C4CEF7; Mon, 15 Sep 2025 13:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F34C4CEF1;
	Mon, 15 Sep 2025 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944265;
	bh=afNnkROd5ArK/xC5IJvZeDWda+RmAIyZ9GdgVIavtIw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KNkx4c1t/m/V5YSIzMpOZ3S6Nkd5s1Vym5ci0Wh0KUJNWS02UiFGX3Yk6GJi+O5YC
	 XWt+9Foedz0JFYEZHeZUqKDK7RTIHBeMg2xVUStQRctQCW1TQiT9+maSo3XN5YTkm0
	 yvbSuySr4GHPA1rYtGtHe1hLW4uJ20dOzSOEWhKPjEnU05Dn2MJcxlDWuwWoeBmtxV
	 63uwIngnR6aF2tjzgqxNJVyiey92u40XP/MLmdRH/cPIkMVEGNnslSaP0Cfhaw/437
	 6Vr2lgarhLop494nVhBhCwvfGEal35zFI429yNh9OH7zihOaad2tGIE76WnxTsypa4
	 0YITratiubYGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C6039D0C18;
	Mon, 15 Sep 2025 13:51:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.18 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794426724.4179625.4036561770628796484.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:51:07 +0000
References: <87frcrn1o0.fsf@BLaptop.bootlin.com>
In-Reply-To: <87frcrn1o0.fsf@BLaptop.bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 17:14:23 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.18.
> 
> Gregory
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.18 (#1)
    https://git.kernel.org/soc/soc/c/b4d01b6ff233

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


