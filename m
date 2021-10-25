Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5C9C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 12:56:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0EB61027
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 12:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED0EB61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9I4EDstxbh3iKUNrhQMwIFhN4stjxGOONL9r2RyZME=; b=k9/OjAu46EebYb
	fBUy+a7RfmsgSZh7FdtREy6moa5x4DxDewiKin1DzwgLgFHdNt7dyEosc3Wao2SXHv9l+8IemDLON
	fXbn1gUuGsqYF/H3IC6Zg7ovscaFNQBGyhQIoDhtPMzXIxxbNmLuJr2VcPThUXo7p+gk4TjH5rW+z
	O/Gl7hCnXVmqJPGazjDZ5lkL/nzrHk1ciVYRMN9ff0K9b7FsGJWPK4z12hSoDpDzeMD6UNP/R/Bxl
	DBgiMEt318VxK2fPZCCXQuQ/aWJ5aBDLq4JZ+DHQnkyED4+w8ojE+/6HFa3cG5x+PqNjxo98863vj
	EiHAaRZUStlzjbc8gWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezVi-00GSWo-3c; Mon, 25 Oct 2021 12:55:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezVg-00GSWa-9s
 for linux-arm-kernel@bombadil.infradead.org; Mon, 25 Oct 2021 12:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nOxpnvvs9keLKH1c5NIl1Op/Q3M/paHDZ/uEML4RAj8=; b=SzTLKAhcYNWakT18/wD3MfwYis
 wxw5H3ckyqjodq0m1HMmGsUXZJDbE1MfEZEvyq91JZHywNmGp8w4Wz4I1L7+ekc+71/ZDd3C8OLhv
 xCYd5At8v2E/FWS5BKOGPraWAqv5wb5Imv7eK6HnPhL2LaZ9xqfBW6UjAqxrZdvlDP4xx91wOXlWk
 xpK9Gt/1ogCyz2u8c7NSJokSAG6APTKGFVcZJLhB6nlwIz57LJ+4zVNxsZfLX9TvoILVKhxAHTYu/
 2ji3fBfM/loH08xt98r3ipKOH0m8Bgn+z6Sk5LjHS+IlsLpJwWL9M3oLYzRIyVcw/OcuvWwn3tK0M
 Z3axImiw==;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezVc-00C9Ay-MN
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 12:55:26 +0000
Received: by mail-oi1-f177.google.com with SMTP id z126so15352317oiz.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 25 Oct 2021 05:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=nOxpnvvs9keLKH1c5NIl1Op/Q3M/paHDZ/uEML4RAj8=;
 b=7iaJXSqbKhnRk8TqS6d5gFAH7UrZLPNvJIv/Fa7Z8g1dQLK5zgh/rb4H3il6hbvnjo
 UbgHKrc5HNRmpC0ezI9ThyjRzIOfgXmgK6I0VWV+M5pA+kSnPf6imY5R2nPk1JlDdzpG
 ljAW/Qnl5lpbCRb5h0s3Xge+hxJiHo1dKS6Vc7t/6xZXaehvXQNl8TcAVNFdVQlG3lcQ
 Sx5dYWrkU1Edj12/pKB4Tcuf5hIsUvZAureF0IbQBlRgEp3OvLwh8Y7K3sskNnGEAchn
 jlUuLc8Eftc+RMC/tdUA73OHRUWEFKsqnXFRYXbdiOzkoM8/WanLTWLMeo3Ke7duFAfH
 JePA==
X-Gm-Message-State: AOAM532xp3mOqIY9cpmgPGFBvGNEqgPAiLg5aiK2OGwK/af14p4jIZm8
 YXX4oHD+0HPdR8Jpp4LbOQ==
X-Google-Smtp-Source: ABdhPJwAYx33aOCRRNq15+hxM7oFC/tQ62gb8M3eAH/L5tagUglqpAPdaQRE7dl7XsJg+Z68tP1Q1w==
X-Received: by 2002:a05:6808:118a:: with SMTP id
 j10mr22403635oil.101.1635166456864; 
 Mon, 25 Oct 2021 05:54:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r14sm3806703oiw.44.2021.10.25.05.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:54:16 -0700 (PDT)
Received: (nullmailer pid 190973 invoked by uid 1000);
 Mon, 25 Oct 2021 12:54:14 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: aisheng.dong@nxp.com, linux-gpio@vger.kernel.org, leonard.crestez@nxp.com,
 b20788@freescale.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com,
 olof@lixom.net, linux-kernel@vger.kernel.org, arnd@arndb.de,
 Mr.Bossman075@gmail.com, abel.vesa@nxp.com, linus.walleij@linaro.org,
 mturquette@baylibre.com, linux-mmc@vger.kernel.org, jirislaby@kernel.org,
 devicetree@vger.kernel.org, ulf.hansson@linaro.org, stefan@agner.ch,
 festevam@gmail.com, nobuhiro1.iwamatsu@toshiba.co.jp, shawnguo@kernel.org,
 robh+dt@kernel.org, fugang.duan@nxp.com, linux-serial@vger.kernel.org,
 linux@armlinux.org.uk, soc@kernel.org, s.hauer@pengutronix.de,
 linux-imx@nxp.com, linux-clk@vger.kernel.org, kernel@pengutronix.de,
 adrian.hunter@intel.com
In-Reply-To: <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-3-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Date: Mon, 25 Oct 2021 07:54:14 -0500
Message-ID: <1635166454.807053.190972.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135524_909966_EF895F7D 
X-CRM114-Status: GOOD (  11.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211025125414.ZnSHfq21rLky7JH-Cv6dlq50uCD56WEh3Ff8VN-1-mI@z>

On Sun, 24 Oct 2021 11:40:16 -0400, Jesse Taube wrote:
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
Error: Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dts:27.15-16 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545393

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
