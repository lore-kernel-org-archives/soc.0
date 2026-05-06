Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0F1332EC8
	for <soc@lists.linux.dev>; Wed,  6 May 2026 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096062; cv=none; b=fw0QE2x58YIUK7iAJCL3GYP+vBrjp4ZPyvamVgF0UXCk/8CJMyRCqZXGuqePEu9yMkJIbRNc/nt4Oa3In5OEe63/H7n60vsdQALOjwJq01A7MNkknZ5UCDU1oBDc88rnyYh3SqQtxzWGv2iQzY8LDgTEvXD+pxyoLbBEMAR7D+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096062; c=relaxed/simple;
	bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJfAsD0kAjuhH+RpERCWVZ+GF7iDKw9rDGDCEP/5nC7OJ2yrb7Vd01JE0+mJujpjWnWGZ/GF6ZwClr2nWxZVHd0HRYqJdbaWBi+DoiwIglGUKXpcwiO3/1mjfEUSIkA83OM2rRIy2UXm8Ygt7WqrsbQ89a7KV/qs2v2bDaM+IJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBHKU5f7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBHKU5f7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so43937f8f.2
        for <soc@lists.linux.dev>; Wed, 06 May 2026 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096051; x=1778700851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=BBHKU5f7/qLMajLdZO7Ekbgtj1mn0qxR2fCanauo7jSJ4scvIUp2/5OQHc+32eldtR
         HH9WNKbQ3JL+I/w7vCCZRzzf5KVwzc6S00tL+o1Srbhfd++inzuTmiMLPIJ5GxGljJKY
         nfGrHbMz64QUPycz8+ijjVizyVvXd0z3euOgjO0SECsNA+5xbEOrvBg0CFwCX59nG4rz
         otrSKwl4giq0L26bbIZ87ViC01y7MGYFeh6jlM0N7cDXLE9hCY0n5v4/KBMtWL4zlVbc
         6PlYqVPYhm5Gv61gnPmRQ6PYF4F1a0x4IBHnJz9Y/UFZSJ1Mt/Rd+yUyVvbXTnYtUg3S
         fN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096051; x=1778700851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=DPkUVyUroCHms0S5OASe88vF64F2XHsaULNmWaEkitJ0j/JPaFx4OpSpLqmVQMY7Xs
         WLiJq1PURf1Dxb2GmWLgIak8CuJxH6Q4fpoe9/SnAsA1hG6eXh0vN+c1+im1ywSnHMQ0
         oHkKdhFER7EuYQKG+d7Z4Tu1gYDxgnnj6HNviSadufQR5LxV6ib1w2Sm1m09SA+DnPMK
         Jaoyp2wm2VtFEHVv/forHaM1zyG0M+g3UbQggAfF+2cLjy4dU4DOL2eQEgQ5Giw2mZyu
         /AceEN3uOx+Nv2M5Mm5bX1BENfT8cuNmdeUHCD23sG6wSdEHMXcr3/l1CUKpLFniyAIc
         0Zyw==
X-Forwarded-Encrypted: i=1; AFNElJ/RGsJ4ulkIvEULutQDA0Wb+9qgLCUWTGxjyT6+sqHBZkvXCBwdrO4rX6IiCNDNSjDbGEk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4M+rJDLZ9y4tISGmOYN4hBTLt01OHUOnFx6CER9f77Y5Achd3
	GP0YRrgjh2rh75Heggx0gGfZwmfihnhUuzBKWqNiFVjvy52tj99XbQa2
X-Gm-Gg: AeBDiesp2PnHPdxwwdIhngHco1loDqAB9HBctoexepXjW9X9tj7LyHPL/ke0FXn5jgD
	psOB5Yl6y0sC+boniEs7erzw5M8CZy2Ku9X8qA2CokY+DubbflxAp10csw9URVszbZ0hwRCiXH5
	yDC8f4JErPEzEJwdtvP02iv7dIzHagQ/CCoSqByJi13Z5Ex1TETCI7Nd3lIXkVwhsh+GrnwFf4d
	4QV3TiMkZ83xnpY/GGdGmFdQsWSQVhEabJLCQuqFTJpbxwGIwC1TiXHjOzVRg8JXxHSc28uDpb2
	NNFi6pC5kqm1Zr47BezYfM3qZiq99LRu2Z3SydfLEmVTOPO41K9An/DaXbewGSVpAIQH1IYksKG
	xlUGYuDcb/HZAvi0KAdrw5BYsnjxbLciNVlt2DzBUMLerDgxmcsF6LdrvYPNQ5dAUn9Gp4VNvhB
	7wtsKjO2Rouvj/brc8QyYVC3rNXU4kgoRHVQ0+WdNtt5I=
X-Received: by 2002:a5d:670f:0:b0:452:75ca:3fab with SMTP id ffacd0b85a97d-45275ca3fe3mr1840819f8f.38.1778096050623;
        Wed, 06 May 2026 12:34:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960022sm14895673f8f.26.2026.05.06.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:34:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 06 May 2026 22:33:21 +0300
Subject: [PATCH v8 4/6] amba/serial: amba-pl011: Bring back zx29 UART
 support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-send-v8-4-f1bdf3243b34@gmail.com>
References: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
In-Reply-To: <20260506-send-v8-0-f1bdf3243b34@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp+5eWEF9Smqy9/+ZqLj+fvYU3rR6MQcKz77DkM
 QtvC+gIXhWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafuXlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIx/A/+Jj3LBH9tnjU1WCvDlmvuDKP60pwv77H
 9cpKC5X8jU9Rk6vURr6BpE8J21cX+UHaMCaKC/Cf+xiQjWpQDugt4fK44PCsOUg6F7a7+jGOWY8
 LL8LpnoGzjHW1NVmdbkeIqLE5Z7NBnnIsVb/f1Rm+I/Tw0MN30e9KM5Xfdi4iXUdyMh3pLKzLY3
 +USPgYvQz6P341ijtBwuMeYsMccIDefew83LipWaF+qR59w2l/s5dZcZHpWddYo80R+tS5HSACY
 MDD5qa//5HcW+9N3ya2Syb+bqG6LBe7ydReM1FxRWUPxBmcSSOQSUaBncNAGvKdQmGqfk9EQCrV
 sveBZA+Gm42mHgoXEghXSHEtf7qtxmr6rIiim6j/+MvLnoruinWXl1ift6t+tNM+wzcbRVXN9QY
 xxflUe2qn0gUmUOAYSRP5Dp3hnWvMs1BGlVRZ+rRaqDrxGI3MX2KBKDiIjhZR9Mi+j+IdTXdJYe
 dWE2CP3QhYQ23VqOhadxflZUQTwJi7pdOndO6VpPcW4uMJ0uxIp8RprT04JnghBw8juuFGjogmf
 qFdCVa2SkLAjHfVIzqLJwt4vQpVMbX3bKKVTOEv4m+UEZUB105F8UckcQ94A4XmVy4NU42WvjmF
 cGzwd9WYmlmtk1x1/KjQgxjaMnfuCad5XpV0o/9care4lwus9wwc=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes since v4:
Use ZTE's JEDEC ID instead of 0xfe for the DT-Provided AMBA ID.
---
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..f24cc403d9e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3081,6 +3113,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		/* This is an invented ID. The actual hardware that contains
+		 * these ZTE UARTs (zx29 boards) has no AMBA PIDs stored. ZTE
+		 * JEDEC ID (ignoring banks) and the "011" part number as used
+		 * by ARM.
+		 */
+		.id	= 0x0008c011,
+		.mask	= 0x000fffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 

-- 
2.53.0

