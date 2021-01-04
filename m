Return-Path: <SRS0=LXHu=GH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83A7C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Jan 2021 16:30:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4D62245C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Jan 2021 16:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4D62245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vZk0ocuNl5xMOWGLzsvVkjy/ZsoFGtQgZBzxVZbKCAE=; b=NyWmvzbsWNLaMlrRnc/N7peGa
	vAHyM5htilOUhq9sVuNFOU94wVg+3jXw90O/JObDoKgX95CtzRfrStGy0ErxNJo6ODpK/wkL8sMQH
	XH3GMFX7N9ZVvoGwepNkZg5ZiLo9ACQMtAEMW/claISGGqqam0DfzOjOTAj5T8N2hq7AF5g8eaZ3a
	3cxAB2Zuw4O/soTGy2qaGNUW2i84xtYUXcgHtUKJ43o6HoSYhxNnpQn/TiP8PqHiEuFXn7QNGZGqc
	S2KxN7BR5abrBWL1IPsiplnaSSty5LsDTdi6Tl9vwlIgBbmw4rbPT3z++8mWmQgkLAEZ33PtibNYo
	zmVMIx7UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwSiw-000173-Rq; Mon, 04 Jan 2021 16:28:50 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwSiu-00015b-Bn
 for linux-arm-kernel@lists.infradead.org; Mon, 04 Jan 2021 16:28:49 +0000
Received: by mail-il1-f171.google.com with SMTP id n9so25845265ili.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 04 Jan 2021 08:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6BE0bLFnBbRxZQebjCFcYcAXRZ2Cug808cMEhBnkBjQ=;
 b=TqH2yT7bTZiRlEhdlQYqhJ+MYSy6qeyV+Gc7Loh8oSlcrnt5kPGiaOVay5z1Z4NL83
 e8NhB8DR5qNk7S7J88LlSFOAw3HI7uP6fS+9p57JAiHK/N4zri4CfsUC/s3EQF3kQim3
 rd/zO63WqAFVCAALwjokoncSZEZYLLHZeSxUvlV4PB8TLpz47G9Nu43DdF8npqZ4337s
 3+MRFGQ+nrHkmkw9cwMTh16hN8i0wQO56IwhNyXJ87Bd+gwPAS048nbk1q0mgbYsD/MJ
 uxKQyAO+qllJ4XPz27jYa8M5dppBRW7dffY/Ol07MVnz+exKE9zaViHYyh44NTTtu4kW
 BUYQ==
X-Gm-Message-State: AOAM533cagNfjWUjgEx3f3wnVdhrvKhqpSgobdaxsd8msGFtlv8csJDP
 8hOoS90G3FH9QIeW8Wr7fxughSfenA==
X-Google-Smtp-Source: ABdhPJzRl+1dDFvpecCYtgp1pt4LNgqtUQWMaq4z26IKHkGBVToNJOC7zkPShcm4TERSM4BP/cFMJg==
X-Received: by 2002:a05:6e02:ecc:: with SMTP id
 i12mr68736490ilk.0.1609777725189; 
 Mon, 04 Jan 2021 08:28:45 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id o7sm42568788iov.1.2021.01.04.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 08:28:44 -0800 (PST)
Received: (nullmailer pid 2106078 invoked by uid 1000);
 Mon, 04 Jan 2021 16:28:43 -0000
Date: Mon, 4 Jan 2021 09:28:43 -0700
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: Re: [PATCH 0/4] Remove PicoXcell
Message-ID: <20210104162843.GA1875909@robh.at.kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_112848_479909_1B19EA46 
X-CRM114-Status: GOOD (  16.24  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jamie Iles <jamie@jamieiles.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210104162843.qhmQAGdcB4pkqutQk90b_T0sZSu2Iub5MIOx4fo25uI@z>

On Thu, Dec 10, 2020 at 02:03:11PM -0600, Rob Herring wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
> 
> These patches can go via the respective maintainers' trees.

Arnd, Olof,

Can you apply patches 1 and 2. The others have been applied.

Rob

> 
> Rob
> 
> Rob Herring (4):
>   ARM: dts: Remove PicoXcell platforms
>   ARM: Remove PicoXcell platform support
>   crypto: Remove PicoXcell driver
>   dt-bindings: Remove PicoXcell bindings
> 
>  .../devicetree/bindings/arm/picoxcell.txt     |   24 -
>  .../bindings/crypto/picochip-spacc.txt        |   21 -
>  .../devicetree/bindings/net/macb.txt          |    2 -
>  .../bindings/timer/snps,dw-apb-timer.yaml     |    7 -
>  MAINTAINERS                                   |    9 -
>  arch/arm/Kconfig                              |    2 -
>  arch/arm/Kconfig.debug                        |   13 +-
>  arch/arm/Makefile                             |    1 -
>  arch/arm/boot/dts/Makefile                    |    3 -
>  arch/arm/boot/dts/picoxcell-pc3x2.dtsi        |  239 ---
>  arch/arm/boot/dts/picoxcell-pc3x3.dtsi        |  355 ----
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts  |   78 -
>  arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts  |   84 -
>  arch/arm/mach-picoxcell/Kconfig               |    9 -
>  arch/arm/mach-picoxcell/Makefile              |    2 -
>  arch/arm/mach-picoxcell/common.c              |   81 -
>  drivers/crypto/Kconfig                        |   18 -
>  drivers/crypto/Makefile                       |    1 -
>  drivers/crypto/picoxcell_crypto.c             | 1806 -----------------
>  drivers/crypto/picoxcell_crypto_regs.h        |  115 --
>  20 files changed, 1 insertion(+), 2869 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/picoxcell.txt
>  delete mode 100644 Documentation/devicetree/bindings/crypto/picochip-spacc.txt
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
>  delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
>  delete mode 100644 arch/arm/mach-picoxcell/Kconfig
>  delete mode 100644 arch/arm/mach-picoxcell/Makefile
>  delete mode 100644 arch/arm/mach-picoxcell/common.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto.c
>  delete mode 100644 drivers/crypto/picoxcell_crypto_regs.h
> 
> --
> 2.25.1

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
