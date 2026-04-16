Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C2E3EDAA1
	for <soc@lists.linux.dev>; Thu, 16 Apr 2026 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370807; cv=none; b=mmL3kx7dBuY+QS6GKMw5NUgw+tdvKCcZYDz6sUVRrVc6Z3PTRvKykhnWkMGX8rvqU6D6mqrczRD5KuUPob+eape42ixMwbZAXwmnLvLMCcUn8oo/6CJUY3XpuZqprfAwmktJQBBFHnXOCbHxbI+lMPBvo0fKC3X/I1lGdcCrJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370807; c=relaxed/simple;
	bh=zqX6tFIGEUCVaeZF4QkxvcJ5oMEM87X0rHqUfEPpl/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDT8EOWwey2VrscFG8Gb4nyKWn1rl+6DRrYT3JZoOJuTrtXEM21HJt8T7jWPlcJsWvKf9DSNRwrksfB/aAeSQ2XKriAoIMaTtGnc2hv31Hxi4Zj7qVaChQYaGlnbOxxINs150B95TLwY44WgsNdh/xbrY7fZS6gsUjeGrFqFjs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btcsEedl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btcsEedl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43eb012ac4fso1082431f8f.0
        for <soc@lists.linux.dev>; Thu, 16 Apr 2026 13:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370797; x=1776975597; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=;
        b=btcsEedl9UfkJT0dO23En+hH2pVXuF7Z2LFeReETzzwqSgzwBHdBBsdUlD6O85mj0k
         QSYoXTwoIvZMiwC9maMhqyZHVgAA/i+dsJztAAnfUOtQtZy4wewtxWcGr1zWq/Td1ReN
         ofBELNsmu4mg2LSO0eXrbM146BA0lYkJbvWlKstWdi1lcygqL31rmjb4xXyyGRlFMOXP
         0bETdlmmw4fn1JrQ/jvF539498UOuJ7E+T2iulPMk3jfvax89Z/OolVORGWHrVNbMPO7
         FKl/Zft/X8ZjuGCxrKL6TJT+DoFK6/pHqSx7osYcGZMTAOgAKtUf1QLBMkRUc73A6T2E
         A54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370797; x=1776975597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0T03nzSg8o1Xiwn3g5TYhAqMiuGuUlEI3maXBZPCdug=;
        b=QAKJp1Ukw62LJcX7DpnfGM54OKDdjNzrSpYXFl7is7t1QnOOVsrNIhijD/GTnhWM32
         KvVLSVAz1UKcbNKDHwPm686dca8mLVotVzcDUlfcgGnAQRPWHCyLxko6q8HnlBCtG/8f
         u9bD82GS1dzboN+D77kZSBJHNV/d2RK9hoLWw4KLBy03PEP/b/gOQUl7GfbYD9KtXQ+o
         MDBCM1lgeWSSZsealZM59c6hIxrdqqkxrPDYtV5sOqfjPulWLukFCMjRmx3rvohVi5+L
         pfNI9SpAaitcc7j0Lp+LojOgVXeL8XttS6+nRzE0esFYc/uOwTzSu66zW3ji2nHR/2D0
         QQkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5bQh9AiF66etUHcLljoKPZXl2OHOThj0VW2d+xlLXJTb6AqUe0ujG9B1g3CwIlJno5c0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcVkbMnLNFZlBx81FcbsthYtQlqObM34vSY6KSq9lhYBVDLQfK
	X4JzB0/a4qtSvPwMLZsBw/uVbCF/PQmgnXX9+SS4CoyilcuHxoJdBGFd
X-Gm-Gg: AeBDietzvTHUar6y13HhW5fYnNDOIfjNHm4NsEeHJ+vbG6Dh6R0ZtFZ3VKTJfIVh+3h
	LRDdkHg8hQENFV4Er/wwOgEtP/6Sqje1qQ0yElJBxZw3oKOeDHkLxzVZhrgr9lEdNpEMXqIn9fq
	Xztw5EWCTZHf5C7FjNWyDPxvEtejy84V9yaresBqxjUVsFS92KunyO1UI7oR3HjwqieFXNg84jM
	L3SQFL04gNJu+YTIdHmcY44yvvY35mnpNZ/CM89aJYFJEBaHG+pFdVGhmGnBc5QtpUcI6RVdf1N
	dMU7bHqSsE16F+c4u/Mft8DRd3L9y4A23N+FsCGHoH67i+Lw5NJkLJGH7EvQYRQ+5yUDmyf2r0u
	co2sOwRYi4/lT26nxH3oZoDZTGBRrzq9l9g1Gn4YqVKpuc6D9iAV0IuJmmtYE2mSwIky/loRYgZ
	J/Pgbz6YIFsH89ikcK2SHjOpR0i+bxYeTfFQKcZFOVJhEohg==
X-Received: by 2002:a05:6000:18a5:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-43fe169d563mr1185520f8f.38.1776370796893;
        Thu, 16 Apr 2026 13:19:56 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:19:56 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:14 +0300
Subject: [PATCH v4 6/8] ARM: zte: Bring back zx29 UART support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-6-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2641;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=zqX6tFIGEUCVaeZF4QkxvcJ5oMEM87X0rHqUfEPpl/g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLOAzH1tDsqAQM6YsZ7GEyIYJznmL2L8uIk
 nhr3jf9n4yJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKx/w/8DjeLetUi3csxyMsp3tA2IS2LYDPYepk
 nusCL8dln6bs70+ADwKi4Y4a31RnjheChLnfNcfosGcDQiO00EXr5uP5c/PRGfl/oOLslI3uOkZ
 5VY/xxMT5nuqII8In4qpDumJhiEStbYx3EUYZ7+Zwh+4UUtnxVKpqcPnhoHKucrfETgSCykXo2Q
 fUsaAnCy4JQ+S1pkPa2kE52QzqYRhV9wEFf2vsQcpfdlObUuxtjl/xhYeKy8SRNhx57Odec5vuj
 9sqRIke/0799ZtihtMrHMDSvmpZiR6Ea4u9Hl1/5LOt903k8E1iUF9a2NYnSPmnMmYJLPdQ4UPj
 n6vlHIJpXlkxFYN23/W3YU5+gEGY+hvL1dALjmwmvQclDe5HCyDmkU/ZrSi3rtVbvAr+wQ8Dxgf
 Jkh6iEbGRGRZG549PgjH+uCDgF7+hWCNTE9uJt49lFe0lXkrmgmrZMNmlq06L8vcluLTaAbnK6D
 +5xHw2T2tcuviAmrV6ovuLi4/UaECUyZbSKiMTH/0sqTUFMHATLO9iLwWt3zR5u6Pf75BYOGnjb
 dV1GlpeL86CeIaFTQ93V1GoEQIlS8tM0E9PHNxgC/O3ZarpJIRT5Mf1XyFWVRlWb5DSC51YcHw7
 Xu+XbvZWPNUuqTHq1jDa3p2c2w+UZqjTtBqmK2pyHU42ZwVkbn0c=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h        |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..858a0edd3e3b 100644
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
@@ -3081,6 +3113,11 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		.id	= AMBA_LINUX_ID(0x00, 0x1, 0xffe),
+		.mask	= 0x00ffffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 9946276aff73..854c962d70f5 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -103,8 +103,14 @@ enum amba_vendor {
 	AMBA_VENDOR_ST = 0x80,
 	AMBA_VENDOR_QCOM = 0x51,
 	AMBA_VENDOR_LSI = 0xb6,
+	AMBA_VENDOR_LINUX = 0xfe,	/* This value is not official */
 };
 
+/* This is used to generate pseudo-ID for AMBA device */
+#define AMBA_LINUX_ID(conf, rev, part) \
+	(((conf) & 0xff) << 24 | ((rev) & 0xf) << 20 | \
+	AMBA_VENDOR_LINUX << 12 | ((part) & 0xfff))
+
 extern const struct bus_type amba_bustype;
 
 #define to_amba_device(d)	container_of_const(d, struct amba_device, dev)

-- 
2.52.0

