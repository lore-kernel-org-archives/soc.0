Return-Path: <SRS0=GqV7=PN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA2BC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 12:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C08C60FDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Oct 2021 12:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C08C60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6d73OaulXAgt27JAa2GK/FlDKOXPgr4Xmr3ih93CV8k=; b=xHERkNH0aGpbob
	mqF7xAs0hnOWXBhdxUJWUFh7LQePwwsVYQzcNlnu143f6RPjjKXBV7mPxB74rSxzyxO2LuDAUu2y4
	069nNZvwwZc6sx7y2WDU02n22lDGb32Wqbw5kT8DKTLisyTUKHIAZBlcV5Q9sTSN5Zi7xtp+5xfi7
	3kwh/8Ips6vBl+p61mIKtUjsMNOzhKCQItVnKcmBeEhNLDdJjNy67rpgUZ0Cpa7YvA8dL+v0pMKT4
	4a6Dapo/BACzJbyW7exEKptIX6qqljhH24/CP6CsSYK5f0W9eOPNZVebsL2tl4GJPRfTUihGDH/96
	UNomTPSFFWlX+ZZTuPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezVr-00GSXz-Mt; Mon, 25 Oct 2021 12:55:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezVg-00GSWd-DC
 for linux-arm-kernel@bombadil.infradead.org; Mon, 25 Oct 2021 12:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xfPmPgNFQgIKrWKVU27Szuu0QsSCtm+5R24aa/F4BSg=; b=Dn0y7WCaZdeul8rj0xHy42NKvB
 DOwDNdwl1YkKxIbOE0hXAM9H+9+puo9IOMqA19vlr99FLvsAGnMDdcWN3TalY7X6rKoTKwhPhM38P
 HLJIlGLd23rgI3TU5xZ3rK7+pmOEUaB7lVTQdlj+8wLydA94QHdtP1zCaKdX4LUWYqLzeMXqa2XsI
 YAB0E6COslV8pHRqE6qN7aT3dE6PDd1c4xNQqOuAa52ZopdEEg6xIoeH17vutTXa7sBIQTlZW6PfY
 wBuaH3rczx/1sdsPWCEWRmlcvIGZU7S6PnF6ST9UjCmS7klACBSBsCGaHO84DDcJNZHkaHHlosJCT
 6C/fT+WA==;
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezVc-00C9B0-NE
 for linux-arm-kernel@lists.infradead.org; Mon, 25 Oct 2021 12:55:27 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so14711355otq.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 25 Oct 2021 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=xfPmPgNFQgIKrWKVU27Szuu0QsSCtm+5R24aa/F4BSg=;
 b=xgJxdm0QWEF77CG7mVTOcDjp4WTMjeMRFFrF7vCVDP1jTB4Y93Jef0uKy8Bfhhlfj7
 ieA+oGdrb2LZf9uiW8sk8JUnRZQOTptn9ACk04IEz/Q+awLhL3/5AvbJHJGZKPcLkZw1
 QTMerVBXWS8QDWplG8IdZ/rhJ6scbSWtWbuFyk94S65I9y1N68G/h8UiX4KywBMhjq06
 DUujP+vnk/R++uTrJfQ2HXYZdGvk6BDDfCqk8V8MzQK08KddKl8dY4sDTpQl9daLb/7G
 eQ3qJ9nf/TkHf91EMlZEsehP3wGgYXlOqn5NHQfwqwwA+Vnu2ZFhpDQyPO+lDcpMmQbE
 Ts7g==
X-Gm-Message-State: AOAM5325xa+fzvLOiG0yBaqTk2mIt6o/cVnqTLQNBYBYQS2b8eNC11H3
 LX0Vv1rHTCcUdRBT9bZms7iJDEtDag==
X-Google-Smtp-Source: ABdhPJxSzDa6Aw86E7HU9PcZR3V6hQx/apZrKRCDa2ilOHhh7Q1/dkrii+HwuqomKgo/nUzIa6Dt1Q==
X-Received: by 2002:a05:6830:1e08:: with SMTP id
 s8mr13970909otr.305.1635166460875; 
 Mon, 25 Oct 2021 05:54:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bf3sm3946646oib.34.2021.10.25.05.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 05:54:20 -0700 (PDT)
Received: (nullmailer pid 190976 invoked by uid 1000);
 Mon, 25 Oct 2021 12:54:14 -0000
From: Rob Herring <robh@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, mturquette@baylibre.com, olof@lixom.net,
 aisheng.dong@nxp.com, sboyd@kernel.org, Mr.Bossman075@gmail.com,
 fugang.duan@nxp.com, nobuhiro1.iwamatsu@toshiba.co.jp, adrian.hunter@intel.com,
 linux-arm-kernel@lists.infradead.org, b20788@freescale.com,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 s.hauer@pengutronix.de, abel.vesa@nxp.com, leonard.crestez@nxp.com,
 linux@armlinux.org.uk, shawnguo@kernel.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, jirislaby@kernel.org, linux-imx@nxp.com,
 linux-mmc@vger.kernel.org, festevam@gmail.com, stefan@agner.ch,
 giulio.benetti@benettiengineering.com, soc@kernel.org
In-Reply-To: <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: clock: imx: Add documentation for
 i.MXRT clock
Date: Mon, 25 Oct 2021 07:54:14 -0500
Message-ID: <1635166454.818167.190975.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135524_873342_D5E07C12 
X-CRM114-Status: GOOD (  12.67  )
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
Message-ID: <20211025125414.nVdmtu3Qg_bRKQts40qgpAdFiNpEXxQSq7CRLpUN7QA@z>

On Sun, 24 Oct 2021 11:40:19 -0400, Jesse Taube wrote:
> Add DT binding documentation for i.MXRT clock driver.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  .../bindings/clock/imxrt-clock.yaml           | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imxrt-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/imxrt-clock.example.dts:32.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/clock/imxrt-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1545398

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
