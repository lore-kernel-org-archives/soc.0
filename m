Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17243128D9
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826994; cv=none; b=i20RGdi5VHFHK7qmg47/aaOZFNlKdJjoNbxDZ0+/csxkIMn8YBH7CFpJoUljoN5xqO15reDwPcoIjnzzKqYfZ8Di8PPnJ1ICSFWJQ1Ng7L4jVEITtvbIdJGxKao7JLwJa3d6qSHO+CZQ3oJABCASr55KIFypgnn7ci9X3v55i1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826994; c=relaxed/simple;
	bh=F73lsA6VYF0emaVpvMIpAO+47R7upRvj3a1HkwZHoGk=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=tGsiBJXN+b4gqEPU2kS5jcM/PtZNeEUBhtEETT5IWCohZmP/tGQ7rBT3cnQSmtyLcXL9l8od/7rVpdCCofyXD954eJAs9aDZKyald2T+k+8Uc/92wRwz2+hxk7VMXsXovVh/tP2vVlDlWxMEUlxtPE1xgrh6bK3DfcqoFVNnI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=H4K9HCfP; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="H4K9HCfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785826990;
	bh=qXzc8xnYbWowhoGDOoifA47wg1cCzQKm9c6k8J0ADYE=;
	h=Subject:From:To:Cc:Date;
	b=H4K9HCfPzmEExrjN+zsd2ZVcn+t2WRv2iUUva8SxCmNBBjexcqtLxevBzZDC0+p3K
	 AmochYOVQHZLBHkUuzNZk+ScehrWG4l9y0FWf1LFpeVRLsr/dHtE8/AOulT0KZhLNG
	 idNvzygCWS/c5xu2eu1vV3pRxCXebHEkj0KK05hRqOtVTrUJXWz4RsZJJDjbJy9KbJ
	 dsE1oRDLTfbMzKhbpMqYZau3k4KZIWE2VFL1tspgSTBaIWjsP5C3QCa69pdlgXtVwZ
	 kDrBVwsQ+K0rYQgVw+EY0I3c7FWMVDuFzZU8O2AqB7rCJA2PGpvM3SYsU7wHMtiBig
	 QAIc6a3IjviPA==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D2F47655A9;
	Tue,  4 Aug 2026 15:03:09 +0800 (AWST)
Message-ID: <7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of ARM arch fixes for 7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:33:08 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-7.2-arm-fixes-0

for you to fetch changes up to 8eb052f48331474c2789d07b7f11165c323bd2f9:

  ARM: npcm: Fix OF node refcount leaks in SMP setup (2026-07-22 23:11:56 +=
0930)

----------------------------------------------------------------
nuvoton: First batch of ARM arch fixes for 7.2

Again a one-off change, fixing OF resource leaks in the SMP-bringup code fo=
r the
NPCM7xx SoCs.

----------------------------------------------------------------
Yuho Choi (1):
      ARM: npcm: Fix OF node refcount leaks in SMP setup

 arch/arm/mach-npcm/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)
