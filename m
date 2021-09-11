Return-Path: <SRS0=hxhK=OB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68426C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 03:01:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCBE611F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Sep 2021 03:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BCBE611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lb+8PIeaUkG2SgUaHDgnyzTj/IW+qdJ1FOmooRB2JLw=; b=FIGwRQp5BvX75y
	E0kgPdjTY99FsbHBMQ+R3e0ARNvHP0qBwob30Z+epCGcVxmxvMbyixX/ufQmKKG2K1lhvx4w8rY7i
	/H6IP7OF5iy2xjcEiNv3+eb3TNr60pCQHyBYfdYAk/00VN82L0Bx3qQRfa3RCPCAWgBtjr7zVe4IR
	hLcQtoWMzwFlSNxUcQ+WFxzNMUnL30MDV9zRrUdAuB1260KssYPmN2pQ64MAHORkwkr8GZ0oN8E6O
	KZv1lwL50zfNylG6y6QHXAu7JayKJuBjQrK6zpaGGi8e2rSaJUIVb41RR+Lgdv+9ko9896r5EJ1qp
	HbFLrae+urgeaS7Bl9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOtEv-00ECCa-68; Sat, 11 Sep 2021 02:59:37 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOtEq-00ECBK-UI
 for linux-arm-kernel@lists.infradead.org; Sat, 11 Sep 2021 02:59:34 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id o10so9001qvo.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 19:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QLsl1b3NpV63ZgEOzfho19a1Y601LOSFY9by5dYQ2vk=;
 b=ZuJTyoJ2Az9c1Is3XTu1LV5/RcY65XnXmK9vMWCubV36heqTW7cF4yLUQU9PtDVMM0
 fnXovV3tnPfgC5oaX9jyX6JtQEEgHRvOt6pnEvvrOlUiNsbD9Vv3TJZrvF+S0kZyHHFS
 E98OaS1d0Tpyt77mNYlHPOHMmTywNyO4wZQ+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QLsl1b3NpV63ZgEOzfho19a1Y601LOSFY9by5dYQ2vk=;
 b=JzBVfLLuILN7wb3lulcCvodKAEgfpzZfp3VUcWr6PVMQODmDPqus4oM65Am42RPWKx
 BmJJsFx7DprncbyYbbKKfDwoa7cE2BZu3VzEBvHKKinxnZnRGIvjNd+K/P8kcXBYYgqq
 Q1C2zmjNJt0X1rWX55Yq2YUOz8meM8V/9TpZUEdVn3Wlh6myaLG26mGtJL52aqsDGsc3
 TMjdJ5iKRS/FrEy+JFgWmpU/QkKZv8frtk8W7y/ms7zSOM81s4LeH9Xu9DkNFtlKf+QJ
 oaUZhWK13xFF6kavBA0XGgbggwyp1Y7qkRxO92e9oiNIb6pB930RspmaJrGXN5RVlKM5
 90mg==
X-Gm-Message-State: AOAM532PRxWOiPrploaYounmxc135bXuxaUhMgxDqdZIv0LNQbWHhdh0
 3Eim+wnqhPy/gCx89XajUjBd5ttzL+oGB4yQ/072/Q==
X-Google-Smtp-Source: ABdhPJxlXs7FidNs06MWxVYHLmOrbib25biafBKZ0BHrdEoITRWXuaidDQ8sY+mPr9EqtO+a/mftg06B0puO2QvO5HU=
X-Received: by 2002:a0c:aac5:: with SMTP id g5mr666903qvb.23.1631329171737;
 Fri, 10 Sep 2021 19:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910190322.27058-1-romain.perier@gmail.com>
 <20210910190322.27058-4-romain.perier@gmail.com>
In-Reply-To: <20210910190322.27058-4-romain.perier@gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Sep 2021 11:59:21 +0900
Message-ID: <CAFr9PXmwRDfXmDR9UOGoQ2+_LDaSGgmg7n=Ek4RtBdiC2kfuLA@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
To: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_195933_017305_F699D7AF 
X-CRM114-Status: GOOD (  17.07  )
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
Message-ID: <20210911025921.UtZhdDpABm5BJya3ddE8il1-rQQrQnCPy8lf195ECQc@z>

Hi Romain,
Sorry for sending this again. Gmail decided to switch to html email so
the first version bounced from the mailing lists.

On Sat, 11 Sept 2021 at 04:03, Romain Perier <romain.perier@gmail.com> wrote:
>
> This adds a vendor prefix for wireless tag boards and SOMs.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a867f7102c35..b50d62dde7c5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -517,6 +517,8 @@ patternProperties:
>      description: International Business Machines (IBM)
>    "^icplus,.*":
>      description: IC Plus Corp.
> +  "^wirelesstag,.*":
> +    description: Wireless Tag (qiming yunduan)
>    "^idt,.*":
>      description: Integrated Device Technologies, Inc.
>    "^ifi,.*":
> --
> 2.33.0
>

This should be in alphabetical order.
Also, this commit should be before adding the DT for the board I think.
The prefix should be in before something that uses it.

Thanks,

Daniel

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
