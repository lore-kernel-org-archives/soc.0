Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103963346BC
	for <soc@lists.linux.dev>; Fri, 16 Jan 2026 01:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526948; cv=none; b=P53Ne6jn3ZFaIx/joPwdQvVwXZ/+xcfOwPUHSbT5StMBx/GEUF2vkLzuVfhNaWhgPgGptSeAPnTIZfwMh1EmCaLYx42hYr8aA/Nmeo4MM88Zw1absNsw/rm/XtYV0DX/nCWuSUvXI/TbJ3/wSRiJkkuk75yhNoUlL6NOjMycFd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526948; c=relaxed/simple;
	bh=bZjTWMK5GgsLOW9OmjHEdafwHW9SZoaHy0Eo4oAyAaw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=oqurrmJJgCaraBnpWVyDKQ/rEdxAa2nyE539dsNVfgZQpAW3vbG+JcmRwZyH/pIhoyFjwjGwlXElT8GeXQOP2DT2r4CKz0bDFkFwMt1yebDd+AGxNYh7i7J4xGzyIy2GoSC7D5j/EgzoZlEZ1lNAckY6bnkt6qeOPdV2/fNZm+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=PMjpUz/g; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="PMjpUz/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768526942;
	bh=HcG6roRHulppOKVp44IUXfVxD1WCgauSHg9jEnufi/4=;
	h=Subject:From:To:Cc:Date;
	b=PMjpUz/gqXSNvff0F0vcsit7pow+gc1BByvcDNwYXcc5bbBidqX1cOma3HcKa0I61
	 VA8vm44RGmiq+Icq3bRbZQ5GIJb/cFL8FeL9+95xpN2a71Mx9/awQ2u06XG2tswfOJ
	 SOjoPHrXFkz/l+ASls41f5dos/siIUC+WTPgpsKxfldo6Az+NR06VlNqu4DcCFapuE
	 y7Am5oigSLxuz1Zv0pF0PvGQ7PMDHgMOV5brUYmgZu8Z0hMftycJcKxd47KqJPHL8t
	 iS+JSlMHtiLE+TBHYsGmzP3Z/IoISEVRSR+ximJoOewGUC2K/5jPyhvAuCyhqya8JG
	 EC0EUdIAVns/g==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0757164705;
	Fri, 16 Jan 2026 09:29:01 +0800 (AWST)
Message-ID: <0dddb418ec4d81b30e48a079ecad8a388284cb9f.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: arm64 devicetree changes for 6.20
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jan 2026 11:59:01 +1030
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8=
:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-6.20-devicetree-0

for you to fetch changes up to c6a40c867467c23d531446c2b11d310b0a6641e7:

  arm64: dts: nuvoton: Add missing "device_type" property on memory node (2=
026-01-08 17:52:13 +1030)

----------------------------------------------------------------
Nuvoton arm64 devicetree changes for 6.20

Just the one patch from Rob adding the device_type property to the memory n=
ode
of the NPCM845 EVB DTS.

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: nuvoton: Add missing "device_type" property on memory nod=
e

 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 1 +
 1 file changed, 1 insertion(+)
