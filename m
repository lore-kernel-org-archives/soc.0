Return-Path: <SRS0=A4Es=PU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660D3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 20:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3457E60F42
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 20:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3457E60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6k5EyrMBHfG1Wb3E+d3xE6xxxqHL50q5vMtHgwTazw=; b=1vwDGQBWJ0YK96
	hKOakRjbiCMH5Ep8ooP6xOGhOcmTm+abpamtEmNpVAWJl7Q/1B+HM5qjEsdrpVMRs/gl0CvwkLiHn
	fYIRtS2SFsJnmVfUUllawrQ0Kfab1UZ6e2VJ4tl/UcyGYXoTn0DsnwsSSDbbWFk7a7xJ145TSXtdo
	R297uBpKjZtAkT5HB3siBp0wDFpm37cWWPgNOuD1Wo5927PJxu6PA02xmaiR97xt7Z31nThivRXdF
	jlRjmcCTAXs1xRrmhSKVCP3rCpu+xTKwvFiHirm2FjkLQl75SW8XxD1GqMooDtGBExJuR/+ResYYO
	43G4kwotScrmHEz1z3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhdeV-00HEYC-SY; Mon, 01 Nov 2021 20:11:32 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhdeS-00HEWq-2u
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Nov 2021 20:11:29 +0000
Received: by mail-oi1-f182.google.com with SMTP id w193so26671450oie.1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Nov 2021 13:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vGBRocmjUuOsxEUXg/PEBsnNgp/Um6j49Jzz6QIa8yc=;
 b=xxb0trPwu215MUOEPwQITZcmJZDXu4ol7rGaQWlKVo55l+jWn7AFnLZzeDVljgBcAy
 M+05Q8qM8o0MjSvxB1soU/XupPrZIxrBzYgJeUAn+/uJtZzEyQ/m1yigD5e+5PVktn3J
 hBq6oc4R11iQ4dvmcz36J4LJCSkD4AHBgbNtoDglUkO5YbnT6gaW1EnJMSAKG2+djzvh
 jQFKJuihtufb3NPjpafUpjudTnfgJwUNyS9VSe5PucyCHQbTX8Mhi3wzrEl3GVaBCrO0
 n1S47EH03IKVUErdaYXjL8OFfejyCIQ7XfgvZ0DM+1lp2//3EUjmSAj94hm9smsxsDaq
 xFhA==
X-Gm-Message-State: AOAM531lg8u7+JVAjnmsMXhKyVPXoMmL/nrhF+GyPMmT0jhxVxh0IbJz
 xM430y2a/uHTPZp0tixiBw==
X-Google-Smtp-Source: ABdhPJzEJPMEeZlG9eTygjSBuADrt2G2XC6VMZ09gbQ3Fhq8BmnEjm1r4hXQPtt0k157GXvtpoj1Ww==
X-Received: by 2002:a05:6808:1447:: with SMTP id
 x7mr1076882oiv.23.1635797487437; 
 Mon, 01 Nov 2021 13:11:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a8sm340241otr.3.2021.11.01.13.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:11:26 -0700 (PDT)
Received: (nullmailer pid 959745 invoked by uid 1000);
 Mon, 01 Nov 2021 20:11:25 -0000
Date: Mon, 1 Nov 2021 15:11:25 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: aisheng.dong@nxp.com, linux-serial@vger.kernel.org, Mr.Bossman075@gmail.com,
 linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org, olof@lixom.net,
 adrian.hunter@intel.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 jirislaby@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 sboyd@kernel.org, kernel@pengutronix.de, s.hauer@pengutronix.de,
 linux-clk@vger.kernel.org, arnd@arndb.de, mturquette@baylibre.com,
 abel.vesa@nxp.com, giulio.benetti@benettiengineering.com,
 leonard.crestez@nxp.com, ulf.hansson@linaro.org, stefan@agner.ch,
 soc@kernel.org, gregkh@linuxfoundation.org, festevam@gmail.com,
 shawnguo@kernel.org, linux-imx@nxp.com, robh+dt@kernel.org,
 linux-mmc@vger.kernel.org, fugang.duan@nxp.com, b20788@freescale.com,
 nobuhiro1.iwamatsu@toshiba.co.jp
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YYBJ7ebwRxidQOrA@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_131128_159933_52B6B47B 
X-CRM114-Status: GOOD (  10.53  )
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
Message-ID: <20211101201125.zGQSEPzPutRhse9Q6ACWUBVnJIFpkwltAshpuJ2iDSc@z>

On Sun, 24 Oct 2021 11:40:22 -0400, Jesse Taube wrote:
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
