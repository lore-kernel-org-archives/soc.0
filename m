Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23203C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 17:33:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98D964DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 17:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98D964DB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mHyvCmym9epG/Wr5LUs7VcJeJGgxbeIkDT5PrqiVmwM=; b=T4j50jPKzlgcYOGygTFrW46ia
	Dv2pju4iD13WLFJpAtLbIac/qfiJTj8IX8koU8kYmZZbB8u6TEVjTWH/Q82bLqXudHlSu+E2QuUJR
	EyMEn7Og4r+uQpcgRsFmVMeeIIskWtvmpm1XZBY4BEZv4W1Ci3w8OO5Z/DQmLqmb0Lq/idY9t5Owo
	RtKdC9X3MqOYWLRKjvxwMxKKY2VtKiT8Jy7u2+zP18agq6VPrGNicjoEgrjl8EhHUDT/uBoU8s4ZJ
	7lD01RMqZiMCeMt6dV2wIfiR2VMbdZ+BZrySGQLIwOHri5ji47ycPGQP38VGa+2ofe8XQ15sS8BF9
	5BaouM2+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9AOb-0002K7-Bq; Mon, 08 Feb 2021 17:32:21 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9AOX-0002J9-VR
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 17:32:19 +0000
Received: by mail-ot1-f45.google.com with SMTP id k25so12818472otb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 09:32:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CJGZSCJAur/5Hm+o5HKIZJ3m/1BQyOjxp7i5ki4kvKg=;
 b=bDAYrmBHaYJUJfWGztfELO60uLkQ/FgLoFEGezD8Jj5Ry/P1FkByAbduYR7w+ouVpm
 F1NJp2VNzCOUvehWM6IJml3nQ7TV9De9J6FcBmw+H/KRgOk1Kkjg10UKc/HCfHnfgiGf
 IVCJ5hIuWJSm/V8YDHa3iSmbsrT6K4UTZA9nqvUR+6cCMXExW1R02RVopkaFJAGtKZXg
 V9dOiZ2EBVqNmMUz8jiyAj9q701u5y17VwE4Q3UEkr4/9PtmcVdKuI6yHUyYFHJX9pg1
 L3tc6ykXBVIJ/DLd4TqXMsI2cifr69+AYBNRFdSzOPwS74DyJ2uV/Oxa8t05iOd9z/R7
 4BoA==
X-Gm-Message-State: AOAM5327KxLA/vR/Y4sqqjlX5n5+9Adxt3dRvdOt1TSp+pYqFJiZjRF/
 Mf63YWzlRUT7JiwkUHXqIA==
X-Google-Smtp-Source: ABdhPJw4/R4KH0mvoPgQxyLxAdM16oo9jlsjZpjjo7ro5BZRGiRShXk92zZZg3RgRWmLqj4kALEs9w==
X-Received: by 2002:a9d:640b:: with SMTP id h11mr13124079otl.224.1612805537064; 
 Mon, 08 Feb 2021 09:32:17 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y65sm1324246oie.50.2021.02.08.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 09:32:16 -0800 (PST)
Received: (nullmailer pid 1578321 invoked by uid 1000);
 Mon, 08 Feb 2021 17:32:15 -0000
Date: Mon, 8 Feb 2021 11:32:15 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
Message-ID: <20210208173215.GA1567700@robh.at.kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208102730.p4nhsl35oowsklv2@kozik-lap>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_123218_089988_A37F5CCE 
X-CRM114-Status: GOOD (  19.17  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208173215.eob9vdtsVaw5JNofNX6yPfEO8qymKyF7KRG_0rjp9aM@z>

On Mon, Feb 08, 2021 at 11:27:30AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Feb 05, 2021 at 05:39:34AM +0900, Hector Martin wrote:
> > Amusingly, this wasn't yet documented, even though this vendor prefix
> > has been used since time immemorial on PPC.
> > 
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 041ae90b0d8f..d7950c723472 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -25,6 +25,8 @@ patternProperties:
> >    # Keep list in alphabetical order.
> >    "^70mai,.*":
> >      description: 70mai Co., Ltd.
> > +  "^AAPL,.*":
> 
> All prefixes are lower case... see ABB below (not mentioning that the
> company name is not APPLE), so just "apple".

Grep the kernel tree for 'AAPL,'. It comes from the the ticker symbol 
which early on was the preferred form, but we've tended to move away 
from that. The DT Apple ships (which is *very* different) uses both 
forms.

So keep what exists already or have old AAPL and new apple?

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
