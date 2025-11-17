Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F8F32C92D
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382878; cv=none; b=Y6qbJj/DsilutsgNiOnZ6kukFM+deEySvqKXkx2cG5xkr/fnaKpaUwVebapULBwz47rO1rOFIXZunpPAi3FnSUTDIP0aGwySRcIAoqjTSPfrDurVZIbLC5APEAxNho+lscLdjTYom+lhn9wjbB3oYKE+vFiyIuijhiJqxWWW070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382878; c=relaxed/simple;
	bh=+/eK6eXPTPHszVphkFnTz30d4kiRNFvZ57HhlwDFU/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skJIwOag9T1P0mdRiOjUQtFXluAlCrgCEK5tCnV3UF3ggiUHqqRpBYpkrStkIlmWdG70EJuruG3/oB8FTSCQ8WjYLSGQvnekcILgRjkLMYmolNc7R2DinTTyAKAC92y4jESuXLgDm1ZVYPJ5FrOdokMw6QKCLWiN/c4tXkZywgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=DVpUvla4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="DVpUvla4"
Received: by smtp.kernel.org (Postfix)
	id 5F94DC2BCB7; Mon, 17 Nov 2025 12:34:38 +0000 (UTC)
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE70EC116B1;
	Mon, 17 Nov 2025 12:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE70EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=v7rKaLNkAwCYMMRnugIPYZ8Z/w6cHytL9V9Zh/N934I=;
	b=DVpUvla4Dkjdw5LYEl7GMWNKYUvbq4wkWc9x60PSFmrXJYbsIf8M2TnTSWFkGO
	g0KxvvGUt4/2mUjekfxJ1oNJNKahmiByuDA5fQv1jpL+rQjF9swJf2veKymOegEE
	uW5JVOKbpMp3X2A4QDNMkgELI2uSKSNQCMudjtGUDtEYk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S6;
	Mon, 17 Nov 2025 20:34:27 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX defconfig changes for 6.19
Date: Mon, 17 Nov 2025 20:33:51 +0800
Message-ID: <20251117123358.2009662-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgAnXIhOFhtpoZUoAg--.8347S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryxGFyDGw4kAr43GF4Durg_yoWkKwc_GF
	y7W3W8Gr4UArWUG3WYqwn3urWUKa1UJwn5Jr10qr43ZF17tr1Utw1UXFW8Wr1UX3WUAryD
	ZrWUAr1qyr1UKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0dwI3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhO6IGkbFlN1yQAA3g

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-6.19

for you to fetch changes up to 910ab02fbbfe1621a13b366b3761b6dd9d499c32:

  arm64: defconfig: enable i.MX AIPSTZ driver (2025-11-16 20:56:27 +0800)

----------------------------------------------------------------
i.MX defconfig changes for 6.19:

- Enable sound drivers for imx28-amarula-rmm in mxs_defconfig
- Enable i.MX AIPSTZ driver, i.MX95 pinctrl driver, Ethernet and PCIe
  support in arm64 defconfig

----------------------------------------------------------------
Dario Binacchi (1):
      ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm

João Paulo Gonçalves (1):
      arm64: defconfig: Enable i.MX95 drivers for pinctrl, Ethernet and PCIe

Laurentiu Mihalcea (1):
      arm64: defconfig: enable i.MX AIPSTZ driver

 arch/arm/configs/mxs_defconfig | 2 ++
 arch/arm64/configs/defconfig   | 5 +++++
 2 files changed, 7 insertions(+)

