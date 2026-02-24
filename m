Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB1D39A7EA
	for <soc@lists.linux.dev>; Tue, 24 Feb 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937530; cv=none; b=lYhR/su01Kxx1e8oW3T1NZzH6mJFy8Y62QavBA9M1+tgPz6TeQh+4QA2QhEqttbnfZoja7zXqbPVqU/x1FlQ62e3dtqGfJ8a6cWExFYnkPx56Pll4QZl0VYFWQUcpZCDtKw12DSz2Ka7JS1XBvGcqnqrn0+FXFnd3IC9rldO8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937530; c=relaxed/simple;
	bh=g/7y2rXmvkKfH/G0KbA6QgJBJUX2lwbV+InkRJINX64=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=mjk+xsm/ojENlwPl6z34OQOFCuIQspb98gOArvfTWVUD01mEW8bj4kItsvFJoDHR5At1G51o7/1xtLbe80ZljQG2eHASWth5xAlts5jDiYgFpRZI9wVRARGS4G8lvLVL2Oqa9aFyNs1T6qF6Zn1FvaI5uLuvUoUWAQdcK234kRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR501j1u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR501j1u"
Received: by smtp.kernel.org (Postfix)
	id B303FC116D0; Tue, 24 Feb 2026 12:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92774C19424;
	Tue, 24 Feb 2026 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771937529;
	bh=g/7y2rXmvkKfH/G0KbA6QgJBJUX2lwbV+InkRJINX64=;
	h=Date:From:Subject:To:Cc:From;
	b=GR501j1uIbm2CH1slVFigjmebamF103Gqavrxso0wYoiaiVekel5E7pG/9sPYA+Ko
	 P/5ZWHOkelKl4WVlaObzRxVMXgCZijFrTIvGcRFIIQ+7GRqUeFMjJNCfYzOrLuNnWw
	 PH6mI6T5Wf07qHafdq1fKNXiVUAJ8rvGKvlDpJZK68L+hj4ly92XGYEobH351nuE0b
	 a6AkbM+TtmaNHAE0m+TLdgWeagp/X0Tdl8JfLBoaMGWhoJqHdelrMJfmL811xWLnqp
	 wBWIlBjTKSesVsBTWuQ9cUILgZ52KLjsJlT6MtOCgcJ/bbCG30CAkpVpMBHM+mnWb/
	 +KhxSYb/bNFAA==
Message-ID: <741919dd-743b-4f6f-b43a-8a107fd31754@kernel.org>
Date: Tue, 24 Feb 2026 13:52:04 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [GIT PULL] SOC FSL Fixes for 7.0
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please pull the following Freescale Soc Drivers fixes for 7.0

Thanks
Christophe

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/chleroy/linux 
tags/soc_fsl-7.0-2

for you to fetch changes up to 3f4e403304186d79fddace860360540fc3af97f9:

   soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() in 
qmc_qe_init_resources() (2026-02-23 14:49:27 +0100)

----------------------------------------------------------------
FSL SOC Fixes for 7.0

- Fix a race condition in Freescale Queue and Buffer Manager.
- Fix a trivial error verification in CPM1

----------------------------------------------------------------
Chen Ni (1):
       soc: fsl: cpm1: qmc: Fix error check for devm_ioremap_resource() 
in qmc_qe_init_resources()

Richard Genoud (1):
       soc: fsl: qbman: fix race condition in qman_destroy_fq

  drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
  drivers/soc/fsl/qe/qmc.c     |  4 ++--
  2 files changed, 24 insertions(+), 4 deletions(-)
