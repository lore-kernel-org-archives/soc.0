Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0B381B17
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451131; cv=none; b=hRVL5LQ+x0RUrGzCn1Nk3t+njaG/uFwlCMaoU0rVqKShdePeR718YXurr4MOMIxun5PIKm1hTW5apyvXaAZB4ZHL9n4rTG2KQsGeifOQyIYK8wsGEZdbTUToUA5OBMfjfmL7ldCiSm9nl99QXV1mrBnOYSvaqFS+m0bWdXfVAfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451131; c=relaxed/simple;
	bh=kMzsOxgPbAMZl7euMqrW7SRtuP+QzNU2pcEr/aekx28=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=RjB23eCF4d0sbfzmnv4E/5abl585pIY4PFQkXFmEMdJgsqbPHwk/m7ZLuHZzOgAK3iOKJtfnEBpLdpAajXKuPbSBSoEyiFCXCvCtdPyUIXtHNXLiw3Our9nCz0JS1jQddwJs/Rvnj0hSy0KikLa6qxb0InUPVWBEGnV70mBecIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Pzsp8wid; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Pzsp8wid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780451126;
	bh=6sNKaf6Emxid3ZVnRf3FrHFQvVHAGDbo00Rv0+jMbEM=;
	h=Subject:From:To:Cc:Date;
	b=Pzsp8widNNQW7lqYjOla9SV0FDAI+RLJyW+mVvMJR4Uqg8RR3xCb5tR/ehxAWXxhW
	 6CPj7Sz8sHE83Jc8qynufLBIG4JAk44kcJtAg68SDJnPV/B2IwL7s5ZcCv2y5r1ocU
	 LdjthGl3VI7blsWS8gJiC48QHG6NQAb7GXJ0dSANxhXjAxzvIAOaaddUU8ti2tTYSH
	 q0IUd3HvVe5fjzz4deqhllDjKgLVnJMtFVShHDe2QG+z5FKjy13tSh399hxRONzUqO
	 AL1ev+iZvi3fIZtXaKR/02pKI+ImwZiqd92b5zcRF3SpF4u6qtXryJFN6MqsDd5MiM
	 lEJkg7RMGrRcw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1B9F66025D;
	Wed,  3 Jun 2026 09:45:25 +0800 (AWST)
Message-ID: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 11:15:25 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-drivers-0

for you to fetch changes up to bc13f14f5cd3d15054de38dc1232b49343d36297:

  soc: aspeed: cleanup dead default for ASPEED_SOCINFO (2026-06-03 10:47:55=
 +0930)

----------------------------------------------------------------
aspeed: First batch of driver changes for v7.2

While bc13f14f5cd3 ("soc: aspeed: cleanup dead default for
ASPEED_SOCINFO") was committed just now it has been in -next for a while as
b333a0f1c857411d83a02aa6f1d9ecc7666d6179. The commit is fresh as I moved it
between branches.

Other than that it's just the one other patch from Krzysztof tidying up the
location of MODULE_DEVICE_TABLE().

----------------------------------------------------------------
Julian Braha (1):
      soc: aspeed: cleanup dead default for ASPEED_SOCINFO

Krzysztof Kozlowski (1):
      soc: aspeed: Move MODULE_DEVICE_TABLE next to the table itself

 drivers/soc/aspeed/Kconfig            | 1 -
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c  | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

