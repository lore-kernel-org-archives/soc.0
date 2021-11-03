Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D8DC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 01:22:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F47360E54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 01:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F47360E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dhE/XEQhp918LPI1krwCZIY/967wBA1hNnw7F7j7aw=; b=UkneLmSUgtxVaC
	6i9wf+LdqvEIMyWnaTKkcoMLCI0xTDBsZxVJGi/sEx28mdsfYmeaRGD6PrGO6/8JQJ4BC7FROgRm6
	rJsJni2azymsGdXZVnrIwln+lvuNgf9aNOGu6poECyb20J13KdioStamd3i7umDNe9K/7v/V7jrj/
	JNrcqQ5N9kRp05R3E86m7jGvZXOmlhfzMh8nudTe1TnOrSPYhWykHsj/h3Dti14CY+DTaVMV2O+tg
	yeKv5VFpnPvXX1YRdTnUiA+nZs7RxYJR8p9VRbm3gBxGFvpk0q79Gdd2rDqoYb1xLdPoHJ4Utk733
	+Tfv4kR2D6TmBovzZoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi4xa-003jV8-V2; Wed, 03 Nov 2021 01:21:03 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi4xJ-003jQK-Ve
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 01:20:47 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 n13-20020a9d710d000000b005558709b70fso1339401otj.10
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 02 Nov 2021 18:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=eg6tDiGhmQHR7M4AmqkelwPUQFNkN8vUJTDKmaxB1zA=;
 b=dbwRzl1EypYdBQF15+Z2Q30UqtFHxScz40ZkMViWKQJ7SW5AEZNAFPVTzHnklNb5su
 sOreoQv2jT0mZyGSC0TqTXiJefbh3ucBETSDVLNGhtb9ih6leErcPtX4GtQ/OnEk9TxO
 Zwjs+Z1CWQ68KQ66aUT66DC9f9RrRNB1q1v4yKNEKCVzo+dNDHKNnI7XyyrIveBojbez
 5akWxQsQvVF2J7Mlg2wKqH9d7ou80zPtueOz88SW4woZYWH6ZAPmEyVDYUS+emElC7JY
 1viASexWqr+DKcOdObzjh3l52u8yP2JNjd7v30+FmhFD12v/QXxlYC0HGhH0cOPOtqs8
 mkhg==
X-Gm-Message-State: AOAM533lBJqUuAtecdfVfUICrUFRQ6jGZr60vy0UTWsp+r0CKiQUah+9
 HwbvaoqYAUrSX2c1nQtQD+irQRF6KA==
X-Google-Smtp-Source: ABdhPJxI8TysvZeSMHo8n8LYydlYVwW/NQ65dvUrt2keSHitPnqMkxfUQNAAk5YzrbMonVWDUAFRtg==
X-Received: by 2002:a05:6830:1448:: with SMTP id
 w8mr24209350otp.345.1635902443178; 
 Tue, 02 Nov 2021 18:20:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p190sm179766ooa.1.2021.11.02.18.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 18:20:42 -0700 (PDT)
Received: (nullmailer pid 3880387 invoked by uid 1000);
 Wed, 03 Nov 2021 01:20:37 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Mr.Bossman075@gmail.com, robh+dt@kernel.org, shawnguo@kernel.org,
 mturquette@baylibre.com, linux-gpio@vger.kernel.org, kernel@pengutronix.de,
 olof@lixom.net, linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 gregkh@linuxfoundation.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, jirislaby@kernel.org,
 linux-clk@vger.kernel.org, aisheng.dong@nxp.com, festevam@gmail.com,
 linux@armlinux.org.uk, soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, devicetree@vger.kernel.org, abel.vesa@nxp.com,
 s.hauer@pengutronix.de, giulio.benetti@benettiengineering.com,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, arnd@arndb.de,
 stefan@agner.ch, sboyd@kernel.org
In-Reply-To: <20211102225701.98944-6-Mr.Bossman075@gmail.com>
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v2 05/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
Date: Tue, 02 Nov 2021 20:20:37 -0500
Message-ID: <1635902437.638872.3880386.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_182046_077665_A2BD0E34 
X-CRM114-Status: GOOD (  12.97  )
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
Message-ID: <20211103012037.7LzxucWHmDe1QM0MUAlmvnlo0tQAxmrA9exOEauTWjY@z>

On Tue, 02 Nov 2021 18:56:53 -0400, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Replace macros with values
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml:0:0: /example-0/anatop@400d8000: failed to match any schema with compatible: ['fsl,imxrt-anatop']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: ccm@400fc000: interrupts: [[95], [96]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clocks: [[4294967295, 3]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clock-names:0: 'ipg' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml: timer@401ec000: clock-names: ['per'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549993

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
