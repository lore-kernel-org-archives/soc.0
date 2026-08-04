Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F22E1722
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 05:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785820161; cv=none; b=VN0DUyTj/l07aNQNKBtA0FJ5+m4bcsnDT0ad4f2FFLlbMIHAxmJVbp7L5FHttOEqYSkwsowe2DPJkJJcC8FggbyKYG4/YTFkLfOVovrJMKKUOdCzDM0pRthDC/q7fwS69XalTxVcm6Fn7sfih0OW8LdRAz2DE2O5wcmTuTkXmvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785820161; c=relaxed/simple;
	bh=xl7DxQef78qVvRb+PnZkMdfVH0qZyYzhALYNLhBIvEE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=gylxGpto7oJDhuiNqGptHOdP81w6J103F1lUBLLovsyOMyF8vrWEQavl45TlCDxFrahnnQdun1VUfn4NrS1Fj4qbyHh3NNZE0cEEjEnCGkDjC5a0IzoLElWkdaf03MxynoCFstiPdjM8Fzg9ZseF9oLQriAucbj6Qwa80joMLow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=BqMdCbTk; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="BqMdCbTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820156;
	bh=htfmEBxdWe4p5gPSeaGp5t+0L7Q2woMpJDia0Suxgoo=;
	h=Subject:From:To:Cc:Date;
	b=BqMdCbTkkdnKbfagIRggDfKtkEFATJAkuuLRP8aGfremiaQB/VJJJ6AVE5E/LXkXn
	 ViSIaIIIHmziTH4bhotsbtvs8475vMBqtjUhPrR6FSH5XAtt93JutXreqpXgMm2/cS
	 BHG2zvdSDrjdi6VXClLaFx5GmZp6rrPu2/cmQhDlftLRNyyOKZCaXLJEZY4Hp0+QAt
	 sJ1Xyhf0lBn1xVqVkIqT3yaipnwl8jOJavzSQak/y66etc7QAOnV0aFRpAsfKSlBKc
	 nskKCMhjj6YNO3Djb0A5nS21qifWdnUXF6nN8D8IoJoXFwxTokSUocgfiKhsrq5fIS
	 eENXhCNkDgd8A==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 436AC655A9;
	Tue,  4 Aug 2026 13:09:15 +0800 (AWST)
Message-ID: <47b845574cb6242d0ef08de910943775f150f67e.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 14:39:14 +0930
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
n-arm-7.3-devicetree-0

for you to fetch changes up to d7cb66fad58d8fe3cb8c43f5e48dd51a8c15358c:

  arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names (2026-06-29 09=
:59:10 +0930)

----------------------------------------------------------------
nuvoton: First batch of ARM devicetree changes for 7.3

This time around we have a couple of cleanups from Tomer that make way for
improvements in the bindings.

----------------------------------------------------------------
Tomer Maimon (2):
      arm: dts: nuvoton: npcm7xx: Drop bogus FIU memory reg-names
      arm: dts: nuvoton: npcm7xx: Drop redundant FIU clock-names

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
