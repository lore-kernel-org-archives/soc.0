Return-Path: <SRS0=JLcx=L2=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFEBC11F68
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jul 2021 15:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C6361176
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jul 2021 15:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C6361176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lG5m0DGlna3h0oOzOr+yk0/5IRc9a6F/WlsRRsW/htY=; b=z8kyQw6mv7hSFC
	Jtpt/aNlGZVQLg1xy84rs+6+xE8a4To8i8lzZiRl9NWIahrCZqUf5Ok6wQzQ1niuUxBnnwrPS+4hQ
	g2Dv90Icr9c0ySQeqIrXJyYnICYFQtqVsoA8oqYHhaCovN0kWFoe47Hm0UOwSHuy3MjcP9qXXoJjI
	V8+I2pGiLeHH0+FPBvNFZS3+eY3ntkRrG2aUrtAJeXInffq26DjFtqmjQAOpfXuNNS/eSlRskJSPR
	lCagzujdINwJmcP8wV2U18Av0nwQHpwuVHfkcbMQ7ba24yeR5SCPZETtCKItqNRVJzy3wVFhi7hRw
	BkiCU1cwIeHOtMcU10tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKsW-003OMo-IX; Fri, 02 Jul 2021 15:14:53 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKsO-003OKc-G7
 for linux-arm-kernel@lists.infradead.org; Fri, 02 Jul 2021 15:14:45 +0000
Received: by mail-il1-f175.google.com with SMTP id h3so10021376ilc.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 02 Jul 2021 08:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ut9imKxL6QnSk4qfHyI4LHUlOzS0PtJ0GGDAQ0op66c=;
 b=eDTbNz77ZV6CGNP8U1v2zKuku+PI+pQhqtRqFl44JuoB7/vqkXMaQHc9VeDGhsIhoq
 Pt9b48gETtRFU4xUxq4iSHfEJyx4EBbZ3vgGaQWyDdckaiTndgVlR8z6VB6sCoAo2L/z
 pNzKTEd9EE9KZo3lWST0bNOUqeeGJquwt1STlvEs3ZTjwyMAuJ6a9EHVDUezwlAu6Kvb
 TFbVvwfZ9llwcytFLt5o/Ny8jDlMcDPdREGf+PKaxDYE1Ow2j4Fdh1xRChGh+UgR+KfL
 fQjMuGU106YtZBRyh6Mg/FygSpVD9EChDWA8FQkEdMk3JHoNvZnw3r31RrV8UzuBR4hm
 AKzA==
X-Gm-Message-State: AOAM531v2T35JPqn5G09VU45lWj0t7BnvFd9ghA9D1DMevxoQeIUeNGc
 XhMruJn1fSj3CxAl/k/myg==
X-Google-Smtp-Source: ABdhPJyJQ+7r5oKAFDBY9y+s7apI5nAskZUs0JrjDvLU1ycLlp4sB/Uhwdv5yqQLYQelhXIiDZpx6g==
X-Received: by 2002:a92:dd89:: with SMTP id g9mr333572iln.209.1625238882803;
 Fri, 02 Jul 2021 08:14:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g6sm1846444ilj.65.2021.07.02.08.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:14:41 -0700 (PDT)
Received: (nullmailer pid 437820 invoked by uid 1000);
 Fri, 02 Jul 2021 15:14:37 -0000
Date: Fri, 2 Jul 2021 09:14:37 -0600
From: Rob Herring <robh@kernel.org>
To: Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Message-ID: <20210702151437.GA437656@robh.at.kernel.org>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
 <20210625095000.3358973-5-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625095000.3358973-5-mnhagan88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_081444_621717_008F8FA8 
X-CRM114-Status: GOOD (  13.88  )
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
Message-ID: <20210702151437.cPZ4m2iqXyNOKNYdb4pi-1Hlooc4pf9Im3bu9kndEI8@z>

On Fri, 25 Jun 2021 10:49:51 +0100, Matthew Hagan wrote:
> Add bindings for the Meraki MX64/MX65 series.
> 
> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
