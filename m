Return-Path: <SRS0=cSn/=NI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CD0C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 22:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B08760720
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Aug 2021 22:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B08760720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v4vshwb+AQLouVzqUv/yfO4YuDcoQMiaUTtaRhIklc8=; b=MxvcCAavKdAhEK
	8Dsz7cnegMYq2/YEFSPIrfNWQS0K9Pn0/Cqk36o+5A8orWazNrlNTcEaoUCuZhtkKdJkstzVjZuNH
	7LFysnv9SlJ5wTcp+1tCE3VhH/hFLMU85gLNqQReMuuRojQzKcwMkTC6LB7H55Nnp/NXolYYakY0Q
	qeM/qU6A5QTjAYMBu+0vSYw6j3De/kQ3kBd86cXXZlodMakIYoTtWGFH4WkcKhp2H+rzEUYNYYGr0
	V63qcW4FfXMobS6onUG0MCzOeDPDMVZ838Grh+3yMBawcDFh150z+wgmkY22imXLy4+/tA5IWTcPd
	5PBp9SdwKdlp3h4J8dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG7Pv-003dJD-34; Tue, 17 Aug 2021 22:18:43 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG7Pr-003dIY-Hi
 for linux-arm-kernel@lists.infradead.org; Tue, 17 Aug 2021 22:18:40 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 r38-20020a05683044a600b0051a2c6dd421so331268otv.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 17 Aug 2021 15:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hH6x0kKNvTVTngzAJglfbn28xI8QAAWrgkjyn1ogaAA=;
 b=p28zUhbxeY2Y1Lz6B3m1pLMWZwNYerXKDClIKEIfh6NEoXKFYc7Kq462rRDE0hrHkv
 hjjhIkZLVejBneUbvB3EbLJHPrijJ00LwZ26gSY9J/TXzriNKr2nSqdPw6O/OOvAVnGa
 WSfV3VB0PByZ5ikvu1GLAN8jvrDbmV2bligHVTZJwiSwahl7KeqhycHaXGuvq0AhEpx3
 /zJ1gVXqEblRuEiK1wcwkVA84O2JmQ1snVsKcFKSDOsxIHE9XacfEf5i+l3cDh1ejN7e
 POINZppC77b+BmPhCmFzh3DWRrNX4tTvx6SiGDjFsxj9Es0I3sYukk7PKSvdr9h4lL5u
 zuKg==
X-Gm-Message-State: AOAM532bM0gLKUwiMZoQZ+BbOwwgB/Ec1IbSTwCinPBAZiZ7y9z3f73p
 AvKVsuY0N91l8Xx9APhPdA==
X-Google-Smtp-Source: ABdhPJyZkwXaIBIiV+RYqjeipQRsYMSwJcPUjKRxBFM10YNTOL1cqAvlf+PDs3/94oHBkGxuqgjARA==
X-Received: by 2002:a9d:77da:: with SMTP id w26mr4522551otl.293.1629238718681; 
 Tue, 17 Aug 2021 15:18:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s12sm654598otk.21.2021.08.17.15.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 15:18:37 -0700 (PDT)
Received: (nullmailer pid 939324 invoked by uid 1000);
 Tue, 17 Aug 2021 22:18:36 -0000
Date: Tue, 17 Aug 2021 17:18:36 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: ARM: at91: document CalAmp LMU5000
 board
Message-ID: <YRw1vN9KHSY1hCmR@robh.at.kernel.org>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
 <20210816064416.1630674-4-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816064416.1630674-4-claudiu.beznea@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_151839_627806_49879A06 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org,
 ludovic.desroches@microchip.com, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210817221836.9egvSdfC_gVFjcMANExtot0tCQTMghG6PO_-_3c85WE@z>

On Mon, 16 Aug 2021 09:44:12 +0300, Claudiu Beznea wrote:
> Document CalAmp LMU5000.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
