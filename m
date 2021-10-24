Return-Path: <SRS0=tGbD=PM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4232AC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B09C60273
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Oct 2021 15:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B09C60273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mn0A9vA0S2P4gENstPb+c/1KIrWKkcW66Tg2DNAa644=; b=bagRiuPKGXskrs
	JV9nwdKj5JFA2qctmgkOvBeQM6/Wr0t5ZGF8CLce5tbYJ1dtmgVJpyspKFpizMyrv9bzDPIm+qMIn
	XFoDz0SUtLP/SoE0zSk+o5SBHV3EKoxgvha9qR90Anw9hZ/viqrcA6IIk1kFXjwvtHzlkQtwV7iME
	RDB3fyOJA0OrrtHcYRom4+P5ydRIDF/LkCffACF+wuqWbwZZeBcWcsIEYKjMOpxFwErV4XcC9iCs9
	Ka8JA3MfPWMDlzgPquRVEei+p9kNNuLJGiuPVzZnXpct6txs44bEkBR4NZ4/FoywPro1z5WrzKldF
	cE3Ig8DQ4vyxiK1Bou/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mefgc-00EEVL-19; Sun, 24 Oct 2021 15:45:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mefcD-00ECXC-Iv
 for linux-arm-kernel@lists.infradead.org; Sun, 24 Oct 2021 15:40:54 +0000
Received: by mail-qt1-x834.google.com with SMTP id c28so8110704qtv.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 24 Oct 2021 08:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fG7/U26JTr2Go8waG37i/rnBfZKJjV/c/9+8XoMI6dY=;
 b=Nq+do2nPPMzN5qL2FehSoU59KbwnTZaV4tDSRuu7xgPg612txv/xyobFSEZEYrv5XB
 I/yKStecPVuyJSP94SsOnV8xmNV6avy3mBbdQ4Lqo9iha8loWGek8cIMXn1AeoroHU6q
 VgTVI51VvVk5m02iq2FpYQL+WBtvKm0c/QYNj2ML44pYbwGpIRU1o75Ia3uRwYYAyy3R
 IFI8A4SFAxR8Ai2iCVQ9r+dkz/Nijxt+4bqQ/t/KSS62Xppyu73H78r/5TmBbI2ahjsy
 zLV4qE+eWpb8Ssuu7iLUNiT33P145h/t4KZLOY6LIGVrQ1t2ukzoj9TDYpt7IEW3up/C
 7UTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fG7/U26JTr2Go8waG37i/rnBfZKJjV/c/9+8XoMI6dY=;
 b=bo18tlAC7uO5zNFXe3Wai61/F1M4eV1vPlYsRDMY5uOw1HJrjvv1/Z4kqehP3axzqy
 7gCEUDFUe24vx5w/TMVxYEUhP5VBA+Am15wzguKzNeHuOKYzWnXit9AnRIHLv2jAxML/
 QJ3xZxdTn5uqM7yK/qpVSr4xeMR311W0Wj01biP+EXpqgfD/3kNU5hYOkuYFxvVk6Do/
 isRguICn4zhiHaWTlHWwaLI7er7Wce0JqdOHdKyaekGvEcBtS5CjM6as2SqdiTyCp4gv
 zkG6cwzGN+GvzJe1dzgf/iLq+z750uFB6DfYOpav5A3i0fxm3dlOL5gKKHujEbpjTz5W
 Z6gA==
X-Gm-Message-State: AOAM531++XpoWP2HcpFqDlebh3YJsnLtebASPhufwsJIogC9FCsQp9/E
 FzRVlRTUy2rvVdyJLlrRV3c=
X-Google-Smtp-Source: ABdhPJwRmqhGlfNx6aKDhywa9RXPVYJjtt/UNCf6mMnXbQveLNJSk4xkLkdH6NUK1YIaVi843OT8ig==
X-Received: by 2002:a05:622a:1a8c:: with SMTP id
 s12mr12121146qtc.303.1635090052549; 
 Sun, 24 Oct 2021 08:40:52 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188])
 by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 08:40:52 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: linux-imx@nxp.com
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH 09/13] tty: serial: fsl_lpuart: add i.MXRT support
Date: Sun, 24 Oct 2021 11:40:23 -0400
Message-ID: <20211024154027.1479261-10-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_084053_671291_540E2980 
X-CRM114-Status: GOOD (  11.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211024154023.7peKkRw7MhCzxFSZ_miZh6YAW6xHR4xdxfMocHziwE4@z>

Add support for i.MXRT1050's uart.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 drivers/tty/serial/fsl_lpuart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index b1e7190ae483..1db083905d75 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -247,6 +247,7 @@ enum lpuart_type {
 	LS1028A_LPUART,
 	IMX7ULP_LPUART,
 	IMX8QXP_LPUART,
+	IMXRT_LPUART,
 };
 
 struct lpuart_port {
@@ -310,6 +311,11 @@ static struct lpuart_soc_data imx8qxp_data = {
 	.iotype = UPIO_MEM32,
 	.reg_off = IMX_REG_OFF,
 };
+static struct lpuart_soc_data imxrt_data = {
+	.devtype = IMXRT_LPUART,
+	.iotype = UPIO_MEM32,
+	.reg_off = IMX_REG_OFF,
+};
 
 static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,vf610-lpuart",	.data = &vf_data, },
@@ -317,6 +323,7 @@ static const struct of_device_id lpuart_dt_ids[] = {
 	{ .compatible = "fsl,ls1028a-lpuart",	.data = &ls1028a_data, },
 	{ .compatible = "fsl,imx7ulp-lpuart",	.data = &imx7ulp_data, },
 	{ .compatible = "fsl,imx8qxp-lpuart",	.data = &imx8qxp_data, },
+	{ .compatible = "fsl,imxrt-lpuart",	.data = &imxrt_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, lpuart_dt_ids);
@@ -2625,6 +2632,7 @@ OF_EARLYCON_DECLARE(lpuart, "fsl,vf610-lpuart", lpuart_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1021a-lpuart", lpuart32_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,ls1028a-lpuart", ls1028a_early_console_setup);
 OF_EARLYCON_DECLARE(lpuart32, "fsl,imx7ulp-lpuart", lpuart32_imx_early_console_setup);
+OF_EARLYCON_DECLARE(lpuart32, "fsl,imxrt-lpuart", lpuart32_imx_early_console_setup);
 EARLYCON_DECLARE(lpuart, lpuart_early_console_setup);
 EARLYCON_DECLARE(lpuart32, lpuart32_early_console_setup);
 
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
