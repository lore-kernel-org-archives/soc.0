Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCF2224891
	for <soc@lists.linux.dev>; Wed, 26 Nov 2025 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764179304; cv=none; b=NwcWLV+Y7nb/z/EViWhwCfRCCcXr/SwbToq3UWR1GhAjY6M/f0RnlhEuVP82ERra9K/wBEsfMXX9pJYByYk1hiodWWa62Dj7L3Ew3Bjl5iIT1zo1HbX8Ycqvl/Ybp6ba64E+erFaNMwx5nFO0O6aKF4skpnOoJnOYDBEGWV6uQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764179304; c=relaxed/simple;
	bh=zHBYHoIByXuUM6ZleC5iGbaw2z8W/IszKtZZgdJ89O8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=oMLpT2siNB5mduCYE4FSAwoeFwoUso9KwLPXHApKMvFNqJIBvBT5YmhGVi9d5PGFUuYHOGseW0Tvv3S6QN1pyCI5ZjgrH37fnzQ1qRfU7nrFINGWzXeoDTyzC/Rs/XX2X8OshNqLoUlsFKEHjQsQ1QwSdfybq0/M/sAtuqX5ZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX4Vmyai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX4Vmyai"
Received: by smtp.kernel.org (Postfix)
	id B92D9C113D0; Wed, 26 Nov 2025 17:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57D3C4CEF7;
	Wed, 26 Nov 2025 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764179303;
	bh=zHBYHoIByXuUM6ZleC5iGbaw2z8W/IszKtZZgdJ89O8=;
	h=Date:From:Subject:To:Cc:From;
	b=kX4VmyaiDxa17k+okdxjkYfABrWXS+EXefWfH6JVvpxNfhRAVpFKPiICd3Bystihn
	 GrLs4DouIYtQKJjyXQGfKYeP3JuzYxd2BMVCAesTABcViULzqhB6rSIO/IWrnxL4rW
	 xr0zcuYGeidB/d4YjbupFPF0G+44YjWLT2Laxr8GB2XxL0VUZBuC3RZPqdnz9cOjDt
	 HyCNVaDffzAqpiJEjs23FGrynhJG/UH/5xOg++HtZTLZ0xgc5YMc2N70djpPLR1joD
	 1a9/HzWD531XpH/ZYn0KdF+y0aJW3OkzIiArRGg3AEsTFRabamxUqnOuWBCEH2TvIt
	 PPUTuCr9lmhwA==
Message-ID: <bd0f1a68-7e0e-4cc6-995c-f46561b71c52@kernel.org>
Date: Wed, 26 Nov 2025 18:48:19 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL for 6.19
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers changes for 6.19

Thanks
Christophe

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-6.19-1

for you to fetch changes up to 760b8eec2cf861c5b013f62c4af8ee06c959853e:

   soc: fsl: qbman: use kmalloc_array() instead of kmalloc() (2025-11-26 
12:29:40 +0100)

----------------------------------------------------------------
FSL SOC Changes for 6.19
- A couple misc changes to fsl/qbman
- Update email address for Christophe Leroy in MAINTAINERS

----------------------------------------------------------------
Christophe Leroy (CS GROUP) (1):
       MAINTAINERS: Update email address for Christophe Leroy

Gongwei Li (1):
       soc: fsl: qbman: use kmalloc_array() instead of kmalloc()

Marco Crivellari (1):
       soc: fsl: qbman: add WQ_PERCPU to alloc_workqueue users

  .mailmap                                |  3 +++
  MAINTAINERS                             | 10 +++++-----
  drivers/soc/fsl/qbman/qman.c            |  2 +-
  drivers/soc/fsl/qbman/qman_test_stash.c |  2 +-
  4 files changed, 10 insertions(+), 7 deletions(-)
