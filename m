Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01B27F170
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 02:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752114262; cv=none; b=mbXDh2gPMv9ymMZ8ip9KwCbgeW81e3mfzHBpPh5KbE+pcjliDh/R+a9wc1NtoyXsr426UrfAtTPrrVqBuIZ2p068cLdiTECMZl9+Iq81VSlkzX+wtiDYRXD088bp2JP+/f3lvMQn70Cq/pqGum0AHr69K+bHYYqy3e76OOQ5GfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752114262; c=relaxed/simple;
	bh=/5k29OQG3+cl0g0MxRk70gG+2eKmdFtzpYOa/bQR91o=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=VzqO3K4jPnFj7TBDM+JWvP21MTWvo/er76TpyMetVm7EmYYx8Y0hfkyX80TX+BfBw7tcrf9+k1dRTGZ4DqI+7gdt657qRng098Cf+dTt3fZK2DDpDxRkDdWAakG9mQAbuy23Mv4GqHAx2+aOzjuqENlh986MRpKqRG6pV8pMnoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=O3MbPEDV; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="O3MbPEDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1752114257;
	bh=lFaBzW/UFNKRDOoKgOilQk2+bD1ofG50x/0d54hiwwo=;
	h=Subject:From:To:Cc:Date;
	b=O3MbPEDV8Vl5EyZd0IlS9GM7zFbwanUKbgi8uw38SA+/7kAG7A5I3K6ne6QLYVQ5W
	 QYE7yjtnUqcs6SXZNOQoj/kRpTxPpnbabtnuBeHjf6ZqZO/Xow2zMoyTTtz8/x2YZz
	 mM3u9e1zWiE7P7qvwU1e+DhY4ykrkeIJVcCIA+Tcvw4N6nsHPwoGnT2d6yo92Oeztn
	 dUMJODDPBsu0MHHxcO39SIobpy3QdatzTOhVNLX4+hJ2N52Vr4KpGrQp/64oXoNuGm
	 8YsAJQzi05wkBJqBKvptPYI5gftXk3EvuiRymsscENZpuzd6NoJk0g4po/FpHeRPRC
	 Av0g/SX3FK7OA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D972E6508A;
	Thu, 10 Jul 2025 10:24:14 +0800 (AWST)
Message-ID: <d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: drivers: changes for 6.16-rc6
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-aspeed
 <linux-aspeed@lists.ozlabs.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,  Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Jul 2025 11:54:13 +0930
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

Here are two fixes to the ASPEED LPC snoop driver for the 6.16 release
cycle.

Cheers,

Andrew

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.16-fixes-0

for you to fetch changes up to 56448e78a6bb4e1a8528a0e2efe94eff0400c247:

  soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled (2025-=
07-02 11:05:20 +0930)

----------------------------------------------------------------
ASPEED SoC driver fixes for 6.16

Address concerns in the ASPEED LPC snoop driver identified in the first two
patches of the cleanup series at [1].

[1]: https://lore.kernel.org/all/20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd5=
9c934d3@codeconstruct.com.au/

----------------------------------------------------------------
Andrew Jeffery (2):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

