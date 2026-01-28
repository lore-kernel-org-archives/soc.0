Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F73371073
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632521; cv=none; b=Ql9LtVMLnTbBdXGePni+h1JkJaLXvpqhDBC41cKpB8Q4r6PSt3/2SEk3sBIpEytw5ca675uoTzU6TeNRrWVDi4Oxlw8WIBrSeL2Tej8Xu9NbRUwCc2DeHmr7qs/8uuRW2Hu2mU9I/a9fEJ2ZcHM0rHu7gP7ZO9EyYBNKglSoW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632521; c=relaxed/simple;
	bh=AfXB2KiJ3QX8GV9oH0zxHMS1/rDt27lOmxST+ROXcH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dlW2n5qm110efYgZ3lKLd8N1gzChHKwWwIJ6hpLjQNxbL8vQ98orH2eMQTanZDnBCMeggOchF8Kr7HqdcYYxFdyOdPnF1SVp1tkgiToTqnNLGeNluejAToIKOLXxz5M9N9FB17bSMgsAJ1nT7EpP9hD1uBTK4R88UkmbnEwErSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnlHdaFx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnlHdaFx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43590777e22so170951f8f.3
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632517; x=1770237317; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=;
        b=jnlHdaFxbgvpKw92C7lrML8BhiQ7Tkab48oQFB8o645QqSPQsYYcpAlAWuJA9X0HKx
         le56QdaSayDAEmz8jXHpKk0UWxeZXsWskhVwhNLFWLpmEy8RKznrxHCfUpl1mVXgGRvB
         ufwaA82v5vmffL0HHM2Yeb8z6cHNbncwhGBjuQ4EY6lKup4/Gf32VPHAwe067nmo8S7E
         P6fY5tGLeuQAj/BBVBKuKY2UgksprFaZueNe+78ymPd5iLEkB+Q9ccSGJAKPdlUxlZJU
         gKEuMYUuGpQ7d84PsQBViCMpSl8FkfsHROEWOVRPuioymGDnmvNoYKvAmMjWwzw+Tf+p
         xPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632517; x=1770237317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=;
        b=KqUdWGDSOz2V/MA+uXvxipQs6hDuRhDQfTEFOX5oojZb27NQVt6V5dtycKhZRLPHGu
         Is0CDzy3AfzjIzR3pPntJMAwQFF5zS7iePO0BxVG17UEuJ7L/Yx+obHbXj0G4cKFCIcF
         gsMaw2kKfl7hJ3nB96gmTZxnIu9VJEP1J03Z25XvWNwtvNTYefjx95Ej3u/H2MEr813W
         8Jp30PSAapZ7GrD7rWmphhXCh+G7Mk0qgaGgxBVfoE/Nle2YKVuXvKqDL2uEfDfH1O6p
         5WWNpZto2Z2zKzdoR/PaNuQg9Wm7Q3wCogtQEl+jFAF8yRppdOq81yg97MBzW7VpraB+
         16cw==
X-Gm-Message-State: AOJu0Yw3wuDZ4XhgV4jMWDTb3YHokuZnhHlg+CnCYXWw96NkSiHVV8Vm
	A+3FNzndyRrB0jCyYbxJTkrM3v3T9365iQ284uaeZWBvDLBrS6XEiUIN
X-Gm-Gg: AZuq6aId3soGbXU0ODn4EguC3PSdjl4yq3BV4CZVrBlBr+q0hC1lRk5HmdHL8c+95SG
	ppxlEQANOSMSWwvao5j8036512Uz3H07nf0KaF2k2QpVn//KcDmW0bkQlV/xcQpGEfN55cQbJNH
	T+708LoeIFwl4sgR1aJHxvdclWu94weGW1rLsUCYjpTwsGPskiL2wYqveB4PA+XzhDf1Zkx5pdb
	aiz4fS5SlEYc6RJj8tGwBqdomPoLDkx0/0M0Abm0jnybMMq3YYZ3qUiYzgeDoNuv/d0DewdbaLZ
	GUuDudia0nsrgNO7YWpQirzfOBFBr/Wi3dFeD/ta/48HA5ivuJZsnnDeRYc5gk2kyg/2talwFfc
	YF4IZAXVolNkLCXCwfuhIEa6x/EANGrFXzT49sP6f3s7YbkR4dPFSCOeWPDlttA2PxfKxFdnzmo
	JvZnl8WY5dtGQ0BRtJM0W5Sg2z
X-Received: by 2002:a5d:5d13:0:b0:435:a7fa:24ae with SMTP id ffacd0b85a97d-435dd06f9d2mr8766859f8f.18.1769632516779;
        Wed, 28 Jan 2026 12:35:16 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:16 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 6/7] ARM: zte: Bring back ZX29 UART support.
Date: Wed, 28 Jan 2026 23:34:54 +0300
Message-ID: <20260128203455.38569-7-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 37 +++++++++++++++++++++++++++++++++
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

