Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577835F607
	for <soc@lists.linux.dev>; Sun, 26 Apr 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777204508; cv=none; b=Uf+AdARHOoDp68rKbshvwgKWZonvcnfIPPNfxKB5X54+J+ZSBjfaHheq0H4eZhUN4yVAQUmy8J5wiApTxVhzO0sJNTCY3ymj+49+vjkW5mORPiXurHxLgLlJ4U3/V0+VWmwg9eDnPkr8x5h417Zy9zcQ0li0rLRU/DAkDkBEW5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777204508; c=relaxed/simple;
	bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5ugU+Yn+FtEFjlFuo7v3/usqjD9BLrNnK4KGz2KL5+nT7lBTmKzpywY1pr2M+tHnnWIUpgJso4ub/OgZMdhtOH1coXZdqNMhSoE0JdWYVkGwhm00Hm8VPwMsBhifM9gB9UKaZdBGPeeS71aGz5GOjq+SyvWeAU4iDpfLycJRko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOCaGVps; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOCaGVps"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so85578845e9.0
        for <soc@lists.linux.dev>; Sun, 26 Apr 2026 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204505; x=1777809305; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=mOCaGVps9dvlPmkZ3UOptSTqkuj1BiRyygOOYqtt2fDMyt8WeVkEMvJxorpTdJWxts
         pmCYn5MEVPgZiHbRjp2oyPOvnBToMrZzkHTVickJEJVXpAF518h/EADSiwpKnUAG2dxT
         BK1dZA+kGWeYdF34cjH2Lmok2J8RHKrWynHTP8/MYzxJMsTfF/pTulEqn2AM6Wzit10K
         YQrJWOxVIZ1bbLkf02IgFDrXWTAPDQLwr+nMxJASVKhpmoXNzN66GK+VYlwRegjx9I8W
         nAE5jV3NV6+aoA+YCYIHLiH9FtUuKKd17hxeJGnBbE2QQ6wCiyj0YkXdOU/eOe5OhZqR
         NjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204505; x=1777809305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=XyOhS5B6+oe/jS5AsHmUcCZO4HnWPRzs4z+2b9tHx6XyvktcXuxlIYfNH7q/xEUKlZ
         LHaFM4717wsq5meV9jUJIly+T4MENfvfsFCHAXiZOpAulxtS5PBin/kbvMXUbNrnXbPK
         TYL6wc6x6gb7kiSmw9uyV8Q1lCgqqDx0Tr6mfL10sybP8vOle8swaDII/PeQECA72GDZ
         JefLxuL24KAsDhyiseGqlzsH0Mi0jocYvdmpgz5K1h63K5PkQSvJk5heGaT+20N1L4QS
         0vmbn793TUyDnHHrqsKRiuNyffe9rcGSH265Z5BlhCPJ0Qh9Z5zM60mBJ10ms+JHwB3E
         xr5w==
X-Forwarded-Encrypted: i=1; AFNElJ/zSsbjgj2kHjQ2exdmdw4oppVCjamVf+/mapsSYXZPkDnDq1yZRZdUHHpdLhrjmW1I6gs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjjSypi3diyOurZIJXxHliUCLcPwfQPb+Ng1NfLC9zkv6pAdU6
	rPUZfO4zD0CO8QOT7iIz6rZI17Qcek4Fawuszn01TeEzr3r+7mjt631WiHVUt50k+fU=
X-Gm-Gg: AeBDiev5xRygObRrsMBFFClHksdnwXxye6+KnkmgPp+MAW71H44EYma2WYrIVjv07kR
	0rVCGG0R0MtyV+sn9DQcD2KKcGFuurs2xp+tvus0bXlyml/WtNnaGPvkOV9dA0INvrkr84rKun7
	rJVrJ4BCdPDpf10FOiDanuHBCjOPVFWdtsqeLIbSgeo88Jon3GtDUqr5gpSg4lxgTgz89S3I3z9
	YUarvNLLWxobFkxCBx2AhTeRMa7v/M84VdQbANcVKm5MoQft4fAabN3RzDQZZZH13woheyOrxgs
	/8Eh4L65rBRtoGKqsrmFL7mL5DYHlsrWonkwyYn6YFZ2wekzqeDmjiXzfmSpAZFVuwul70bxlzQ
	y9M3CkyHL2Fal/bQa80aAApchuYBfAmFg4i3EntvK0Jbeduxvy4w25vWfXq7seHPKVF9nuTME1J
	h6FjsbkO0M07m1idEx1HCU63CssjoHg9XyEv1557wU/2pi0ml57Bk=
X-Received: by 2002:a05:600c:3006:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488fb739f86mr308742125e9.2.1777204505424;
        Sun, 26 Apr 2026 04:55:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:55:04 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:17 +0300
Subject: [PATCH v6 4/6] amba/serial: amba-pl011: Bring back zx29 UART
 support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-4-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
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
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+u/+qpPe53sgA9IGeQxT3jxCmJ4DtmSGvC
 U4HoXZLR8CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLafQ//TFrg6fVGLeFet0jt8eE0RSlbETUAuhe
 Y1d5O5EVEObWTh1jBB8JPUT3ZMr9helrlQYwToexGoTQfpSWSh2y7cnmeHUOVgNmMTRNJAuUso/
 jrrVPSqGIcUqtxoBdnsvzSa90oTzQCm+JRHjGgcYAwdrCEnArO99rOMFt/YyqLEqpntXHuUBOsw
 EeCZQY1SXWS+c4h8fhIiiW6XE6XxCUD6hNk6MYFY3KFG9h5qTNy7pSt9aYtUFSnrmi8m3ZI5fAH
 jDuPQIyemgkEdEydS4g9gPCvjhQUcfRBC9hi/2ElHHk5D+QzEM2Jiqe3XgxYz4LmIZrTgDwB+89
 LLZeTrUrEwPHURqLvlqh1ryypR05fts94XcfLO6co10aJDrcPRtNciW+QtWkmQDAACHymkqkTFQ
 I22mqAZvxR9UwaIHeMv3ryypBbv/LFD/tUGxrP791tf/3gigCKCS1wh2niV0tTGg5Z5ZJ+tZFkg
 OMy+aMsWJJhXSQPKTGTvi2sREMqhUdyxim/FnY/x5Eobdm8l7n54KB7aywTfJW7iZjzEYnPjeGl
 XNH7zOkcpMKILqKmG/lpaiJunscs002+uMD0iNosFvzrKvY0nsvrzm1d3PPV6hj4t1LVlqLrfUK
 uzQ3rgUYa4CP/LgeP+54Wk0INmumy1gDlodGjGyuw2lAbqwrnNZM=
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

