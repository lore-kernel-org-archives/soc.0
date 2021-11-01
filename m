Return-Path: <SRS0=A4Es=PU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CD0C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 20:12:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3852E60F42
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Nov 2021 20:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3852E60F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18IUMQfgjczBlaFaeaQ6rProAMnE1WpRnxBaaPW6fXI=; b=YUktkEXH5DCAwO
	t1xE1qhfCd443Q6hILXfVdARfOPuL3A5P0ERP83nOJylavTqnHMd6UIdRi362Ro5YQBd5zF1UrsFp
	zzwo5U9610H0KaUCdSZetL6ZcY/pjaK2oFeLsIaENTx22CQ3DZEawOQZwgGbwikAPt37yvEzdHVlt
	bTgx3q2M+pejU0YlZ5WE9qcmyy7qfCiHW7bAZDq7sHkacj2WcUuLajzbGCEdiKHFrBdtPkjrjarI/
	5JDWJhF4boSufTPkB3HJnv3p/MquRCQVVu2y11I/5UWWpgB9L+8mN9vCd6UZ+BSmfLmM2Y7STMdv8
	8t2wOvWov90zDg7AaEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhddv-00HENP-NU; Mon, 01 Nov 2021 20:10:55 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhddr-00HELj-V3
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Nov 2021 20:10:53 +0000
Received: by mail-oi1-f174.google.com with SMTP id k8so13548320oik.7
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YoPr0Kx00n/4wfXS6DjD6CcxN8CXGBgVqxsaU5uGgD0=;
 b=bDYL9qnQHr5PpUiZcE/By7efejY2pJFRl2tk0ylesXPXoTbYUFRRdLRvSO2kATPvyu
 S8WiMDgsMZ8fZzQjJYJxzmPbS67vzJiJEJGhcbvN9QK7QIqrpVr/lRj7hSDMlYvdhHku
 rAeRcDxfoOzb7z9sSVelwtJfhs/K3ZFRYy/9wnBD7nJR2LBPXmSFYu7Het+HiL6KnTuC
 tL4DDIVt1rQm5u+7+SuzRnuiGFi4xOlvldj5GjfoLHDvWoTSZnJaFsSyYN44LBmZifsJ
 kVK6N2va0vUoRmn2bKoNqTfN7gCCBxOM1TdpUwunlnMXPKG9vULsZrijabkEZ9NOk6kR
 YbKw==
X-Gm-Message-State: AOAM531P6rwL24O4anGEtuJOBLYI08g69Nidt05IMnAeOKNGsFmDBXx9
 pwbfMVOFurErxGKM97LDMqk1wnrkwQ==
X-Google-Smtp-Source: ABdhPJy6tmrwBgKtRi9dAo1kDwvxy9RZo62SehMKvvN4By4omxUupe1TXERv1fMuoG9m/jB/5Xhp/A==
X-Received: by 2002:a05:6808:1151:: with SMTP id
 u17mr1060525oiu.38.1635797451074; 
 Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v25sm2524981otn.30.2021.11.01.13.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:10:50 -0700 (PDT)
Received: (nullmailer pid 958604 invoked by uid 1000);
 Mon, 01 Nov 2021 20:10:48 -0000
Date: Mon, 1 Nov 2021 15:10:48 -0500
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
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
Message-ID: <YYBJyKv61p/sk1PE@robh.at.kernel.org>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_131052_021027_DCBC6650 
X-CRM114-Status: GOOD (  16.79  )
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
Message-ID: <20211101201048.J838xSb7Pz-i-0VdtogtTqDAefT_UrUIABoM_oEch3k@z>

On Sun, Oct 24, 2021 at 11:40:17AM -0400, Jesse Taube wrote:
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Add binding doc for i.MXRT1050 pinctrl driver.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  include/dt-bindings/pinctrl/pins-imxrt1050.h | 993 +++++++++++++++++++
>  1 file changed, 993 insertions(+)
>  create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h
> 
> diff --git a/include/dt-bindings/pinctrl/pins-imxrt1050.h b/include/dt-bindings/pinctrl/pins-imxrt1050.h
> new file mode 100644
> index 000000000000..a29031ab3de0
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pins-imxrt1050.h
> @@ -0,0 +1,993 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Needs to match the .dts files which has BSD-3-Clause. The rest of i.MX 
uses MIT IIRC. You should align with that.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
