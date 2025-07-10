Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348BE27FD70
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 02:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752116043; cv=none; b=u+BnlMrYEfeGA7Gzuveh5q66yUk10OHfXstkjpJLh+ZAY632oKWcjJmGUgrRTkKFK4h/mafBgaRYcb71LIbhwdOanNrhi1rcgDQoHnIkjtKiHVXkR2N6YKpnf0u2EIxmaAPsEQ/nvSArAkSMKVYfD/95rz4JCkGsYJBrDJKZW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752116043; c=relaxed/simple;
	bh=q461qi+6eQxV71VQ/tzFqufYpF/M8CGNdgnC6kmWhiU=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=EEHKvy75TEETaXW1l3NJS7a/zIuA8mw0A5tk4u/01ewxC6if2IvmM9u1h1aIWRHCorYaLO7qIHRkjwJFGr/jugrr2LHVk7Ht+gsVsF/+TgD1M3W5BnIxPveDRouhxCz9EjTrwIpb1lrUwvjb2rWZuwwSl2D/+nOc/xpMSIpQBBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=bjicqfx2; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bjicqfx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1752116040;
	bh=8dzREoZ/WsyaHQKz6zD+3j3tk+9rN2BHKiKlFhHQROA=;
	h=Subject:From:To:Cc:Date;
	b=bjicqfx2rgywaAX0RM2JysJJTO3TVqwRoCaMymwSQcoJL5VujZkVZM+TNowxxjUuo
	 v6BuM6P+Px0ibNyrm/wG0mfebevRTIvUApMST7bTO7upckx19xnc594OiAHYPXRdht
	 zJuS+zk31AZxWUbG7Y3qnapLI4xjSUyN8RJnypB8GRfkrVDu5LrLqxTaVkCVLKbnaG
	 vb2SntBDI9QjLtYdlhjT9QANxeVgLG2Tx00M0DBy98Vdtf269dwFjJlFliiDsDGPDU
	 z6dDpDjnhPnpMVSDlrA9fVdcvq5QDVMxQccQNN+FgSiPPny1CFPlHPpRzB3VtCGPrp
	 NSCBI15IteGPg==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D2D856508A;
	Thu, 10 Jul 2025 10:53:59 +0800 (AWST)
Message-ID: <9123f151280e52c63dcb645cb07d4eee3462c067.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: drivers changes for 6.17
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-aspeed
 <linux-aspeed@lists.ozlabs.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,  Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Jul 2025 12:23:59 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

I've done further rework to the ASPEED LPC snoop driver in addition to
the immediate fixes found in the PR at [1]. The commits in the tag for
this PR build directly on top, so those from [1] are also listed in the
shortlog relative to v6.16-rc1.

[1]: https://lore.kernel.org/all/d119a7b44b25a1e55a710adec7fce3e9a9fc898e.c=
amel@codeconstruct.com.au/

Let me know if I should arrange the changes (or the PR description) in
some other way.

Cheers,

Andrew

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.17-drivers-1

for you to fetch changes up to fdf003f30b99e232cd3e61cc42d836ed14d08ccb:

  soc: aspeed: lpc-snoop: Lift channel config to const structs (2025-07-08 =
11:35:07 +0930)

----------------------------------------------------------------
ASPEED SoC driver updates for 6.17

The ASPEED LPC snoop driver was recently the cause of some concern. In addi=
tion
to the initial fixes, the channel configuration paths are refactored to imp=
rove
robustness against errors.

----------------------------------------------------------------
Andrew Jeffery (10):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
      soc: aspeed: lpc-snoop: Ensure model_data is valid
      soc: aspeed: lpc-snoop: Constrain parameters in channel paths
      soc: aspeed: lpc-snoop: Rename 'channel' to 'index' in channel paths
      soc: aspeed: lpc-snoop: Rearrange channel paths
      soc: aspeed: lpc-snoop: Switch to devm_clk_get_enabled()
      soc: aspeed: lpc-snoop: Use dev_err_probe() where possible
      soc: aspeed: lpc-snoop: Consolidate channel initialisation
      soc: aspeed: lpc-snoop: Lift channel config to const structs

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 224 ++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++-------------------------------------------------=
--------
 1 file changed, 110 insertions(+), 114 deletions(-)


