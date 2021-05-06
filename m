Return-Path: <SRS0=qdH4=KB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E04C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 May 2021 21:08:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7900B61177
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 May 2021 21:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7900B61177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KD9xU9PkoE6ZClUngUqrv4gWjvqbnSp+Lh/dnJej7Mk=; b=Rhl9/PZKcuOkOGYaGEFv+V2Jb
	+T7ryi309mZmpxhXKEk3jQy1mvjpcEo6n8hEzEppXLnX5O1NwOZN+yqZgwDAcY0uDyH5uHKbUHJth
	Xnq8O3QAUGHieCpfH4F7mepoI9zXVCvcBNjliTDnF5UKO1mE3uRZw+HnOQhT1H0ulBXRo/G3EC5OM
	u57izeBsKc2+iBc0+5m3E7AKY7RY4NzlrgJk03GGqb4clrPF1HDgZCwya9qfjHyP5evsPUIZZnt6I
	zK4r9c7DWj+DLzH4tqDBQ2+b9ZoCqjjKIT+eDL9MQUkDBTm3+k4mSBsm9Ozxwl4De0lxl+Rm0mjmI
	wZqp/+9Hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lelCV-005KgT-AH; Thu, 06 May 2021 21:06:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lelCT-005Kft-FX
 for linux-arm-kernel@desiato.infradead.org; Thu, 06 May 2021 21:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=k/gPMK+Xfg6ep+H6MWsHFEMQ9T2XmEt9xMifTotgLCs=; b=KW79Gs5mgGXK/T0EONlzMkpK3G
 +zL70qtyAW4zfMzHMeCaSh8w573R7yvkrdcBHCIfDGSc0H3O0530SxmcI8KYPf/8mou361CG0jNQw
 Z9ZOhpKsTzr3br4LsAG03rNYCrgjEP+FUMS55b7Zl0PUhoenadqCBWa1Azm442tQKAu2dGz+zrziO
 R4vxKtdNFpfgjXQlitkMcAKCLG0x4u5Cgn0EoAFylPU3nbXRQ1+goL7h9CmRM3RXywGrXB3wk1GFM
 4e82YGZ5xI29heyjiWhxnXRObOaW2Q1P0NVi/NiHiz329c/Zu5SIgHpiR9XzTHI48KuRKzPvnxxWK
 C3ghC/oQ==;
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lelCR-006OL6-1f
 for linux-arm-kernel@lists.infradead.org; Thu, 06 May 2021 21:06:24 +0000
Received: by mail-oi1-f169.google.com with SMTP id c3so6718242oic.8
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 06 May 2021 14:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=k/gPMK+Xfg6ep+H6MWsHFEMQ9T2XmEt9xMifTotgLCs=;
 b=VeowMoP8A/3iY54MihodyI2x0jhU3h2Eqj5/jytWN+Lp5jqBGhgRydg5PmNTw5cX2A
 XZu3P7zS9zs/29U3biQRGykQMeL4WKJWPfFJx62QHZXnoLhBnQbec0xvGIIRt9neehxi
 jCDcRnU36IidtXpS48CxSqzkyNS5ZJ+uCn80vWQ59+VlfBDSayqa1bUpIktutcrxrl3K
 LwwxE93+IHyT0aSAjdvJrgYjI5WTg7A2BLdWMR2RXPh6Yt7E81sTIap1TVOVUSs+S168
 CruolJdGL+InRW/zY1//xMLsYiOnYiKQijZqFVaVNDPaT80ts2GlJrKexTlt+O5bNWuw
 W0bw==
X-Gm-Message-State: AOAM533yRYu2KdYnYrc8MoczLzp3v92cdgL61M0Ghb5W3nuilmf22aDy
 dj5XHrswCdjn25iW37fyNw==
X-Google-Smtp-Source: ABdhPJzMN9gjgQY9BEYZiNpCP4xZ48xwWs/pBZ5ttg5f2hhyvx0IaZqFCZa39vj+ke+XsaLqICcQnQ==
X-Received: by 2002:aca:a852:: with SMTP id r79mr12235980oie.21.1620335181875; 
 Thu, 06 May 2021 14:06:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n13sm728879oop.8.2021.05.06.14.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 14:06:21 -0700 (PDT)
Received: (nullmailer pid 801022 invoked by uid 1000);
 Thu, 06 May 2021 21:06:20 -0000
Date: Thu, 6 May 2021 16:06:20 -0500
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: linux@armlinux.org.uk, khalasa@piap.pl, soc@kernel.org, arnd@arndb.de,
 robh+dt@kernel.org, kaloz@openwrt.org, linux-arm-kernel@lists.infradead.org,
 linusw@kernel.org, olof@lixom.net, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: add vendor prefix for welltech
Message-ID: <20210506210620.GA800993@robh.at.kernel.org>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
 <20210504193457.4008384-4-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504193457.4008384-4-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_140623_106873_5BB2BD36 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210506210620.qUxYaLGiU5Iop7dcK_oKeXFYV2MRsHeJMNWC-WIxI3M@z>

On Tue, 04 May 2021 19:34:55 +0000, Corentin Labbe wrote:
> Add vendor prefix for Welltech computer Co Ld.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
