Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD941E6D8
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 06:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825897; cv=none; b=kiLdALsIxHPDpiiLxOgW+RkfJgg6g3/R8yiN/pMxmj1W+0bXHl8we1FwIOK1M/2HcC+PwxyuCBhZ2kEP02kYTtj6Uq1rPgBYjbijUr4kAYBVu4mfX/eaX0vg812QuIlQRwYVAiE1bbrXUm+0NLZd4YgS7OEwGid0Bdu8BildjZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825897; c=relaxed/simple;
	bh=qKtrcQCCxVaaljupOa/N9z4w1M3DZw01RbPFBRJudLE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=ITTsyXLrUe7MYD2wdGj58cwp6gZfzx4VOMRwgC5tNgo5P2sqArW81uyIz3umkq0RrvSDU9FZxb1Vl588ugavRWrhxXxU6Ih4Oa6sJR0Df2Qzrx86Aow1hzF0cSEwOWP9bPkmsuCxx5l+mBdedrj5TisZBP8Y00RO1wT8sSUuuCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=eG9KGIxi; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="eG9KGIxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785825893;
	bh=Bf2vZiMryyidrIVtaECU1kR4CLMERTZBJinxRYUKU/E=;
	h=Subject:From:To:Cc:Date;
	b=eG9KGIxiXBF6NDuZtZX8mRQEkbxls6aRsqKf7LXLXpHL3micaiofpXy/GdhJ9MPEH
	 JQHFBtyhPIlseduOGmpqiLGYaIUWFARzav4Ul8Fowu3deWTZSb2oEhCGiy+5q3unKW
	 UbxjiGFIeDvXjW8bQlePVJJYBKIuFhM3jYyWTu4SmLJMp78cJmaYLg3N4Prg5GR/HG
	 YF1lNDz+TruXJoetiFT86zzsB4jnnMTpGDTo7IQGNTCp8UVORiiLF/uMJtIQLFQR4N
	 x4ZW5lmu3QkrYBLkE3yKxpCy5td/tN02/lmklbWkhshqGnmzl4bYfrEtX2khjnLNDN
	 VZHcNk5p3fetQ==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E781D655A9;
	Tue,  4 Aug 2026 14:44:51 +0800 (AWST)
Message-ID: <3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver fixes for 7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:14:50 +0930
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

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-driver-fixes-0

for you to fetch changes up to 1acef6d85bfd98bd9dfe1f08bffa397a4dda8a6f:

  soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read (2026-07=
-22 22:10:54 +0930)

----------------------------------------------------------------
aspeed: First batch of driver fixes for 7.2

This time it's a single fix for a kfifo overrun, caused by the the lpc-snoo=
p
driver implementation behaving as multiple consumers.

----------------------------------------------------------------
Karthikeyan KS (1):
      soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read

 drivers/soc/aspeed/Makefile           |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 38 ++++++++++++++++++++++++-------=
----
 2 files changed, 27 insertions(+), 12 deletions(-)
