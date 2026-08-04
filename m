Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056462E1722
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785820989; cv=none; b=p0LDQSo7yOqAHbPitJbXj6YdhRMF4BJDn1lEwg7iYHZW8LHt41f0ynQrNC9wtkhHVuTH6pO7RiOxylBv3ggXVv23cjlHoxvc9bUCq9limB64fNqvrb8iOOztMiONmLOa/qqz1JPEs7eg92aZJUXwfbMFFGrPlTJrVgv1V18DDZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785820989; c=relaxed/simple;
	bh=JNU0nI72JJjLwCPas9d/hnoAu7KNn2IVq2GlRvd3jAc=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=AGWWoAazxVS7lalrcOseFTz08VjhKqi+fIkboFCLNrCcjkqIZ+7OuK8/NDoFmiWfUMeXUkY5CSJhQfWBewP1q73dUyTQdb9k53d1mzg9ww0zcIDkpGJDvX8SnlixMXN9irlMRy7AY2osweh183D8zBBQ+b416pjk79XVHyCIJ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=IGFmogKV; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="IGFmogKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785820985;
	bh=1A/KBD+ttLHFVfVvYGOtSgdKkMaEe4HsHsCsRXDAhhc=;
	h=Subject:From:To:Cc:Date;
	b=IGFmogKVFy0r3QOEkmBcdVljcYoReqRdbjf1dC07PNyXN5eBb+mX3YMtsQyjUOYov
	 8nlouW+/2rENq7/VDrZ1K5cyzU+YRHc4a7ujb+kBUu92f/PkdO5a2sesHUonrIj3JV
	 aIgUWZLKBPXdd1o5oj8jClv9/lozGGpkdKZ0M6gdo6lYr1rvcjKYB0DCFvkCbXhB5t
	 hE7+TdxHE2lur3aIX8zizF67s91/C2diAmUPk2JZc+MGzrnJJFV0eIWUkXeyXCJy9s
	 VFsK20M1+BNUjL3bsMflX0CxvFqNGcSKIvU36nUS7YvuNrlTZp60lSxuSemlbMkqdo
	 AnyabYUQdthvg==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6C895655A9;
	Tue,  4 Aug 2026 13:23:05 +0800 (AWST)
Message-ID: <6343db5cb38990a58320ba85899f1b5253cad112.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 14:53:05 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git nuvoton-arm=
64-7.3-devicetree-0

for you to fetch changes up to 60b9d5b8ca8b09019d8b162bf41fdf24f847fa02:

  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes (2026-07-22 2=
0:27:35 +0930)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for 7.3

Similar to the 7.3 ARM PR for Nuvoton we have a couple of arm64 tidy-ups
from Tomer.

----------------------------------------------------------------
Tomer Maimon (2):
      arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
      arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 33 +++++++++++-------=
----
 1 file changed, 16 insertions(+), 17 deletions(-)
