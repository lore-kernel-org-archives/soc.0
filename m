Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6232C433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 12:52:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0472761409
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 12:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0472761409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZvgmAhckntUbuE0FXo5IbKIEjb9SsrzxUSm4N1S1BI=; b=Ai8H/enPEHuSc5TD5ig444POXj
	WS7MNBQTS0oBnqvGiA9uwWnBZnLRHOIx0iiSRtJXDmRg25oKK+jqF6ejVl4JIS9RqecpY5Egj1t8x
	c27mhuk+ULNfr0QFANyv7QwZ8nSrF0iFo7Ea3cyQktMhJvqw/4/K8YRXP5m6QonPzhDyg17V/mikO
	7yE9q0DtILpYJlczJFNTvaIlwiS8tL5WRx4TSbPGudIR12e7UHy99jvUubu+22c5J+pPkik16m0Jj
	vSyZYHvsbf07ZoxRa3V45HTgISqXMm5kXZ7S3XNZLInD75ltsPJUjCJbBEZLT74xn6CRvf+RdX5ol
	HNBemBxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCKx-00EP6f-VC; Wed, 21 Apr 2021 12:52:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCKq-00EP6F-HT
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 12:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K1VN0E2afsXuIRa/0LuPNToiHvD7gJG5kP9WS3acX7M=; b=DxG9EvEg6JOwFDlSWUuoIGCBl6
 QnmaKTsPMXBDFtuPdVntuqdt6b6wdlV/futdzUX895ieZ/EVQKSrc0Vh9LTjpNEb8BgIJPbyltEzR
 skTcjylM4ve9heKaDYpnzzBTRG7l1wD3QcF7yInkku3UqxqY931sOZyeYwB0gLTUWPXG27eNYzcNO
 5ePRdntZIPc/KdQLVdYNGgNe+R8z8vbXtanGUksyODkYZdrPfbrTnxX8s4dA3pC83qsDoVf6Z1l/H
 uVyyZ5AnwL+6WjJcjwwpSEmrkE5xQfVXUJfDUrzFArwXTrTbipKubDA9DsHAJ7R1rEMhfET3CONGo
 oqMFFilw==;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCKl-00CsSF-F1
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 12:52:03 +0000
Received: by mail-oi1-f179.google.com with SMTP id d25so4788996oij.5
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 05:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K1VN0E2afsXuIRa/0LuPNToiHvD7gJG5kP9WS3acX7M=;
 b=i4jBFvBcqpBC5JgJ/8T2bkxpXdmmWS3GffcYdGG24PEMulAph52whQvRQyuZuypeeJ
 aAd3NEZGiprFtchQjL28z+qKuDi4NT0llFL/50j00YpL7VpucTLggbJAjWSvecC4N4Kt
 OlMzAFos0XRTHkqrjzQk+2p6av7FuLX17fVh6aayQnJWfy86RHfb3r/sHvLUGI5ic4B4
 m34CwOnHXROwvG2J3QXf/hVDilbQMmF0v0RoWxYs8Ryy6IJ0HdUyIlBKVJj1qyEQBL5y
 Nz8wgQW7LZ7qnXTrwSF46+2dcsBK2hYLNeupjST0qGm1VBXpwyHKpevIODh6+IFKA5lg
 pw6Q==
X-Gm-Message-State: AOAM5336EWpOm82LYZIliR87m3sO08DpCflQAC1kotYApyplgagaUpoy
 5nSAdLMvwBKTZrKDhARIZ7ELrJUQ5g==
X-Google-Smtp-Source: ABdhPJzBQLaeAdphPS+lRTeJpyFlvyfn8teAf6BdWXlXZzgiwjh0PpzFEFV066OXCxVYfGg6dPnRug==
X-Received: by 2002:aca:cf09:: with SMTP id f9mr6712741oig.95.1619009518555;
 Wed, 21 Apr 2021 05:51:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u4sm433608ool.25.2021.04.21.05.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:51:56 -0700 (PDT)
Received: (nullmailer pid 967208 invoked by uid 1000);
 Wed, 21 Apr 2021 12:51:48 -0000
From: Rob Herring <robh@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
References: <20210420230402.8807-1-khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
Date: Wed, 21 Apr 2021 07:51:48 -0500
Message-ID: <1619009508.502472.967207.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_055159_521521_F4DF3F52 
X-CRM114-Status: GOOD (  12.65  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421125148.Qz3W8F8Zn2v55EV_hnMcMlKL4-tKW60sat54JLUMoG4@z>

On Tue, 20 Apr 2021 16:04:02 -0700, Kevin Hilman wrote:
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  18 files changed, 38 insertions(+), 27 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.example.dt.yaml: ge2d@ff940000: 'reset-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/amlogic,t9015.example.dt.yaml: audio-controller@32000: 'reset-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml

See https://patchwork.ozlabs.org/patch/1468511

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
