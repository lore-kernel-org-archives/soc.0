Return-Path: <SRS0=A4Es=PU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F9DC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 20:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F8C260D07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 20:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F8C260D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7jlilj1oa89cIZ+D260SszaoNnKgtoEKGi53sK4jpQ=; b=koFKvWoSpHjCpY
	1BB1Ugxmc4/lJlEqdHFpqH8EtIqT793smmlb8C4qrbQCLcKToW9UqNPG5/LitTgGVo/VIyZwh542N
	NZL4ic333Ud5el27qqXok/UHuZD3sNLmXKhmy9g3iu3kUd7s12OiDKSfgeQCD0P5BkoYjGla8yPum
	CEsM41OcY0z4r6etn86NjxS54XXfS2j35UTJFUGq3LJxe+u0dS0cmQtuxxIaGo7rrVU2khD87eF4/
	JF05a/+LZ42HAClGwgz10xBdv+VkXHarKVf3xHvAzb2vegcG7Wo036EAiQ7Wzl+p0Js9z372GvTEv
	b1/Edr8Kd/MX2VrOzrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhdh1-00HFGl-Cg; Mon, 01 Nov 2021 20:14:07 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhdgx-00HFFd-LL
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Nov 2021 20:14:04 +0000
Received: by mail-oi1-f173.google.com with SMTP id k8so13560866oik.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Nov 2021 13:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Sj56GUTpPgRS7oqOggzrlIvilkSN16Fc0q8+soup5ug=;
 b=FVJKQuMEFf0qZLAktM8MwOaakjr7GjxXgZr4jnfKRdlTqnLnF2BMoH4DAgIythmbxq
 ZdxWSLdg1dHdGzIWeRBdt09JALDF0SqYlQam+ESZh9oGKljpXw0mv1S9Q/m0tWVXEbJB
 AdI5CHxwpTgGKKpUy7gGKVcqicSV6Br2t5yZa86k8ldGTR6nquBf+Tw3AuSa2YNC6CnM
 S0h51fZL3SC/4Dy8oiednPbLi3I7rEFSzQqBVlr3MWd2psJJHrpxge8bKVUY1A9gj72j
 J8ABgdf51BpCyQszTgwUEfe8NjyQPDld2Mc/22bYPlJpp3J5RNst4j6Ph1dmnIRFBfBW
 gK+A==
X-Gm-Message-State: AOAM531VHxcD+TQZh/HXByVgALux9eJesvP9oVZ09HpDyoZShjbPE7GY
 EyvOvwvWYx5j0LcHUclZTtdXLPgFRg==
X-Google-Smtp-Source: ABdhPJw4z4KW2KWTYje7OKN2C81USrvHcH4TcTdLEGXf0B/pSdBvEpDjI866C/Ip1rWhs9d+cREpGw==
X-Received: by 2002:a05:6808:f8e:: with SMTP id
 o14mr1063812oiw.89.1635797642815; 
 Mon, 01 Nov 2021 13:14:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 46sm4354343otd.2.2021.11.01.13.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:14:02 -0700 (PDT)
Received: (nullmailer pid 963901 invoked by uid 1000);
 Mon, 01 Nov 2021 20:13:59 -0000
Date: Mon, 1 Nov 2021 15:13:59 -0500
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
 stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org,
 giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp,
 leonard.crestez@nxp.com, b20788@freescale.com, fugang.duan@nxp.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_131403_721561_60006007 
X-CRM114-Status: GOOD (  15.87  )
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
Message-ID: <20211101201359.SP85OHqvxg3K3vBvyoTVNvtc0Tl-mQxdQXaRk7HaxG0@z>

On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> index a90c971b4f1f..4b4340def2aa 100644
> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
> @@ -21,6 +21,7 @@ properties:
>            - fsl,ls1028a-lpuart
>            - fsl,imx7ulp-lpuart
>            - fsl,imx8qm-lpuart
> +          - fsl,imxrt-lpuart

Actually, 'rt' is not a single part is it? If the variations are same 
die, but fused off then no need to distinguish. Otherwise, these should 
be SoC specific.

Same applies to other compatible strings.

>        - items:
>            - const: fsl,imx8qxp-lpuart
>            - const: fsl,imx7ulp-lpuart
> -- 
> 2.33.0
> 
> 

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
