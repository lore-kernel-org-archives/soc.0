Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF66C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 01:22:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AB660E54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 01:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50AB660E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UDgGq89TBgbr/almoIu2cUnn8qN8etwxZeO7dKZno+M=; b=y6dpBss7573QNn
	dT/eWYKL4pjLXHEo7auYpGW3ief+Y75LJQce9h1RyGcez8sdAbb4XrPT8kKJhGqYqliKHnrBOBS3d
	ppDEbsC/hGs5U9LQ4bd4FWF1msntSiiSBKRYz2M9hOqyD4pJjw8YTsdszcddmZ0962uYErlxzta8d
	n+6+dgN9UHBL9i0X0fiMvij/lMV2jdHWpAIgixfCerbNJ+xlxj6suXpKm56kkOIBeGKxt/AzRanHi
	+DNSGccB/nN3u7mHJCDITIi5pbLWioyJZ2bNTJNbA6OeRX5x/f+7oWrD3XdBmnK4rCkDLjtyN7Jbr
	a4+eMnPWQp+SSwCDn94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4xq-003jbW-Pg; Wed, 03 Nov 2021 01:21:19 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4xK-003jQZ-6U
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 01:20:47 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 o10-20020a9d718a000000b00554a0fe7ba0so1323378otj.11
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 18:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=HT3Al7yEHGSK6UDiiYAJrJ+g635E3g2QC/oWZ2X7eXk=;
 b=8SHg27NTklMnqJMqMaVInc+wbgfYHtq+m5KEyzQ2SNnsy6ySL2n0VrE+wiNFeKUzuo
 uFn0VoT/51l4jxI00kapRehqMQvqr4aRc4+T5MSe3N4bJnx6Sd/aP1YgdylXg7ZTt8B4
 w2Rak5OM0/8FqxkbvH8atbUfM5pkHHD9eKpFZ38Ud2msOtP2foDaBnYjhdY8SE4bbf/M
 NA83rHaWIoEHpJzh0WKdk0awTlVZJBL5lsfnSZz/bAbB3qaHmaU8qurw3ZPaTk6pk/n6
 O0iQHEuwcR6vEjZUbOuFG5wLD8oUpOM99d6rOhWqOXM7CDrOy61DQt3DVIEMjJbKYG+H
 sElQ==
X-Gm-Message-State: AOAM532LibwZbzRa4AC1tmNT4/8T5Mv2Ow0qT/w9yIlcWgZsbtMSk4AY
 LfnE3t5AjMzXy+OxOe3cSA==
X-Google-Smtp-Source: ABdhPJxhVbGuEfatKMxasFBTo+fCT+0b/sjoW6AfDHk20XhnyuWHqQdGzyx+ihb2pZY1CE+wyKCCoQ==
X-Received: by 2002:a9d:6f8e:: with SMTP id h14mr1526386otq.50.1635902445227; 
 Tue, 02 Nov 2021 18:20:45 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 70sm158943otn.74.2021.11.02.18.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 18:20:44 -0700 (PDT)
Received: (nullmailer pid 3880385 invoked by uid 1000);
 Wed, 03 Nov 2021 01:20:37 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, aisheng.dong@nxp.com, linux@armlinux.org.uk,
 s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, adrian.hunter@intel.com,
 linux-mmc@vger.kernel.org, kernel@pengutronix.de, shawnguo@kernel.org,
 linus.walleij@linaro.org, linux-serial@vger.kernel.org, jirislaby@kernel.org,
 robh+dt@kernel.org, abel.vesa@nxp.com, festevam@gmail.com,
 ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 olof@lixom.net, sboyd@kernel.org, Mr.Bossman075@gmail.com,
 nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org,
 gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
In-Reply-To: <20211102225701.98944-3-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Date: Tue, 02 Nov 2021 20:20:37 -0500
Message-ID: <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182046_274392_522F1791 
X-CRM114-Status: GOOD (  12.71  )
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
Message-ID: <20211103012037.aGI6a_1ssyF-R1XufMx_7yTkZ77J74uPvMhWAts_7XI@z>

On Tue, 02 Nov 2021 18:56:50 -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT1050 pinctrl binding doc
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> * Add tab for last pinctrl value
> ---
>  .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'fsl,mux_mask', 'imxrt1050-evk' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'pinctrl-0' is a dependency of 'pinctrl-names'
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl-consumer.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549987

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
