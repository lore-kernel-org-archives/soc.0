Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5F7C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 21:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A79611CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 21:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A79611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pR0lAvG3VPF9iQyKyLlac/9LXl4iTYs0LlOrnVf8obc=; b=RbzBAC69zNNLV4
	Gze6+djS8ALuNIYKt4qukADbjKS6YScg0I3hZq/V3fu3g7FA4DqQHRxvCBx7pFn0s9j9XKA0ahxZB
	PZTdNLSI+uXbt0aqqeid1+aooJOIci48zjOKctexyuDUX5YQJS0ZMIub8VGUHkdj/7+N4tzcy6ALB
	Xwwn3IOVO/FSCo/to0+UmsYXdQGoGb2zihvyz2vLbbkqUH10LubXd93NCfdyM5g+UbLE7WfYMsUCw
	kDl435JhNsXQWJ/HoJzPlbk9jQTjmqzBa2B7ijXt34YPxZW6TOS4wI7MCzqERN/AXKu7Gz1Gh1JGt
	SryYKHgNZGMSI7+D87gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lroGV-00763q-Lg; Fri, 11 Jun 2021 21:00:32 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrnhn-006siB-4z
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 20:24:40 +0000
Received: by mail-ej1-x633.google.com with SMTP id k7so6288006ejv.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 13:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+dQpQl+uCaHWxj358F0QEZFc7ikOW5DB/iODbuCA6Bo=;
 b=MOUo8P7M9qdEIG8LWpwG8oLhvsWO07zAGYwJ8BdYnmZ9pjT0vrIIM/ihQbyHWpVkBK
 i+vgTfrewH5QgNISDGetGS6E0ygfJrYnfnYeR+NHynZDTu6h96fRVoc9ovey2UKcHL7l
 QYAKB3ui4M8fPSv287ODj2K3kuYIVmH/9IV3vAoCuDhGM09j2UxevJx7Onfrdd+45dpd
 fGt4rGNrMwu2powuZ+XQxbmOHZYQVNB9RKouMTTJCZKdHzc2DUkKx66fVLkWJJEZQVoO
 3eF/fzMJC+O2j0spwrZ0S25mS5cmapTPqgNRNnzItarcnJfe78DQGz7i0EzwN2rOWukH
 Gu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+dQpQl+uCaHWxj358F0QEZFc7ikOW5DB/iODbuCA6Bo=;
 b=SOS9cExY4KYCPr7WIh7WCF6xAmf4MeXy/a7xzjQmIqX3huVe5iKXqQDxB9O4Q6aCjo
 O31C5ODTEuC8Qi6ETKQz57egB4mhRu9VzWLtv8dlHXdYcZuzScPizn+NUNsFqabeN9fx
 wgG7SeX2AfeX6nMyoOBmrqclcytyFd4caSRdulEizzbO1BldhIJUvUFX+9el4FAJ+O5d
 Dh43M3jypejHpww4+h9k3xCLkeqb+B+5zO6wQGk/xGCxtSuRfyiZ1irp5Uyxyw3OaBXo
 v6HO4aXgKr0GoVBYa2VABdOSHrfgzATWkXSJZpOI8PNHOaceQJj31s5jdvpQm2ZTvcKc
 vJ8A==
X-Gm-Message-State: AOAM531u7cMvLsSrYE7/HLvp8QAS8mpEYiG5BwZUWWUqciAZr1rdW6LN
 HARRRK/RImPzM3R1Ab5wXve6zdQrSCY=
X-Google-Smtp-Source: ABdhPJwn0zaoJnSvp7caqYDvwC27ySoMhITMCdGC7cD6Vb9O61GJvtDJHbVtst6yea7wXmuT39FPXw==
X-Received: by 2002:a17:906:5049:: with SMTP id
 e9mr5160780ejk.30.1623443077111; 
 Fri, 11 Jun 2021 13:24:37 -0700 (PDT)
Received: from skbuf ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id b24sm2951033edw.4.2021.06.11.13.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:24:35 -0700 (PDT)
Date: Fri, 11 Jun 2021 23:24:34 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
Message-ID: <20210611202434.flnqrzbbxicw5c3t@skbuf>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-3-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610232727.1383117-3-mnhagan88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_132439_237296_F32D7A06 
X-CRM114-Status: GOOD (  18.50  )
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
Message-ID: <20210611202434.GgH2lL7sySokWmHU2SE_Nmq_4B8xgRwsWb5j9qBz634@z>

On Fri, Jun 11, 2021 at 12:27:14AM +0100, Matthew Hagan wrote:
> Add Makefile entries for the Meraki MX64/MX65 series devices.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index f8f09c5066e7..033d9604db60 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -154,6 +154,12 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
>  	bcm958525xmc.dtb \
>  	bcm958622hr.dtb \
>  	bcm958623hr.dtb \
> +	bcm958625-meraki-mx64.dtb \
> +	bcm958625-meraki-mx64-a0.dtb \
> +	bcm958625-meraki-mx64w.dtb \
> +	bcm958625-meraki-mx64w-a0.dtb \
> +	bcm958625-meraki-mx65.dtb \
> +	bcm958625-meraki-mx65w.dtb \
>  	bcm958625hr.dtb \
>  	bcm988312hr.dtb \
>  	bcm958625k.dtb
> -- 
> 2.26.3
> 

It is odd to add the device trees to the Makefile in a separate patch
compared to their actual introduction. Does the tree even compile at
this stage?

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
