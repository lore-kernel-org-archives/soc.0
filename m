Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3274A3F29
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398693; cv=none; b=bTjROtv8nnZpkyYWL6m6bgxcvLElG5MMTkUzDTWuBfXCPyLZhzGnnjNm2UbWecfEdBgrs6+hXgx324C6J2WIbSz6ULqTZHJFTwr0+NXMUkTtatIvH8ZuriWVmSIwAvFckx4rgHNybGz23Y4lVHNIEjGL9ePw5x8ebwGKTY8XUfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398693; c=relaxed/simple;
	bh=34S3fBQIPRcIJwjwZ2JdIREgOKyfYs12S1XwL8zG0aM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BrdJnFURp+N3ODXICSAT4Ep+QoajJP8y5XcOsZaS0oBmBgkjXMuKRgkqK9EJyaMEq0vApvfNi6nQCZyb5xIYOrHjMu7qFXtivn9S+pZdKtcfoLZdWrIX07+k2NP0dPCwqZhu/sIuT1IX/bFq7JxJAnRtW91/Ka2B0MMh3T1bS7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+7MlJYI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+7MlJYI"
Received: by smtp.kernel.org (Postfix)
	id 85EEE1F00899; Mon, 14 Sep 2026 15:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8371F00898;
	Mon, 14 Sep 2026 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398691;
	bh=/KhDaaZpEPt7K8/3H9dMGqWfPfo0FihEgNW8llJtR60=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=E+7MlJYIw4ruWmghUVTzQvvLwyMNcm15Q8S1Uji4FPB7lUEjUvOynAh4lqKuyvEub
	 Pz+Mm+Q9szNDkcmKaS3C8VUdQA1deV0O2Y84NpP+7bRxqfUngSF6YICjoGFjG3VsnV
	 1CCGPlCwMJulzVG9xIlHMYvfFtm4YtSA/UjRGUG2lqsgA4zfapNHDwwOXZSNd0BsYl
	 j866XRDmrPY8Vf4zkkjGtgd3RcsGhknVylD8DcIbm2OlCSfqwVCEeeZ34W9X48kgLq
	 mYkEnXtsL3tg2Qaq02XZFM0ZzxT0YwxSTfoGaXn9Ma7ZKjD375QO1hoGcrpPLEO+1l
	 CeqY+uKV7Kdng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B2E3924A6F;
	Mon, 14 Sep 2026 15:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: socfpga: fix file access permission
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178939862644.630437.5506877972481160356.git-patchwork-notify@kernel.org>
Date: Mon, 14 Sep 2026 15:10:26 +0000
References: <20260907162016.1148705-1-dinguyen@kernel.org>
In-Reply-To: <20260907162016.1148705-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  7 Sep 2026 11:20:16 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: socfpga: fix file access permission
    https://git.kernel.org/soc/soc/c/ebdad7d867a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


