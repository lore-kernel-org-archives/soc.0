Return-Path: <SRS0=Qqmt=MJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B07C636C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jul 2021 21:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE02F61151
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jul 2021 21:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE02F61151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Nx00bhYB70c3WjXA4+kHmEenPwjBHNuG+2i0LBu3SE=; b=bJi0NuFw4b6mZ6
	SDXziLJDQcyL1LBIJ9R0mmqJW4S5jAbxTYMvhKdEbLfuOW/VKH4HCFWMFBAN1hdePBViTde5j4a99
	6bvkSOQOkhy0adD/BzCMIg9p2E9iIjaskolt9TCX6+qBJN5juuV8OdMfhYlvd6ok2H6iqbf0vfILU
	OmzjknIrs31+3hTvmm6yBaX8ZBYZ5A2V7h4jdQrkn8qxPiWwHqxMl6stAbKK91Wu8EaVe8m2+fm+K
	ymFjcaR2A6IUFgwtgdEd+TZrH3/CrCsww6qArp423jouU/AXaykbKeizPkoXOciSegUiIyKuMgbsl
	zVOsybsj6lQYiugtgf3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4rpY-0073Se-P7; Sat, 17 Jul 2021 21:26:40 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4rpV-0073SG-4G
 for linux-arm-kernel@lists.infradead.org; Sat, 17 Jul 2021 21:26:38 +0000
Received: by mail-vk1-f177.google.com with SMTP id s74so2965784vka.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 17 Jul 2021 14:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XAK7+Gzh6ieUWzhfnNuMlvI9N6Gdn2a7QuEsKGdrmI=;
 b=iaRqtOL/sE8Oo/JqW+KVZrGOu28+San7K65WAsz21Kkl8PtrQQUlXc9+Q2qRk75OlK
 J+WzNbHigCW+CW4K+vjxJmZKnurGZwkIYxFlxTu28oKPwnPTK1wxufID0VNcTeFxomhn
 tDdgwOx9l3PyJDaqwU6bHvsB1a49YDQABM1obFAr+1h8py9VHpSzRZQileBu+OgTSEiM
 DLmV0wOUM6eDezUXLmteBd+IaaWTNqN1Zy+ahcqwK7Afu0QqOJUMvVBhBhS3aGYJhIKr
 LjLo8EubNO0JUVgNGcUxrqEyIVU8RzWuE1+BXxVt+bFl7nRG3zRfxnx9eMMSzOhoUQSI
 ixtg==
X-Gm-Message-State: AOAM533ktAPE13bXqBEHhTkWst3NupLO5o67A93EpoF7hwk8rQqhU5RM
 sbfuG7p6F7Uo0kABdLiDl/xB+uipm0pNjIQ+YOg=
X-Google-Smtp-Source: ABdhPJxKtXqo7qX7mahoa3XiRLqE8QXZHw2p1elWbvQVbW2yxP2VBcyH4F+ae1VpHCI1QWGOlvgIFuopgxhAvZh4mhc=
X-Received: by 2002:a05:6122:a12:: with SMTP id
 18mr18049497vkn.1.1626557195307; 
 Sat, 17 Jul 2021 14:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201210200315.2965567-1-robh@kernel.org>
 <20201210200315.2965567-5-robh@kernel.org>
In-Reply-To: <20201210200315.2965567-5-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 17 Jul 2021 23:26:24 +0200
Message-ID: <CAMuHMdU7f_zhHfnSNmY03bfBN5Kd2mO2N=yi5XTYwDNsd2XBFA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Remove PicoXcell bindings
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, arm-soc <soc@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_142637_212267_14082D5B 
X-CRM114-Status: GOOD (  23.19  )
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
Message-ID: <20210717212624.XJGS7kuP9TJ4bhueCTQZGmvNMv7qPs3EyIhTW-b8bfk@z>

Hi Rob,

(replying to an old patch that was applied a while ago)

On Thu, Dec 10, 2020 at 9:06 PM Rob Herring <robh@kernel.org> wrote:
> PicoXcell has had nothing but treewide cleanups for at least the last 8
> years and no signs of activity. The most recent activity is a yocto vendor
> kernel based on v3.0 in 2015.
>
> Cc: Jamie Iles <jamie@jamieiles.com>
> Cc: linux-crypto@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/net/macb.txt
> +++ b/Documentation/devicetree/bindings/net/macb.txt
> @@ -7,8 +7,6 @@ Required properties:
>    Use "cdns,sam9x60-macb" for Microchip sam9x60 SoC.
>    Use "cdns,np4-macb" for NP4 SoC devices.
>    Use "cdns,at32ap7000-macb" for other 10/100 usage or use the generic form: "cdns,macb".
> -  Use "cdns,pc302-gem" for Picochip picoXcell pc302 and later devices based on
> -  the Cadence GEM, or the generic form: "cdns,gem".

Note that (a) the generic form is still used as the sole compatible
value in arch/arm64/boot/dts/lg/lg131[23].dtsi, and the Linux driver
matches against it, and (b) arch/arm/boot/dts/zynq-7000.dtsi uses
the generic form as a secondary compatible value.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
